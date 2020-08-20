"""
Filename: SOQL_relationships.cls
Working with SOQL to understand parent-child relationships -- traversing the relationship fields -- in a Salesforce db.
Will provide connection to Salesforce in a later update to file.
"""

// REQUIREMENT: Create an invoice and simultaneously relate it to a particular customer record via a SOQL query
APEX_Invoice__c objInvoice=new APEX_Invoice__c();

// Relate newly created invoice with customer record
objInvoice.APEX_Customer__c = [SELECT Id FROM APEX_Customer__c WHERE Name = 'Customer Creation Test' LIMIT 1].Id;

// Set status to Pending
objInvoice.APEX_Status__c = 'Pending';

// Insert newly created invoice
insert objInvoice;

// Display results
System.debug('The newly created invoice ' + objInvoice + ' is now linked to the following customer record: ' + objInvoice.APEX_Customer__c + '.');