<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*"%>
<%
String NgoUsername= request.getParameter("NgoUsername");
String NgoPassword= request.getParameter("NgoPassword");
Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection(  
		   "jdbc:mysql://localhost:3306/ashray","root","pavi@rec");
  
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from ngo where NgoUsername ='"+NgoUsername+"'and NgoPassword='"+NgoPassword+"'");
if(rs.next()) {
		//int i= st.executeUpdate("insert into guest(Mailid)"+"values('"+Mailid+"')");
        //session.setAttribute("Uname", Uname);
		    response.sendRedirect("ngopage.html");
}
else {
    out.println("<b>Invalid Login <a href='ngologin.html'>try again</b></a>");

}
%>