<%@ page import ="java.sql.*" %>
<%@ page import="java.io.BufferedReader" %>
<html>
<head><title>Forgot password</title></head></html>
<%
 
    String username  = request.getParameter("username");
String mobilenumber=request.getParameter("mobno");



    String query=("select NgoPassword from ngo where NgoUsername='"+username+"'");
    
    
   
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ashray",
            "root", "pavi@rec");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(query);

   
    

 
    if(rs.next())
    {

    	   String psw = rs.getString(1);
    	   String abc="http://bulksms.mysmsmantra.com:8080/WebSMS/SMSAPI.jsp?username=bhuvangates&password=reccseit&sendername=bhuvan&mobileno="+mobilenumber+"&message=Dear "+username+"  Your password is:"+psw+"";
	  response.sendRedirect(abc);
	  out.println("Password Sent to your Registered Mobile No<a href='ngologin.html'>Go To Login</a>");
	   session.setAttribute("password",psw);
    }   
    else
    {
    	out.println("Invalid mob number or username<a href='forgotpassword.html'>try again</a>");
    }
      
%>

