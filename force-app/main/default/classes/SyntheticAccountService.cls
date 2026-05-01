public class SyntheticAccountService {
    public static Account createAccount(String name, String type) {
        Account acc = new Account(Name = name, Type = type);
        insert acc;
        return acc;
    }

    public static List<Account> getAccountsByType(String type) {
        return [SELECT Id, Name, Type FROM Account WHERE Type = :type];
    }

    public static void updateAccountName(Id accountId, String newName) {
        Account acc = new Account(Id = accountId, Name = newName);
        update acc;
    }

    public static void deleteAccount(Id accountId) {
        Account acc = [SELECT Id FROM Account WHERE Id = :accountId];
        delete acc;
    }
}
