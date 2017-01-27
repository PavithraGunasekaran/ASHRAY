<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*"%>
<%
String file= request.getParameter("file");
Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection(  
		   "jdbc:mysql://localhost:3306/ashray","root","pavi@rec");
  Statement st=con.createStatement();
		int i= st.executeUpdate("insert into complaints(file)"+"values('"+file+"')");
        //session.setAttribute("Uname", Uname);
		    //response.sendRedirect("guestpage.html");
%>