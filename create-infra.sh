#!/bin/bash
az login --service-principal -u {{ client_id }} -p {{ secret }} --tenant {{ tenant }}
az account set --subscription {{ subscription_id }}

//    - name: core.json
//      resource_group: own
//    - name: dns.json
//      resource_group: own
//    - name: loganalytics.json
//      resource_group: own
//    - name: aks.json
//      resource_group: own
//    - name: agw.json
//      resource_group: own
//    - name: createDnsRecordSet.json
//      resource_group: dnsRG

//Creating newtork        
az group create --name RT-AKSR202004 --location "Central US"
az deployment group create --name AzureDeployment  --resource-group RT-AKSR202004  --template-file core.json --parameters @core.params.json
