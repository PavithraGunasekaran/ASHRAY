<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*"%>
<html><head><title>police signup<style>
body{
background-image:url("http://theavvashyagroup.com/wp-content/uploads/2013/10/Slider-Banner-02.jpg");
background-repeat:no-repeat; /*we want to have one single image not a repeated one*/  
background-size:cover;
}
</style></title></head></html>
<%
String Username= request.getParameter("Username");
String Password= request.getParameter("Password");
String Location=request.getParameter("Location");

Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection(  
		   "jdbc:mysql://localhost:3306/ashray","root","pavi@rec");
  Statement st=con.createStatement();
		int i= st.executeUpdate("insert into ngo(NgoUsername,NgoPassword,Location)"+"values('"+Username+"','"+Password+"','"+Location+"')");
		%>
		

		   <h1><b><font color="#0000CD"><% out.print("sign up successful");%></font></b></h1><br>