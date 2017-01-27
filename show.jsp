<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"                                                    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
table {
    width: 100%;
    margin-left: auto;
    margin-right: auto;
}
</style>
</head>
<body>

</body>
<form method="post">

<table border="2" >
<tr>
<td>Name</td>
<td>Location</td>
<td>Landmark</td>
<td>Severity</td>




</tr>
<%

try
{

	
String query="select * from suspect";

Class.forName("com.mysql.jdbc.Driver");


Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ashray",
        "root", "pavi@rec");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery(query);

while(rs.next())
{

%>
<TR>
   
    <td><%=rs.getString("Name") %>
     
   <td><%=rs.getString("Location") %>
   <td><%=rs.getString("Landmark") %>
   <td><%=rs.getString("Severity") %>
   </td>
    
   
    
       </TR>
        <%

}
%>
    </table>
    <%
    //response.sendRedirect("display.jsp");
   
    }
catch(Exception e)
{
    e.printStackTrace();
    }


%>
<a href="display.jsp">show evidences</a>

</form>
</html> 