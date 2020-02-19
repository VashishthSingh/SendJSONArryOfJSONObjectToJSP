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

    ${jsonData}
    <br><br><br>
    <c:forEach begin="0" end="${jsonData.length() -1}" var="index">
<%--      	${jsonData.getJSONObject(index)} --%>
     	${jsonData.get(index)} 
     	${jsonData.get(index).get("ramUsed")} 
     	${jsonData.get(index).get("diskUsed")} 
     	${jsonData.get(index).get("cpuUsed")} 
     	${jsonData.get(index).length()}<br>
	</c:forEach>
   <table>
   		<tr>
   			<th>readDateTime</th>
   			<th>ramUsed</th>
   			<th>diskUsed</th>
   			<th>cpuUsed</th>
   		</tr>
   		<c:forEach begin="0" end="${jsonData.length() -1}" var="index">
     	<tr>
     		<td>${jsonData.get(index).get("readDateTime")} </td>
   			<td>${jsonData.get(index).get("ramUsed")} </td>
   			<td>${jsonData.get(index).get("diskUsed")} </td>
   			<td>${jsonData.get(index).get("cpuUsed")} </td>
   		</tr>
	</c:forEach>		
   </table>
</body>
</html>