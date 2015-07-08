<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
List callLineCahart = (List)request.getAttribute("otherStruct");
Map<String, String> almMap = null;

String dataArray = "({";
String timeArray = "";

if (callLineCahart.size() > 0)
{
	timeArray = "[";
	for(int i=0;i<callLineCahart.size();i++){
	    almMap = (Map)callLineCahart.get(i);
	    timeArray += "{'tr':'" + almMap.get("trclass") + "',";
	    timeArray += "'id':'" + almMap.get("struct_id") + "',";
	    timeArray += "'nm':'" + almMap.get("struct_nm") + "'},";
	}
	
	timeArray = timeArray.substring(0, timeArray.lastIndexOf(",")) + "]";
} else
{
	timeArray = "''";
}
dataArray += "'list':" + timeArray;
dataArray += "})";
System.out.println(dataArray); 
out.print(dataArray); 
%>