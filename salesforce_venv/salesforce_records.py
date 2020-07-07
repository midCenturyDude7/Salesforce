"""
Filename: salesforce_records.py
Working with record management in Salesforce with Python
"""

# Import Dependencies
from simple_salesforce import Salesforce, SFType, SalesforceLogin
from pandas import DataFrame, read_csv
import json
from pprint import pprint as pp

login = json.load(open('login.json'))
username = login['username']
password = login['password']
token = login['token']

session_id, instance = SalesforceLogin(username=username, password=password, security_token=token)

sOpportunity = SFType(object_name='opportunity', session_id=session_id, sf_instance=instance)

data = dict(Name='Test Opportunity MG', StageName='Prospecting', CloseDate='2020-07-15', Amount='10000.00', Type='New Customer')
rec = sOpportunity.update(record_id='0063h000007nGmIAAU', data=data)

rec = sOpportunity.delete(record_id='0063h000007nGmIAAU')
print(rec)
