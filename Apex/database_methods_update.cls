"""
Filename: database_methods_update.cls
Working with database methods in Apex to modify an existing sObject record in Salesforce.
Will provide connection to Salesforce in a later update to file.
"""

// Fetch the invoice records
// Update the status fields to paid

// Query all the invoices and add to newly created list
List<Apex_Invoice__c> invoiceList=[select id, name, Apex_Status__c, createdDate from Apex_Invoice__c];

// Create a list to store the records which need to be updated
List<Apex_Invoice__c> updatedInvoiceList=new List<Apex_Invoice__c>();

// Loop through all the invoices and update the status to paid
for(Apex_Invoice__c objInvoice:invoiceList)
{
    if(objInvoice.Apex_Status__c == 'Pending')
    {
        objInvoice.Apex_Status__c = 'Paid';
        updatedInvoiceList.add(objInvoice);
    }
}

// Update operation and save the result to db
Database.saveResult[] srList=Database.update(updatedInvoiceList, False);

// Iterate through each returned result/record via for loop and display updated invoice record by ID
for(Database.saveResult sr:srList)
{
    if(sr.isSuccess())
    {
        System.debug('Successfully updated Invoice: ' + sr.getId());
    }
    else 
    {
        for(Database.Error objErr:sr.getErrors())
        {
            System.debug('The following error occured: ');
            System.debug(objErr.getStatusCode() + ' : ' + objErr.getMessage());
            System.debug('Invoice object field which are affected byt the error are: ' + objErr.getFields());
        }
    }
}