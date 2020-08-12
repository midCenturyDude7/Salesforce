"""
Filename: dml_statement2.cls
Working with DML statements in Apex with Update opertation to update records in Salesforce.
Will provide connection to Salesforce in a later update to file.
"""

// Fetch the newly created invoice records
// Update the status of invoice records to Paid if not already Paid status
List<APEX_Invoice__c> invoiceList=[select Id, Name, APEX_Status__c, createdDate from APEX_Invoice__c];

// Create a list to store the records which we need to update
List<apex_invoice__c> updatedInvoiceList=new List<apex_invoice__c>();

// Loop through the records of the newly created list and check the status of each of the invoice records
for(Apex_Invoice__c obj:invoiceList)
{
    if(obj.APEX_Status__c != 'Paid')
    {
        obj.APEX_Status__c = 'Paid';
        updatedInvoiceList.add(obj);
    }
}

// Run Update operation
update updatedInvoiceList;

// Print result
System.debug('List has been updated and the updated value of the records are ' + updatedInvoiceList);