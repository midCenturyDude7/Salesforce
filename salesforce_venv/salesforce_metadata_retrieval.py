"""
Filename: salesforce_records.py
Working with record management in Salesforce with Python
"""

# Import Dependencies
from simple_salesforce import Salesforce, SFType, SalesforceLogin
from pandas import DataFrame, read_csv, set_option
import json
from pprint import pprint as pp

set_option('display.max_columns', 50)

login = json.load(open('login.json'))
username = login['username']
password = login['password']
token = login['token']

session_id, instance = SalesforceLogin(username=username, password=password, security_token=token)

# sf = Salesforce(instance=instance, session_id=session_id)

# metadata = DataFrame(sf.describe()['sobjects'])
# metadata.to_csv(r'C:\Users\mjgri\Programming\Salesforce\salesforce_venv' + '\\metadata.csv')

sAccount = SFType('account', session_id=session_id, sf_instance=instance)

sAccount_meta = DataFrame(sAccount.describe()['fields'])
sAccount_meta.to_csv(r'C:\Users\mjgri\Programming\Salesforce\salesforce_venv' + '\\Account_Metadata.csv')
