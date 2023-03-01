@isTest
public class ColorImportanceTriggerTest {

    @isTest static void OrangeImportanceLevel(){
        Account a = new Account();
        a.Name = 'teresa';
        a.AnnualRevenue = 15000;
        a.Anual_Revenue_Date__c = date.newInstance(2023, 08, 05);
        
        test.startTest();
        insert a;
        test.stopTest();
        
        Opportunity verifyOpp1 = [SELECT Name, Importance_Level__c  FROM Opportunity WHERE Importance_Level__c ='Orange'];
        system.assertEquals('Opportunity 1', verifyOpp1.Name);
    }
    
    @isTest static void RedImportanceLevel(){
        Account a = new Account();
        a.Name = 'Maria';
        a.AnnualRevenue = 5000;
        a.Anual_Revenue_Date__c = date.today();
        
        test.startTest();
        insert a;
        test.stopTest();
        
        Opportunity verifyOpp2 = [SELECT Name, Importance_Level__c  FROM Opportunity WHERE Importance_Level__c ='Red'];
        system.assertEquals('Opportunity 2', verifyOpp2.Name);
    }
    
    @isTest static void YellowImportanceLevel(){
        Account a = new Account();
        a.Name = 'Geovanna';
        a.AnnualRevenue = 25000;
        a.Anual_Revenue_Date__c = date.today();
        
        test.startTest();
        insert a;
        test.stopTest();
        
        Opportunity verifyOpp3 = [SELECT Name, Importance_Level__c  FROM Opportunity WHERE Importance_Level__c ='Yellow'];
        system.assertEquals('Opportunity 3', verifyOpp3.Name);
    }
    
    @isTest static void GreenImportanceLevel(){
        Account a = new Account();
        a.Name = 'Veronica';
        a.AnnualRevenue = 60000;
        a.Anual_Revenue_Date__c = date.today();
        
        test.startTest();
        insert a;
        test.stopTest();
        
        Opportunity verifyOpp4 = [SELECT Name, Importance_Level__c  FROM Opportunity WHERE Importance_Level__c ='Green'];
        system.assertEquals('Opportunity 4', verifyOpp4.Name);
    }
}