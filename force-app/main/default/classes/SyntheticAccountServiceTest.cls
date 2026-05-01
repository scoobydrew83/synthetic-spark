@IsTest
private class SyntheticAccountServiceTest {
    @IsTest
    static void testCreateAccount() {
        Account acc = SyntheticAccountService.createAccount('Test Account', 'Prospect');
        System.assertNotEquals(null, acc.Id, 'Account should be created');
        System.assertEquals('Test Account', acc.Name, 'Name should match');
    }

    @IsTest
    static void testGetAccountsByType() {
        SyntheticAccountService.createAccount('Test Account 1', 'Prospect');
        SyntheticAccountService.createAccount('Test Account 2', 'Prospect');
        List<Account> accounts = SyntheticAccountService.getAccountsByType('Prospect');
        System.assertEquals(2, accounts.size(), 'Should return 2 accounts');
    }

    @IsTest
    static void testUpdateAccountName() {
        Account acc = SyntheticAccountService.createAccount('Old Name', 'Customer');
        SyntheticAccountService.updateAccountName(acc.Id, 'New Name');
        Account updated = [SELECT Name FROM Account WHERE Id = :acc.Id];
        System.assertEquals('New Name', updated.Name, 'Name should be updated');
    }

    @IsTest
    static void testDeleteAccount() {
        Account acc = SyntheticAccountService.createAccount('To Delete', 'Other');
        SyntheticAccountService.deleteAccount(acc.Id);
        List<Account> remaining = [SELECT Id FROM Account WHERE Id = :acc.Id];
        System.assertEquals(0, remaining.size(), 'Account should be deleted');
    }
}
