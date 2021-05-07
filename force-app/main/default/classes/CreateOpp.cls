public class CreateOpp {
    public static void createRecord(Account a) {
        Opportunity o = new Opportunity();
        o.Name = a.Name + ' Opp';
        o.CloseDate = System.today().addDays(30);
        o.StageName = 'Prospecting';
        insert o;
    }
}