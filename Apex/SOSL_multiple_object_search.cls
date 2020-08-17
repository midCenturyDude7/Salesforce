"""
Filename: SOSL_multiple_object_search.cls
Working with SOSL to search across multiple objects in a Salesforce db.
Will provide connection to Salesforce in a later update to file.
"""

List<List<sObject>> customerAccountSearchList=new List<List<sObject>>();

// SOSL query will search for the text 'ABC' string in the customer object and account object fields
customerAccountSearchList = [FIND '*ABC*' IN ALL Fields RETURNING
                             APEX_Customer__c(Id, APEX_Customer__c.Name, APEX_Customer_Description__c), 
                             Account(Id, Name)];

// Display results
System.debug('The results are ' + customerAccountSearchList);

// Create new list to store only the customer records that meet the search query req's
APEX_Customer__c[] searchedCustomer=(List<APEX_Customer__c>)customerAccountSearchList[0];

// Create new list to store only the account records that meet the search query req's
Account[] searchedAccount=(List<Account>)customerAccountSearchList[1];

// Display results
System.debug('Customer records are ' + searchedCustomer);
System.debug('Account records are ' + searchedAccount);