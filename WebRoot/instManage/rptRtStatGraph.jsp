<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
List callLineCahart = (List)request.getAttribute("rsGraph");
Map<String, String> almMap = null;

String timeArray = "";
 
if (callLineCahart.size() > 0)
{
	timeArray = "[";

	for(int i=0;i<callLineCahart.size();i++){
	    almMap = (Map)callLineCahart.get(i);
	    timeArray += "['" + almMap.get("dis_reg_dt") + "',";
	    timeArray += "'" + almMap.get("sensor_value") + "'],";
	}
	timeArray = timeArray.substring(0, timeArray.lastIndexOf(",")) + "]";
} else
{
	timeArray = "''";
}

String dataArray = "{";
dataArray += "dt:" + timeArray;
dataArray += "}";
//System.out.println(dataArray); 
out.print(dataArray); 
%>