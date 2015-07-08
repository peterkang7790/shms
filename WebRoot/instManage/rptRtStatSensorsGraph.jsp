<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
List callLineCahart = (List)request.getAttribute("sensors_graph");
Map<String, String> almMap = null;

String dataArray = "{";
String timeArray = "";

if (callLineCahart.size() > 0)
{
	timeArray = "[";
	for(int i=0;i<callLineCahart.size();i++){
	    almMap = (Map)callLineCahart.get(i);
	    timeArray += "{'sid':'" + almMap.get("sensor_id") + "',";
	    timeArray += "'st':'" + almMap.get("sensor_type_cd") + "',";
		timeArray += "'dt':[" + almMap.get("prod_dt") + "'],";
	    timeArray += "'sv':[" + almMap.get("sensor_values") + "']},";
	}
	
	timeArray = timeArray.substring(0, timeArray.lastIndexOf(",")) + "]";
} else
{
	timeArray = "''";
}
dataArray += "list:" + timeArray;
dataArray += "}";
//System.out.println(dataArray); 
out.print(dataArray); 
%>