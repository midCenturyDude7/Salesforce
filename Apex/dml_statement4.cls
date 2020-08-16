"""
Filename: dml_statement4.cls
Working with DML statements in Apex with Delete opertation to delete/update records in Salesforce.
Will provide connection to Salesforce in a later update to file.
"""

// Fetch all the customer records whose name starts with the TEST and append to newly created list
List<apex_customer__c> customerListToDel=[select id from apex_customer__c 
                                          where apex_customer.Name LIKE 'Test%'];
// Delete records
delete customerListToDel;

// Print result
System.debug('SUCCESS, ' + customerListToDel.size() + ' records have been deleted');