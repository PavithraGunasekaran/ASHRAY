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
</style>
</title>
<script>
function showngo(str)
{
	var xmlhttp;
	if(str=="")
		{
		document.getElementById("txtHint").innerHTML="";
		return;
		
		}
	if(window.XMLHttpRequest)
		{
		xmlhttp=new XMLHttpRequest();
		}
	xmlhttp.onreadyState=function()
	{
		if(this.readyState==4 && this.status==200)
			{
			document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
			}
	}
	xmlhttp.open("GET","getngo.jsp?q="+str,true);
	xmlhttp.send();
	}

</script>
</head>
<body>
<%
    
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection(  
		   "jdbc:mysql://localhost:3306/ashray","root","pavi@rec");
   //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ashray",
            //"root", "pavi@rec");
   Statement st = con.createStatement();
   ResultSet rs;
   rs = st.executeQuery("select * from ngo");
   %>
   <form action="">
   Name of the NGO:
   <select name="Name" onchange="showngo(this.value)">
   <option value="">select a ngo</option>
   <%
   while(rs.next())
   {
   %>
   <option value=<%=rs.getString(1)%>>
   <%=rs.getString(1)%>
   </option>
   <%
   }%></select></form>
   <br>
   <div id="txtHint">
   NGO details will be displayed here..</div>
</body>
</html>