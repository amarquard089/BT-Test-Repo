@isTest
private class CreateOppTest {
    @isTest static void TestCreateOppOnAccCreationTrigger() {
        Account a = new Account(Name = 'Test Account2');
        String oppName = a.Name + ' Opp';
        Test.startTest();
        insert a;
        Test.stopTest();
        System.assertEquals([Select Id From Opportunity where Name = :oppName].size(), 1);
    }
}