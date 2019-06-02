<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String email=(String)session.getAttribute("semail");
  String password=(String)session.getAttribute("spwd");
  Connection con=null;
  PreparedStatement ps=null;
  ResultSet rs=null;
  double bal=0.0;
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
               bal=rs.getDouble("balance");
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
  <h2>Dashboard</h2>
</div>
     <center><b style="font-size: 25px">Your Current Balance:<%=bal%>₹</b></center>
</body>
</html> 
