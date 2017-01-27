<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*"%>
<%
    String Uname= request.getParameter("Username");    
    String Pass= request.getParameter("Password"); 
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection(  
		   "jdbc:mysql://localhost:3306/ashray","root","pavi@rec");
   //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ashray",
            //"root", "pavi@rec");
   Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from admin where Username ='"+Uname+"'and password='"+Pass+"'");
   if(rs.next()) {
	   //out.println(rs.getString(1));
	   //out.println(rs.getString(2));
	   
	  // int i = st.executeUpdate("insert into login(Username,Password) values ('" + Uname + "','" + Pass + "',CURDATE(),CURTIME())");
        //session.setAttribute("Uname", Uname);
      
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("adminpage.html");
    } else {
        out.println("<b>Invalid Login <a href='adminlogin.html'>try again</b></a>");
    
    }
 
   
    
%>