<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Uploading Marks</title>
</head>
<body>
<div class="container-login100" style="background-image: url('images/bg_02.jpg');">

<form action="uploadMarks.jsp">
<div >
<p align="center">
<select align="center" value="sub" name="subject" style="height: 27px; width: 188px">
<option value=" "> SELECT SUBJECT</option>
<option value="DAA">DAA</option>
<option value="PPL">PPL</option>
<option value="WEBTECH">WEB TECH</option>
<option value="DBMS">DBMS</option>
<option value="ECO">ECO</option>
<option value="CYBER">CYBER</option>
</select></p>
</div>
<div style="height: 87px; "></div>
<div>
<table border="1" width="95%">

<tr>
<th align="center">Roll Number</th><th align="center">Internal Marks</th><th align="center"> External Marks</th><th align="center">Attendance(%)</th></tr>
<% try{
int row=0;
row=Integer.parseInt(request.getParameter("rows"));

 for(int i=0;i<row;i++){
%>
<tr><td><input type="text" name="rollno<%=i%>"  value="1616410"></td>
<td><input type="text" name="inte<%=i%>"></td>
<td><input type="text" name="ext<%=i%>"></td>
<td><input type="text" name="attend<%=i%>"></td></tr>
<% }}
catch(Exception e){} %>
</table>
</div>
<div style="height: 87px; "></div>

<div>
<p align="center">No of Records:<input type="text" name="rows" value="<%=Integer.parseInt(request.getParameter("rows"))%>"></p>

</div>
<div>
<p align="center" style="height: 53px; "><input type="submit" value="UPLOAD" style="width: 202px; "></p>

</div>
</form>
<form action="index.jsp">
<p align="center" style="height: 53px; "><input type="submit" value="logout" style="width: 202px"></p>
</form>
</div>
</body>
</html>