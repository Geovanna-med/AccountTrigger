trigger ColorImportanceTrigger on Account (after insert, after update) {

    List<Opportunity> opp = new List<Opportunity>();

    for (Account a : Trigger.new) {

        if (a.Anual_Revenue_Date__c != null) {

            if (a.Anual_Revenue_Date__c != Date.today()) {
                 Opportunity oppOrange = new Opportunity(AccountId = a.Id, Name = 'Opportunity 1', CloseDate = Date.today(), StageName = 'Prospecting', Importance_Level__c = opportunities_importance__mdt.getInstance('Orange').MasterLabel);
                 opp.add(oppOrange);

                } else {
                    if ((a.AnnualRevenue >= opportunities_importance__mdt.getInstance('Red').Min_revenue__c) && 
                    (a.AnnualRevenue <= opportunities_importance__mdt.getInstance('Red').Max_revenue__c)) {
                        Opportunity oppRed = new Opportunity(AccountId = a.Id, Name = 'Opportunity 2', CloseDate = Date.today(), StageName = 'Prospecting', Importance_Level__c = opportunities_importance__mdt.getInstance('Red').MasterLabel);
                        opp.add(oppRed);

                    } else {
                        if ((a.AnnualRevenue >= opportunities_importance__mdt.getInstance('Yellow').Min_revenue__c) && 
                        (a.AnnualRevenue <= opportunities_importance__mdt.getInstance('Yellow').Max_revenue__c)) {
                            Opportunity oppYellow = new Opportunity(AccountId = a.Id, Name = 'Opportunity 3', CloseDate = Date.today(), StageName = 'Prospecting', Importance_Level__c = opportunities_importance__mdt.getInstance('Yellow').MasterLabel);
                            opp.add(oppYellow);

                        } else {
                            if (a.AnnualRevenue >= opportunities_importance__mdt.getInstance('Green').Min_revenue__c) {
                                Opportunity oppGreen = new Opportunity(AccountId = a.Id, Name = 'Opportunity 4', CloseDate = Date.today(), StageName = 'Prospecting', Importance_Level__c = opportunities_importance__mdt.getInstance('Green').MasterLabel);
                                opp.add(oppGreen);
                            }
                        }
                    }
                }
        }
    } insert opp;
}

