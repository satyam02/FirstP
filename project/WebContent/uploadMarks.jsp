<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.HttpServlet.*" %>

<% 
 String sub=request.getParameter("subject");
 int row=Integer.parseInt(request.getParameter("rows"));
Connection con=null;
try {
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
		 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","VOTINGSW","satyamn");
		      PreparedStatement psInsertRecord=null;
        String sqlInsertRecord=null;
      
   
 			if(sub.equals("DAA")){
 
       		 sqlInsertRecord="insert into daa values(?,?,?,?)";
   			 psInsertRecord=con.prepareStatement(sqlInsertRecord);
  
 			  
		 }
		 
		else  if(sub.equals("WEBTECH")){ 
		sqlInsertRecord="insert into webtech values(?,?,?,?)";
    psInsertRecord=con.prepareStatement(sqlInsertRecord);
   
   
		  }
		  
		 else  if(sub.equals("ECO"))
		   { sqlInsertRecord="insert into eco values(?,?,?,?)";
    psInsertRecord=con.prepareStatement(sqlInsertRecord);
   
  
		   }
		 else   if(sub.equals("DBMS")){
		  sqlInsertRecord="insert into dbms values(?,?,?,?)";
    psInsertRecord=con.prepareStatement(sqlInsertRecord);
   }
  
		 else  if(sub.equals("CYBER")){ 
		 sqlInsertRecord="insert into cyber values(?,?,?,?)";
    psInsertRecord=con.prepareStatement(sqlInsertRecord);
   
   }
    
    else if(sub.equals("PPL"))
    { sqlInsertRecord="insert into ppl values(?,?,?,?)";
    psInsertRecord=con.prepareStatement(sqlInsertRecord);
   
   
    }
	
	 for(int i=0;i<row;i++)
    {String r=(request.getParameter("rollno"+i));
    String internal=(request.getParameter("inte"+i));
    String external=(request.getParameter("ext"+i));
    String attendance=(request.getParameter("attend"+i));
    
      psInsertRecord.setString(1,r);
      psInsertRecord.setString(2,internal);
      psInsertRecord.setString(3,external);
      psInsertRecord.setString(4,attendance);
      psInsertRecord.addBatch(); 
    }
    psInsertRecord.executeBatch();
    con.close();
    response.sendRedirect("rows.jsp");	
	con.close();
	     
	     }
		 catch(Exception e)
		 {System.out.println(e);
		 }
		 
		%> 
</body>
</html>