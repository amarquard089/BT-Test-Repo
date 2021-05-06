trigger CreateOppOnAccCreation on Account (before insert) {
    for (Account a : Trigger.New) {
        CreateOpp.createRecord(a);
    }
}