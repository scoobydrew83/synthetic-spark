public class SyntheticContactHelper {
    public static Contact createContact(String firstName, String lastName, Id accountId) {
        Contact c = new Contact(FirstName = firstName, LastName = lastName, AccountId = accountId);
        insert c;
        return c;
    }

    public static List<Contact> getContactsForAccount(Id accountId) {
        return [SELECT Id, FirstName, LastName FROM Contact WHERE AccountId = :accountId];
    }

    public static Integer countContactsForAccount(Id accountId) {
        return [SELECT COUNT() FROM Contact WHERE AccountId = :accountId];
    }
}
