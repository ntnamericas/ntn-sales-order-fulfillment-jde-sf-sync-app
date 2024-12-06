%dw 2.0
output application/json
var sfId = (vars.salesforceId)[0].Id
---
{ 
  "compositeRequest": 
  [
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
      	
    "Account_Name__c": if(!isEmpty(vars.inputPayload.Account_Name__c))(vars.inputPayload.Account_Name__c) else if(!isEmpty(vars.refAccId))((vars.refAccId)[0].Id) else "",
    "Actual_Ship_Date__c": vars.inputPayload.Actual_Ship_Date__c,
    "BOL__c": vars.inputPayload.BOL__c,
    "Carrier__c": vars.inputPayload.Carrier__c,
    "Company_Number__c": vars.inputPayload.Company_Number__c,
    "Cost_when_parts_ship__c": vars.inputPayload.Cost_when_parts_ship__c,
    "Customer_Part_Number__c": vars.inputPayload.Customer_Part_Number__c,
    "Freight_Handling_Code_FRTH__c": vars.inputPayload.Freight_Handling_Code_FRTH__c,
    "JDE_Account__c": vars.inputPayload.JDE_Account__c,
    "JDE_Order_Type__c": vars.inputPayload.JDE_Order_Type__c,
    "Line__c": vars.inputPayload.Line__c,
    "Line_Amount__c": vars.inputPayload.Line_Amount__c,
    "Line_Price__c": vars.inputPayload.Line_Price__c,
    "NTN_Part__c": vars.inputPayload.NTN_Part__c,
    "Order__c": vars.inputPayload.Order__c,
    "Order_Line__c": vars.inputPayload.Order_Line__c,
    "Order_Line_Qty__c": vars.inputPayload.Order_Line_Qty__c,
    "Order_Line_Shipped_Qty__c": vars.inputPayload.Order_Line_Shipped_Qty__c,
    
	"StandardOrder__c": if(!isEmpty(vars.inputPayload.StandardOrder__c))((vars.refOrderId)[0].Id) else "",
    "PO__c": vars.inputPayload.PO__c,
    "Product_Part__c": vars.inputPayload.Product_Part__c ,
    "Promise_Date__c": vars.inputPayload.Promise_Date__c,
    "Status__c": vars.inputPayload.Status__c,
   
    "CurrencyIsoCode": vars.inputPayload.CurrencyIsoCode,

    "Name": vars.inputPayload.Name
      }
	  else
	  {
      	
    "Account_Name__c": if(!isEmpty(vars.inputPayload.Account_Name__c))(vars.inputPayload.Account_Name__c) else if(!isEmpty(vars.refAccId))((vars.refAccId)[0].Id) else "",
    "Actual_Ship_Date__c": vars.inputPayload.Actual_Ship_Date__c,
    "BOL__c": vars.inputPayload.BOL__c,
    "Carrier__c": vars.inputPayload.Carrier__c,
    "Company_Number__c": vars.inputPayload.Company_Number__c,
    "Cost_when_parts_ship__c": vars.inputPayload.Cost_when_parts_ship__c,
    "Customer_Part_Number__c": vars.inputPayload.Customer_Part_Number__c,
    "Freight_Handling_Code_FRTH__c": vars.inputPayload.Freight_Handling_Code_FRTH__c,
    "JDE_Account__c": vars.inputPayload.JDE_Account__c,
    "JDE_Order_Type__c": vars.inputPayload.JDE_Order_Type__c,
    //"Line__c": vars.inputPayload.Line__c,
    "Line_Amount__c": vars.inputPayload.Line_Amount__c,
    "Line_Price__c": vars.inputPayload.Line_Price__c,
    "NTN_Part__c": vars.inputPayload.NTN_Part__c,
    "Order__c": vars.inputPayload.Order__c,
    "Order_Line__c": vars.inputPayload.Order_Line__c,
    "Order_Line_Qty__c": vars.inputPayload.Order_Line_Qty__c,
    "Order_Line_Shipped_Qty__c": vars.inputPayload.Order_Line_Shipped_Qty__c,
    
	//"StandardOrder__c": if(!isEmpty(vars.inputPayload.StandardOrder__c))"@{refOrder.records[0].Id}" else "",
    "PO__c": vars.inputPayload.PO__c,
    "Product_Part__c": vars.inputPayload.Product_Part__c ,
    "Promise_Date__c": vars.inputPayload.Promise_Date__c,
    "Status__c": vars.inputPayload.Status__c,
   
    "CurrencyIsoCode": vars.inputPayload.CurrencyIsoCode,

    "Name": vars.inputPayload.Name
      }
    }]
}