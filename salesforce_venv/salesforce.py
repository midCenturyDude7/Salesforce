"""
Filename: salesforce.py
Attempting to connect to Salesforce account with Python and simple_salesforce library
"""

# Import Libraries
from simple_salesforce import Salesforce, SFType, SalesforceLogin
from pandas import DataFrame, read_csv
import json
from pprint import pprint as pp

# sf = Salesforce(instance_url='https://resilient-wolf-8defoo-dev-ed.lightning.force.com', session_id='')

# set_option('display.max_columns', 20)

login = json.load(open('login.json'))
username = login['username']
password = login['password']
token = login['token']

session_id, instance = SalesforceLogin(username=username, password=password, security_token=token)

sf = Salesforce(instance=instance, session_id=session_id)

SOQL = 'SELECT Id, Name, StageName, AccountId FROM Opportunity'

def QueryData(SOQL):
    qryResult = sf.query(SOQL)
    print("Total records: " + str(qryResult['totalSize']))
    data = []

    isDone = qryResult['done']

    if isDone:
        for rec in qryResult['records']:
            rec.pop('attributes', None)
            data.append(rec)
        return data
    
    while not isDone:
        try:
            if not qryResult['done']:
                for rec in qryResult['records']:
                    rec.pop('attributes', None)
                    data.append(rec)
                qryResult = sf.query_more(qryResult['nextRecordsUrl'], True)
            else:
                for rec in qryResult['records']:
                    rec.pop('attributes', None)
                    data.append(rec)
                    isDone = True
                print('Query Complete')

        except NameError:
            for rec in qryResult['records']:
                rec.pop('attributes', None)
                data.append(rec)
            qryResult = sf.query_more(qryResult['nextRecordsUrl'], True)
    return data

print(DataFrame(QueryData(SOQL)))