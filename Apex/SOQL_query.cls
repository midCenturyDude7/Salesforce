"""
Filename: SOQL_query.cls
Working with SOQL to quary records in a Salesforce db.
Will provide connection to Salesforce in a later update to file.
"""

// REQUIREMENT: Create a list of invoice records which are created same day and do not include the customer, 'Test'
// Fetch records via SOQL query and store results in a list

// Create empty list to store records
List<APEX_Invoice__c> invoiceList=new List<APEX_Invoice__c>(); 

// Query records
invoiceList = [SELECT Id, Name, APEX_Customer__r.Name, APEX_Status__c FROM APEX_Invoice__c WHERE createdDate=today AND APEX_Customer__r.Name != 'Test'];

// Display results
System.debug('The total number of invoice records is ' + invoiceList.size() + ' in the list.');

// Loop through each record in the list and print it out
for(APEX_Invoice__c objInvoice:invoiceList)
{
    System.debug('Invoice record ' + objInvoice); // print the record each invoice included in the list set forth by the query statement
}