<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>

<% Blob image = null;

Connection con = null;

byte[ ] imgData = null ;

Statement stmt = null;

ResultSet rs = null;

try {

Class.forName("com.mysql.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ashray","root","pavi@rec");

stmt = con.createStatement();

rs = stmt.executeQuery("select * from contacts");
if(rs!=null)
{
while(rs.next()) {
	//String Location= rs.getString("Location");
	//String Landmark= rs.getString("Landmark");

image = rs.getBlob(4);

imgData = image.getBytes(1,(int)image.length());
response.setContentType("image/jpeg");
OutputStream o = response.getOutputStream();
String firstname=rs.getString("first_name");
System.out.print(firstname);


o.write(imgData);




}
}
/*else {

out.println("Display Blob Example");

out.println("image not found for given id>");

return;

}*/

// display the image





} catch (Exception e) {

out.println("Unable To Display image");

out.println("Image Display Error=" + e.getMessage());

return;

} /*finally {

try {
rs.close();
stmt.close();

con.close();

} catch (SQLException e) {

e.printStackTrace();

}

}*/

%>