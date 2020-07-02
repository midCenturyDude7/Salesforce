"""
Filename: salesforce.py
Attempting to connect to Salesforce account with Python and simple_salesforce library
"""

# Import Libraries
from simple_salesforce import Salesforce

sf = Salesforce(
    username='mgriffes@resilient-wolf-8defoo.com',
    password='HenryEmerson3807!',
    security_token='pImtqwRyuTvfskPnQC6XcxSVa'
)

sf_data = sf.query_all("SELECT Owner.Name, store_id__c, account_number__c, username__c, password__c, program_status__c, FROM Account WHERE program_status__c IN ('Live','Test')")

sf_df = pd.DataFrame(sf_data['records']).drop(columns='attributes')