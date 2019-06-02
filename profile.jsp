<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String email=(String)session.getAttribute("semail");
  String password=(String)session.getAttribute("spwd");
  Connection con=null;
  PreparedStatement ps=null;
  ResultSet rs=null;
  String fname=null;
  String lname=null;
  String cno=null;
  String ano=null;
  try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ewallet","root","");
            String str="SELECT * FROM customer WHERE Email=? AND Password=?";
            ps=con.prepareStatement(str);
            ps.setString(1,email);
            ps.setString(2,password);
            rs=ps.executeQuery();
            if(rs.next())
            {
               fname=rs.getString("Fname");
               lname=rs.getString("Lname");
               cno=rs.getString("Contact_no");
               ano=rs.getString("Aadhar_no");
            } 
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<div class="sidebar">
  <h1>Travesy</h1>
  <a href="userpage.jsp"><i class="fa fa-fw fa-id-card"></i> Dashboard</a>
  <a href="ser.jsp"><i class="fa fa-fw fa-money "></i> Wallet</a>
  <a href="add.html"><i class="fa fa-fw fa-inr"></i> Recharge</a>
  <a href="history.jsp"><i class="fa fa-fw fa-bus"></i> Travel History</a>
  <a href="profile.jsp"><i class="fa fa-fw fa-user-circle"></i> Profile</a>
  <a href="index.html"><i class="fa fa-fw fa-user-circle"></i> Logout</a>
</div>

<div class="main">
  <h2>Profile</h2>
</div>
     <p>
	<center style="font-size: 50px;">WELCOME</center>
	<br>
	<br>
	<div class="box">
	<div class="imgcontainer">
            <img src="icon.png" alt="Avatar" class="avatar">
        </div>
	</div>
	<br><br>
	<center style="font-size: 20px">
	<table>
		<tr>
			<td>Name</td>
			<td>:</td>
                        <td><%=fname%>&nbsp;<%=lname%>
			</td>
		</tr>
		<tr></tr><tr></tr>
		<tr>
			<td>Email</td>
			<td>:</td>
                        <td><%=email%>
			</td>
		</tr>
		<tr></tr><tr></tr>
		<tr>
			<td>Contact Number</td>
			<td>:</td>
                        <td><%=cno%>
			</td>
		</tr>
		<tr></tr><tr></tr>
		<tr>
			<td>Aadhar Number</td>
			<td>:</td>
                        <td><%=ano%>
			</td>
		</tr>
	</table>
	</center>
</p>		
</body>
</html> 
