<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int result=0;
    double bal=0.0,newbal=0.0;
    double add=Double.parseDouble(request.getParameter("add"));
    String email=(String)session.getAttribute("semail");
    String password=(String)session.getAttribute("spwd");
    Connection con=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ewallet","root","");
            String str1="SELECT * FROM customer WHERE Email=? AND Password=?";
            ps=con.prepareStatement(str1);
            ps.setString(1,email);
            ps.setString(2,password);
            rs=ps.executeQuery();
            if(rs.next())
            {
                bal=rs.getDouble("balance");
            } 
            newbal=bal+add;
            String str="UPDATE `customer` SET `balance` =? WHERE `customer`.`email` =?;";
            ps=con.prepareStatement(str);
            ps.setDouble(1, newbal);
            ps.setString(2, email);
            result=ps.executeUpdate();
            if(result!=0)
            {
                con.close();
                response.sendRedirect("userpage.jsp");
            }
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }    
%>
