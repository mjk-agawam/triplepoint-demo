public with sharing class RelatedListSplitQuickLinksController {
    private static final List<String> DEFAULT_RELATIONSHIP_NAMES = new List<String>{
        'ServiceAppointments',
        'WorkOrderLineItems',
        'ProductsRequired',
        'ProductsConsumed',
        'WorkPlans',
        'WorkSteps',
        'SkillRequirements',
        'OpenActivities',
        'ActivityHistories',
        'Tasks',
        'Emails',
        'ContentDocumentLinks',
        'NotesAndAttachments',
        'Attachments',
        'Notes'
    };
    public class RelatedListLink {
        @AuraEnabled public String label;
        @AuraEnabled public String relationshipName;
        @AuraEnabled public Integer recordCount;
        @AuraEnabled public String url;
    }

    public class RelatedListSplitResult {
        @AuraEnabled public List<RelatedListLink> withData = new List<RelatedListLink>();
        @AuraEnabled public List<RelatedListLink> withoutData = new List<RelatedListLink>();
    }

    @AuraEnabled(cacheable=true)
    public static RelatedListSplitResult getRelatedListLinks(Id recordId, String relationshipNamesCsv) {
        RelatedListSplitResult result = new RelatedListSplitResult();
        if (recordId == null) {
            return result;
        }

        Schema.SObjectType parentType = recordId.getSObjectType();
        Schema.DescribeSObjectResult parentDescribe = parentType.getDescribe();
        String parentApiName = parentDescribe.getName();
        Set<String> requested = parseRelationshipNames(relationshipNamesCsv);

        Map<String, Schema.ChildRelationship> byRelationshipName = new Map<String, Schema.ChildRelationship>();
        for (Schema.ChildRelationship childRel : parentDescribe.getChildRelationships()) {
            String relationshipName = childRel.getRelationshipName();
            if (!String.isBlank(relationshipName)) {
                byRelationshipName.put(relationshipName, childRel);
            }
        }

        for (String relationshipName : requested) {
            Schema.ChildRelationship childRel = byRelationshipName.get(relationshipName);
            if (childRel == null) {
                continue;
            }

            Schema.SObjectType childType = childRel.getChildSObject();
            Schema.DescribeSObjectResult childDescribe = childType.getDescribe();
            if (!childDescribe.isQueryable()) {
                continue;
            }

            String parentFieldApi = childRel.getField().getDescribe().getName();
            if (String.isBlank(parentFieldApi)) {
                continue;
            }

            Integer recordCount;
            try {
                String countQuery =
                    'SELECT COUNT() FROM ' + childDescribe.getName() +
                    ' WHERE ' + parentFieldApi + ' = :recordId';
                recordCount = Database.countQuery(countQuery);
            } catch (Exception ex) {
                continue;
            }

            RelatedListLink link = new RelatedListLink();
            link.label = childDescribe.getLabelPlural();
            link.relationshipName = relationshipName;
            link.recordCount = recordCount;
            link.url =
                '/lightning/r/' + parentApiName + '/' + String.valueOf(recordId) +
                '/related/' + relationshipName + '/view';

            if (recordCount > 0) {
                result.withData.add(link);
            } else {
                result.withoutData.add(link);
            }
        }

        sortLinks(result.withData);
        sortLinks(result.withoutData);
        return result;
    }

    private static Set<String> parseRelationshipNames(String relationshipNamesCsv) {
        Set<String> names = new Set<String>();
        if (String.isBlank(relationshipNamesCsv)) {
            names.addAll(DEFAULT_RELATIONSHIP_NAMES);
            return names;
        }

        for (String rawName : relationshipNamesCsv.split(',')) {
            String trimmedName = rawName == null ? null : rawName.trim();
            if (!String.isBlank(trimmedName)) {
                names.add(trimmedName);
            }
        }
        if (names.isEmpty()) {
            names.addAll(DEFAULT_RELATIONSHIP_NAMES);
        }
        return names;
    }

    private static void sortLinks(List<RelatedListLink> links) {
        links.sort(new RelatedListLinkComparator());
    }

    private class RelatedListLinkComparator implements Comparator<RelatedListLink> {
        public Integer compare(RelatedListLink a, RelatedListLink b) {
            String left = a == null || a.label == null ? '' : a.label.toLowerCase();
            String right = b == null || b.label == null ? '' : b.label.toLowerCase();
            if (left == right) {
                return 0;
            }
            return left < right ? -1 : 1;
        }
    }
}
