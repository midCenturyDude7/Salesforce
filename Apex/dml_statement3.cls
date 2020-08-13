"""
Filename: dml_statement3.cls
Working with DML statements in Apex with Upsert opertation to insert and update records in Salesforce.
Will provide connection to Salesforce in a later update to file.
"""

// Fetch the record to be updated
// Update the description of the record with external id is A03
// Create 10 more customer records

// Create list that will store all the customer records
List<Apex_customer__c>customerList=new List<Apex_customer__c>();

// Query statement to fetch record
Apex_customer__c cus=[select id, apex_external_id__c, apex_customer_description__c from apex_customer__c 
                      where apex_external_id__c='A03'];

// Update customer description
cus.apex_customer_description__c='Unstable and somewhat volatile temperment.';

// Upsert customer record into newly created list
customerList.add(cus);

// Create 10 new records
for(Integer i=1;i<=10;i++)
{
    apex_customer__c objCust=new apex_customer__c(name='Test' + i, apex_external_id__c='A03' + + '.' + i)
    customerList.add(objCust);
}

// Upsert operation
upsert customerList;