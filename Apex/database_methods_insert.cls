"""
Filename: database_methods_insert.cls
Working with database methods in Apex with insert opertation in Salesforce.
Will provide connection to Salesforce in a later update to file.
"""

// Create custom object
APEX_Customer__c objCust=new APEX_Customer__c();

// Name custom object
objCust.Name = 'Test';

// Insert custom object
insert objCust;

// Create two invoices that correspond to the newly created customer
// Create an empty list for invoices to be added to
List<apex_invoice__c> InvoiceListToInsert=new List<apex_invoice__c>();

// Create first Invoice object
APEX_Invoice__c objNewInvoice=new APEX_Invoice__c();

// Set status of invoice to pending
objNewInvoice.Apex_Status__c='Pending';

// Set status of customer
objNewInvoice.Apex_Customer__c=objCust.id;

// Provide value for amount paid field
objNewInvoice.Apex_Amount_Paid__c=1000;

// Add first invoice to empty list
InvoiceListToInsert.add(objNewInvoice);

// Create second invoice object
APEX_Invoice__c objNewInvoice2=new APEX_invoice__c();

// Set status of invoice to pending
objNewInvoice2.Apex_Status__c='Pending';

// Provide value for amount paid field
objNewInvoice.Apex_Amount_Paid__c=700;

// Add second invoice to empty list
InvoiceListToInsert.add(objNewInvoice2);    

// Insert records into db
Database.SaveResult[] srList=Database.insert(InvoiceListToInsert, false);

for(Database.SaveResult sr:srList)
{
    if(sr.isSuccess())
    {
        System.debug('Successfully inserted the invoice: ' + sr.getId());
    }
    else
    {
        for(Database.Error objErr:sr.getErrors())
        {
            System.debug('The following error has occurred');
            System.debug(objErr.getStatusCode() + ' : ' + objErr.getMessage());
            System.debug('Invoice object fields which are affected: ' +  objErr.getFields());
        }
    }
}