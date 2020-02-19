<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page import = "org.json.JSONArray,org.json.JSONObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		table{border:2px solid gray;text-align:center;}
		tr{border:1px solid silver;padding:3px;}
		th{border:1px solid silver;padding:3px;}
		td{border:1px solid silver;padding:3px;}
	</style>
</head>
<body>

   <table>
   			<tr>
   	 			<th>dateTime</th>
   	 			<th>ramUsed</th>
   	 			<th>diskUsed</th>
   	 			<th>cpuUsed</th>
   		    </tr>
	<%
		JSONArray jsonArray=(JSONArray)request.getAttribute("jsonData");
		int len=jsonArray.length();
		JSONObject jsonDataObject;
		double ram=0,disk=0,cpu=0;String readDateAndTime=null;
		for(int i=0;i<len;i++){
			jsonDataObject=(JSONObject)jsonArray.get(i);
			ram=(double)jsonDataObject.get("ramUsed");
			disk=(double)jsonDataObject.get("diskUsed");
			cpu=(double)jsonDataObject.get("cpuUsed");
			readDateAndTime=(String)jsonDataObject.get("readDateTime");
	%>
	        <tr>
   	 			<td><%=readDateAndTime%></td>
   	 			<td><%=ram%></td>
   	 			<td><%=disk%></td>
   	 			<td><%=cpu%></td>
   			</tr>
	<%
		}
	%>
   </table>
   
</body>
</html>