public with sharing class CustomerHighlightCardController {

    @AuraEnabled(cacheable=true)
    public static String getUserPhotoUrl(Id contactId) {
        if (contactId == null) {
            return null;
        }

        try {
            List<User> users = [
                SELECT MediumPhotoUrl
                FROM User
                WHERE ContactId = :contactId
                AND IsActive = true
                LIMIT 1
            ];

            if (!users.isEmpty() && users[0].MediumPhotoUrl != null) {
                return users[0].MediumPhotoUrl;
            }
        } catch (Exception e) {
            System.debug('Error fetching user photo: ' + e.getMessage());
        }

        return null;
    }
}
