<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*"%>
<%
String Name= request.getParameter("Name");
String Location= request.getParameter("Location");
String Landmark= request.getParameter("Landmark");
String Severity= request.getParameter("Severity");
Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection(  
		   "jdbc:mysql://localhost:3306/ashray","root","pavi@rec");
  Statement st=con.createStatement();
		int i= st.executeUpdate("insert into suspect(Name,Location,Landmark,Severity)"+"values('"+Name+"','"+Location+"','"+Landmark+"','"+Severity+"')");
        //session.setAttribute("Uname", Uname);
		    //response.sendRedirect("adminlogin.html");%>
		    <html><head>
		    <style>
body{
background-image:url("https://dab1nmslvvntp.cloudfront.net/wp-content/uploads/2013/09/Fotolia_52657937_Subscription_XL.jpg");
background-repeat:no-repeat; /*we want to have one single image not a repeated one*/  
background-size:cover;
}
</style>
</head>
<body></body>
</html>
		   <h1><b><font color="#0000CD"><% out.print("complaint uploaded successfully");%></font></b></h1><br>

<h1><b><font color="#0000CD"><a href="Upload.jsp">submit an evidence for abuse<br>
<input type="button" value="upload image"></a></font></b></h1>