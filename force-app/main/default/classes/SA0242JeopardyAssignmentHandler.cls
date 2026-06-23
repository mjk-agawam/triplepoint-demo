public with sharing class SA0242JeopardyAssignmentHandler {
    private static final Id TARGET_APPOINTMENT_ID = '08pg8000000Dzk1AAC';
    private static final Id ALAN_RESOURCE_ID = '0Hng80000005ZdFCAU';
    private static final Id HARRY_RESOURCE_ID = '0Hng80000005ZdCCAU';

    public static void handle(List<AssignedResource> newRows) {
        if (newRows == null || newRows.isEmpty()) {
            return;
        }

        ServiceAppointment updateRow;
        for (AssignedResource ar : newRows) {
            if (ar.ServiceAppointmentId != TARGET_APPOINTMENT_ID) {
                continue;
            }
            if (ar.ServiceResourceId == ALAN_RESOURCE_ID) {
                updateRow = new ServiceAppointment(
                    Id = TARGET_APPOINTMENT_ID,
                    FSL__InJeopardy__c = false,
                    FSL__InJeopardyReason__c = null
                );
            } else if (ar.ServiceResourceId == HARRY_RESOURCE_ID) {
                updateRow = new ServiceAppointment(
                    Id = TARGET_APPOINTMENT_ID,
                    FSL__InJeopardy__c = true,
                    FSL__InJeopardyReason__c = null
                );
            }
        }

        if (updateRow != null) {
            update updateRow;
        }
    }
}
