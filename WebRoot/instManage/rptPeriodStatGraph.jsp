<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
List callLineCahart = (List)request.getAttribute("rsPeriodGraph");
Map<String, String> almMap = null;

String timeArray = "";

if (callLineCahart.size() > 0)
{
	timeArray = "[";

	for(int i=0;i<callLineCahart.size();i++){
	    almMap = (Map)callLineCahart.get(i);
	    timeArray += "['" + String.valueOf(almMap.get("prod_dt")) + "',";
	    timeArray += "'" + String.valueOf(almMap.get("start_value")) + "',";
	    timeArray += "'" + String.valueOf(almMap.get("high_value")) + "',";
	    timeArray += "'" + String.valueOf(almMap.get("low_value")) + "',";
	    if (i == callLineCahart.size()-1)
		    timeArray += "'" + String.valueOf(almMap.get("last_end")) + "'],";
	   else
		    timeArray += "'" + String.valueOf(almMap.get("end_value")) + "'],";
	}
	timeArray = timeArray.substring(0, timeArray.lastIndexOf(",")) + "]";
} else
{
	timeArray = "''";
}

String dataArray = "{";
dataArray += "dt:" + timeArray;
dataArray += "}";
System.out.println(dataArray); 
out.print(dataArray); 
%>