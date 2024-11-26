%dw 2.0
output application/json
fun julianDateToNormalDate(julianDate) = 
	(((19 + (julianDate[0] as Number))* 100) default "" 
	+ (julianDate[1 to 2] as Number) default "" ++ julianDate[3 to 5] default "")
	as Date {format: "yyyyDDD"} as Date {format:"yyyy-MM-dd"} default null
---
payload map ((item, index) -> {
Account_Name__c : trim(item.AXDC),
Actual_Ship_Date__c :  julianDateToNormalDate(trim(item.SDADDJ))as Date default null,
BOL__c: trim(item.SDSHPN) as String default null ,
Carrier__c : trim(item.SDCARS) default null ++ "-" ++ trim(item.ABALPH) default null,
Company_Number__c: trim(item.SDKCOO)  ,
Cost_when_parts_ship__c: (item.SDUNCS)/10000 default null,
Customer_Part_Number__c : trim(item.IVCITM) ,
Freight_Handling_Code_FRTH__c : trim(item.FREIGHT_DRKY) default null ++ "-" ++ trim(item.DRDLO1_FREIGHT) default null,
JDE_Account__c : trim(item.SDSHAN) ,
JDE_Order_Type__c : trim(item.SDDCTO),
Line__c : (if (trim(item.SDVR02) contains  "SA") (((item.SDVR02) splitBy  "SA-" )[1])[0 to 7] else null)++ ":" ++ "(" ++ trim(item.SDDOCO) default null ++ "-" ++ ((trim(item.SDLNID) default null /1000)) ++ ")" default null,
Line_Amount__c : trim(item.SDAEXP)/100 default null,
Line_Price__c : trim(item.SDUPRC)/10000 default null ,
NTN_Part__c  : trim(item.SDLITM) ,
Order__c   : trim(item.SDDOCO) as Number default null,
Order_Line__c  : trim(item.SDLNID)/1000 as Number  default null,
Order_Line_Qty__c  :trim(item.SDUORG) as Number default null,
Order_Line_Shipped_Qty__c  : trim(item.SDSOQS) as Number default null,
StandardOrder__c   : if (trim(item.SDVR02) contains  "SA") (((item.SDVR02) splitBy  "SA-" )[1])[0 to 7] else "",
PO__c     : trim(item.SDVR01),
Product_Part__c  : trim(item.IMDRAW) default null ++ "-" ++ trim(item.IBPRP1) default null ++ "-" ++ trim(item.IBSRP4) default null ,
Promise_Date__c  :  julianDateToNormalDate(trim(item.SDPPDJ))as Date default null,
Status__c       : trim(item.DRKY) default null ++ "-" ++ trim(item.DRDL01) default null,
CurrencyIsoCode  : trim(item.SDCRCD) ,
Name:    (if (trim(item.SDVR02) contains  "SA") (((item.SDVR02) splitBy  "SA-" )[1])[0 to 7] else null) ++ ":" ++ "(" ++ trim(item.SDDOCO) default null ++ "-" ++ ((trim(item.SDLNID)/1000)) default null ++ ")" default null
})