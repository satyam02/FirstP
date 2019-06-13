<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Marksheet</title>
</head>
<body>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%
String roll_no=(request.getParameter("rollno"));
Connection con=null;
try {
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
		 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","VOTINGSW","satyamn");
		     PreparedStatement ps=con.prepareStatement("select * from student inner join daa using(rollno)inner join ppl using(rollno) inner join dbms using(rollno) inner join webtech using(rollno) inner join cyber using(rollno) inner join eco using(rollno) where rollno=?");
ps.setString(1,roll_no);


ResultSet rs=ps.executeQuery();
while(rs.next())
{
int att=(Integer.parseInt(rs.getString(9))+Integer.parseInt(rs.getString(12))+Integer.parseInt(rs.getString(15))+Integer.parseInt(rs.getString(18))+Integer.parseInt(rs.getString(21))+Integer.parseInt(rs.getString(24)))/6;
int marks1=(Integer.parseInt(rs.getString(7))+Integer.parseInt(rs.getString(10))+Integer.parseInt(rs.getString(13))+Integer.parseInt(rs.getString(16))+Integer.parseInt(rs.getString(19))+Integer.parseInt(rs.getString(22)));
int marks2=(Integer.parseInt(rs.getString(8))+Integer.parseInt(rs.getString(11))+Integer.parseInt(rs.getString(14))+Integer.parseInt(rs.getString(17))+Integer.parseInt(rs.getString(20))+Integer.parseInt(rs.getString(23)));
int marks=marks1+marks2;
%>
<table width="100%" border="1"  style="height: 139px; ">
<tr><td style="height: 70px; width: 1170px"><div style="background-image: url('images/bg-03.png'); height: 149px; width: 1194px"></div>
</td>
</tr></table>
<table border="1" width="100% ">

<tr>
<td>Name: <%=rs.getString(2).toUpperCase()%><br>
Father's Name: <%=rs.getString(4).toUpperCase()%><br>
Roll No: <%=rs.getString(1) %><br>

Institute: <%=rs.getString(5).toUpperCase() %>
</td>
<td>
Course: <%=rs.getString(6).toUpperCase()%><br>
Attendance: <%=att %><br>
Marks: <%=marks %></td></tr>
</table>
<table width="100%" border="1">
<tr><th>Subject Name</th><th>Internal</th><th>External</th><th>Attendance</th>
</tr><tr>
<td>DAA</td>
<td><%=rs.getString(7) %></td>
<td><%= rs.getString(8)%></td>
<td><%=rs.getString(9) %></td></tr>
</tr>
<tr>
<td>PPL</td>
<td><%=rs.getString(10) %></td>
<td><%=rs.getString(11) %></td>
<td><%=rs.getString(12) %></td></tr>
</tr>
<tr>
<td>DBMS</td>
<td><%= rs.getString(13)%></td>
<td><%=rs.getString(14) %></td>
<td><%=rs.getString(15) %></td></tr>
</tr>
<tr>
<td>WEBTECH</td>
<td><%=rs.getString(16) %></td>
<td><%= rs.getString(17)%></td>
<td><%=rs.getString(18) %></td></tr>
</tr>
<tr>
<td>ECO</td>
<td><%= rs.getString(22)%></td>
<td><%=rs.getString(23) %></td>
<td><%=rs.getString(24) %></td></tr>
</tr>
<tr>
<td>CYBER</td>
<td><%=rs.getString(19) %></td>
<td><%= rs.getString(20)%></td>
<td><%=rs.getString(21) %></td></tr>
</tr>
</table>
<% }
}
catch(Exception e)
{}
 %>
 <form action="index.jsp">
<p align="center" style="height: 53px; "><input type="submit" value="logout" style="width: 202px" bgcolor="red"></p>
</form>
</body>
</html>