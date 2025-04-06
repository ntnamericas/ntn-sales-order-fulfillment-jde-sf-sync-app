%dw 2.0
output application/java
---
{ 
  "compositeRequest": 
  [
    ({
      "method": "GET",
      "referenceId": "refAccount",
      "url": "/services/data/v57.0/query/?q=SELECT id from Account where JDE_AddressNumber__c = $(vars.inputPayload.JDE_Account__c)"
    }) if(!isEmpty(vars.inputPayload.JDE_Account__c)),
    ({
      "method": "GET",
      "referenceId": "refOrder",
      "url": "/services/data/v57.0/query/?q=SELECT id from Order where OrderNumber = '$(vars.inputPayload.StandardOrder__c)'"
    } ) if(!isEmpty(vars.inputPayload.StandardOrder__c))
    ]}
    