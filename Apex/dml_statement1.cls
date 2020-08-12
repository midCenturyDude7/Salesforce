"""
Filename: dml_statement1.cls
Working with DML statements in Apex with Insert opertation to update records in Salesforce.
Will provide connection to Salesforce in a later update to file.
"""

//Create customer object
APEX_Customer__c objCust=new APEX_Customer__c();
objCust.Name='Test ABC';

// Insert newly created customer record with insert operation
insert objCust;

// Create an invoice for newly created and inserted customer record
APEX_Invoice__c objNewInvoice=new APEX_Invoice__c();

// Set status of invoice to pending
objNewInvoice.APEX_Status__c='Pending';

// Provide amount of invoice to be paid
objNewInvoice.APEX_Paid__c=1000;

// Map invoice to customer and create relationship between customer and invoice records
objNewInvoice.APEX_Customer__c=objCust.id;

// Insert newly created invoice record with insert operation
insert objNewInvoice;

// Debug
System.debug('The customer we added is: ' + objCust + '. And, the corresponding invoice for the customer is: ' + objNewInvoice)