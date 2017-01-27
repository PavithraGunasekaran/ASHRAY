<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ngo details
<style>
body{
background-image:url("http://ailievski.com/wp-content/uploads/2014/11/bp_background_2_blue1.jpg");
background-repeat:no-repeat; /*we want to have one single image not a repeated one*/  
background-size:cover;
}
</style></title>
</head>
<body>
<%
    
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection(  
		   "jdbc:mysql://localhost:3306/ashray","root","pavi@rec");
   //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ashray",
            //"root", "pavi@rec");
   //Statement st = con.createStatement();
   PreparedStatement ps=con.prepareStatement("select * from ngo where NgoUsername = ?");
   
   ResultSet rs;
   String Name=request.getParameter("q");
   ps.setString(1,Name);
   rs = ps.executeQuery();
 
   if(rs.next())
   {
	   out.println("Ngo Name = "+rs.getString(1));
	   out.println("<br/>");
	   out.println("Location of NGO = "+rs.getString(3));
   }
   else
   {
	   out.println("NIL");
   }
   %>
</body>
</html>