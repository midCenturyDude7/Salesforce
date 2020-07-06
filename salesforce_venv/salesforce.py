"""
Filename: salesforce.py
Attempting to connect to Salesforce account with Python and simple_salesforce library
"""

# Import Libraries
from simple_salesforce import Salesforce, SFType, SalesforceLogin
from pandas import DataFrame, read_csv
import json
from pprint import pprint as pp

sf = Salesforce(instance_url='https://resilient-wolf-8defoo-dev-ed.lightning.force.com', session_id='')


pp(sf)

login = json.load(open('login.json'))
username = login['username']
password = login['password']
token = login['token']

session_id, instance = SalesforceLogin(username=username, password=password, security_token=token)

print(session_id, instance)