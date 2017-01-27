<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"                                                    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ngo page</title>
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
<td>Location</td>
<td>Landmark</td>
<td>count of abuse reported</td>
</tr>
<%

try
{

	

String query1="select Location,Landmark,count(Location),count(Landmark)from suspect group by Location,Landmark";


Class.forName("com.mysql.jdbc.Driver");


Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ashray",
        "root", "pavi@rec");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery(query1);


while(rs.next())
{

%>
<style>
body{
background-image:url("http://theavvashyagroup.com/wp-content/uploads/2013/10/Slider-Banner-02.jpg");
background-repeat:no-repeat; /*we want to have one single image not a repeated one*/  
background-size:cover;
}
</style>
<TR>
   
  
     
   <td><%=rs.getString("Location") %>
   <td><%=rs.getString("Landmark") %>
   <td><%=rs.getString("count(Landmark)") %>
   
   

   </td>
    
   
    
       </TR>
       
        <%
        int i=rs.getInt(3);
       int j=rs.getInt(4);
       String Location=rs.getString(1);
       String Landmark=rs.getString(2);
       if(i>=3|j>=3)
       {%>
       	<h1><b><font color="white"><%
       	out.println("serious case of abuse reported in   ");
       	%>
       	</font></b></h1>
       	
       	<%
       	session.setAttribute("Loc1",Location);
       	session.setAttribute("Land1",Landmark);
       	String L=(String)session.getAttribute("Loc1");%>
       	<h1><b><font color="white">
       	<% out.println(L);
       	%></font></b></h1>
       	<%}%>
       	<br/>
       	<%
       out.println("\n");
           //response.sendRedirect("display.jsp");
          

}%>
</table>
<%

    }
catch(Exception e)
{
    e.printStackTrace();
    }


%>

<h1><b><font color="white"><a href="display.jsp">show evidences</a></font></b></h1><br>
<h1><b><font color="white"><a href="sendmail.html">report police about the abuse</a></font></b></h1>

</form>
</html>