"""
Filename: dml_statement5.cls
Working with DML statements in Apex with Undelete opertation to undelete/update records in Salesforce.
Will provide connection to Salesforce in a later update to file.
"""

// Fetch all the customer records whose name starts with the TEST and append to newly created list
List<apex_customer__c> fetchDelCustomers=[select id from apex_customer__c 
                                          where apex_customer.Name LIKE 'Test%' ALL ROWS];
// Undelete records
undelete fetchDelCustomers;

// Print result
System.debug('SUCCESS, ' + fetchDelCustomers.size() + ' records have been restored');