<%@ page language="java" import="java.util.*" pageEncoding="EUC-KR"%>
<%
HashMap hm = (HashMap)request.getAttribute("hotline");
String dataArray = "{"; // data list na

Iterator itr = hm.keySet().iterator();
while (itr.hasNext()) {
    String key = (String)itr.next();
    dataArray += key + ":'" + hm.get(key) + "',";
}
dataArray = dataArray.substring(0, dataArray.lastIndexOf(","));
dataArray += "}";
out.print(dataArray); 
%>
