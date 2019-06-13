<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>validation</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% int id=Integer.parseInt(request.getParameter("userid"));
String password=request.getParameter("pass");
Connection con=null;
try {
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
		 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","VOTINGSW","satyamn");
		 {
				PreparedStatement ps=con.prepareStatement("Select password from faculty where userid=?");
				ps.setInt(1,id);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
						String fn=rs.getString("password");
						if(fn.equals(password))
						{
								con.close();
								response.sendRedirect("rows.jsp");
						}				
			}	
	
	}
	
	{
		PreparedStatement ps1=con.prepareStatement("Select password from student where rollno=?");
		ps1.setInt(1,id);
		ResultSet rs1=ps1.executeQuery();
		while(rs1.next())
		{ 
			String fn=rs1.getString("password");
		
			if(fn.equals(password))
			{
				con.close();
				response.sendRedirect("Checkmarks.jsp");
			}
		}
	
	}
	con.close();
	response.sendRedirect("index.jsp");
	
	
	}
	catch(Exception e)
	{
			
	} %>
</body>
</html>