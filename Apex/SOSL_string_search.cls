"""
Filename: SOSL_string_search.cls
Working with SOSL to search a specified string in a Salesforce db.
Will provide connection to Salesforce in a later update to file.
"""

List<list<sObject>> customerList = [FIND 'ABC*' IN NAME Fields RETURNING 
                                    APEX_Customer__c(Id, APEX_Customer__c.Name, 
                                    APEX_Customer__c.APEX_Customer_Description__c)];

System.debug('The result is ' + customerList);