%dw 2.0
output application/json
var sfId = (vars.salesforceId)[0].Id
---
{ 
  "compositeRequest": 
  [
    ({
      "method": "GET",
      "referenceId": "refAccount",
      "url": "/services/data/v57.0/query/?q=SELECT id from Account where JDE_AddressNumber__c = $(payload.JDE_Account__c)"
    }) if(!isEmpty(payload.JDE_Account__c)),
    ({
      "method": "GET",
      "referenceId": "refOrder",
      "url": "/services/data/v57.0/query/?q=SELECT id from Order where OrderNumber = '$(payload.StandardOrder__c)'"
    } ) if(!isEmpty(payload.StandardOrder__c)),
    {
         "method": if (isEmpty(sfId))
                     "POST" 
                else 
                     "PATCH",
      "referenceId": "refUpdateSalesOrderDetails",
      "url": if (isEmpty(sfId)) 
                    "/services/data/v57.0/sobjects/Sales_Order_Fulfillment__c" 
               else 
                     "/services/data/v57.0/sobjects/Sales_Order_Fulfillment__c/$(sfId)",
       "body": if (isEmpty(sfId)) {
      	
    "Account_Name__c": if(!isEmpty(payload.Account_Name__c))(payload.Account_Name__c) else if(!isEmpty("@{refAccount.records[0].Id}"))"@{refAccount.records[0].Id}" else "",
    "Actual_Ship_Date__c": payload.Actual_Ship_Date__c,
    "BOL__c": payload.BOL__c,
    "Carrier__c": payload.Carrier__c,
    "Company_Number__c": payload.Company_Number__c,
    "Cost_when_parts_ship__c": payload.Cost_when_parts_ship__c,
    "Customer_Part_Number__c": payload.Customer_Part_Number__c,
    "Freight_Handling_Code_FRTH__c": payload.Freight_Handling_Code_FRTH__c,
    "JDE_Account__c": payload.JDE_Account__c,
    "JDE_Order_Type__c": payload.JDE_Order_Type__c,
    "Line__c": payload.Line__c,
    "Line_Amount__c": payload.Line_Amount__c,
    "Line_Price__c": payload.Line_Price__c,
    "NTN_Part__c": payload.NTN_Part__c,
    "Order__c": payload.Order__c,
    "Order_Line__c": payload.Order_Line__c,
    "Order_Line_Qty__c": payload.Order_Line_Qty__c,
    "Order_Line_Shipped_Qty__c": payload.Order_Line_Shipped_Qty__c,
    
	"StandardOrder__c": if(!isEmpty(payload.StandardOrder__c))"@{refOrder.records[0].Id}" else "",
    "PO__c": payload.PO__c,
    "Product_Part__c": payload.Product_Part__c ,
    "Promise_Date__c": payload.Promise_Date__c,
    "Status__c": payload.Status__c,
   
    "CurrencyIsoCode": payload.CurrencyIsoCode,

    "Name": payload.Name
      }
	  else
	  {
      	
    "Account_Name__c": if(!isEmpty(payload.Account_Name__c))(payload.Account_Name__c) else if(!isEmpty("@{refAccount.records[0].Id}"))"@{refAccount.records[0].Id}" else "",
    "Actual_Ship_Date__c": payload.Actual_Ship_Date__c,
    "BOL__c": payload.BOL__c,
    "Carrier__c": payload.Carrier__c,
    "Company_Number__c": payload.Company_Number__c,
    "Cost_when_parts_ship__c": payload.Cost_when_parts_ship__c,
    "Customer_Part_Number__c": payload.Customer_Part_Number__c,
    "Freight_Handling_Code_FRTH__c": payload.Freight_Handling_Code_FRTH__c,
    "JDE_Account__c": payload.JDE_Account__c,
    "JDE_Order_Type__c": payload.JDE_Order_Type__c,
    //"Line__c": payload.Line__c,
    "Line_Amount__c": payload.Line_Amount__c,
    "Line_Price__c": payload.Line_Price__c,
    "NTN_Part__c": payload.NTN_Part__c,
    "Order__c": payload.Order__c,
    "Order_Line__c": payload.Order_Line__c,
    "Order_Line_Qty__c": payload.Order_Line_Qty__c,
    "Order_Line_Shipped_Qty__c": payload.Order_Line_Shipped_Qty__c,
    
	//"StandardOrder__c": if(!isEmpty(payload.StandardOrder__c))"@{refOrder.records[0].Id}" else "",
    "PO__c": payload.PO__c,
    "Product_Part__c": payload.Product_Part__c ,
    //"Promise_Date__c": payload.Promise_Date__c,
    "Status__c": payload.Status__c,
   
    "CurrencyIsoCode": payload.CurrencyIsoCode,

    "Name": payload.Name
      }
    }]
}