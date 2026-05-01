@IsTest
private class SyntheticContactHelperTest {
    @IsTest
    static void testCreateContact() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        Contact c = SyntheticContactHelper.createContact('John', 'Doe', acc.Id);
        System.assertNotEquals(null, c.Id, 'Contact should be created');
        System.assertEquals('John', c.FirstName, 'FirstName should match');
        System.assertEquals('Doe', c.LastName, 'LastName should match');
    }

    @IsTest
    static void testGetContactsForAccount() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        SyntheticContactHelper.createContact('Alice', 'Smith', acc.Id);
        SyntheticContactHelper.createContact('Bob', 'Jones', acc.Id);
        List<Contact> contacts = SyntheticContactHelper.getContactsForAccount(acc.Id);
        System.assertEquals(2, contacts.size(), 'Should return 2 contacts');
    }

    @IsTest
    static void testCountContactsForAccount() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        SyntheticContactHelper.createContact('Alice', 'Smith', acc.Id);
        Integer count = SyntheticContactHelper.countContactsForAccount(acc.Id);
        System.assertEquals(1, count, 'Should count 1 contact');
    }
}
