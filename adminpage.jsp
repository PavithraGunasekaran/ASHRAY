<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin page</title>
<style>
body{
background-image:url("http://ailievski.com/wp-content/uploads/2014/11/bp_background_2_blue1.jpg");
background-repeat:no-repeat; /*we want to have one single image not a repeated one*/  
background-size:cover;
}
</style>

	
</head>
</html>
<%
    
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection(  
		   "jdbc:mysql://localhost:3306/ashray","root","pavi@rec");
   //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ashray",
            //"root", "pavi@rec");
   Statement st = con.createStatement();
   ResultSet rs;
   rs = st.executeQuery("select Location,Landmark,count(Location),count(Landmark)from suspect group by Location,Landmark");
  while(rs.next())
   {
	  //String Name=rs.getString("Name");
	  String Location=rs.getString(1);
	  String Landmark=rs.getString(2);
	  
	  int n=rs.getInt(3);
	  int m=rs.getInt(4);
	  %><b><font color="white">
	  
	  <%if(n>=3||m>=3)
	  {
	  	 
	  	 out.print("serious case of abuse reported in ");
	  	session.setAttribute("Loc1",Location);
       	session.setAttribute("Land1",Landmark);
       	String L=(String)session.getAttribute("Loc1");
       	String l1=(String)session.getAttribute("Land1");
       	out.println(L );
       	out.println(l1);
	  	 %>
	  	</font></b> <br>
	  <%}
	  //session.setAttribute("Loc1",Location);
	  //session.setAttribute("Land1", Landmark);
   }
  
	  %>
	  <b><font color="white"><a href="sendmail.html">send mail to NGO</a></font></b><br>
	 <b><font color="white"> <a href="showreport.html">show the abuse reports</a></font></b>
	 