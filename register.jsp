<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int result=0;
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String email=request.getParameter("email");
    String cno=request.getParameter("cno");
    String ano=request.getParameter("ano");
    String password=request.getParameter("pwd");
    Connection con=null;
    PreparedStatement ps=null;
    try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ewallet","root","");
            String str="INSERT INTO `customer` (`Fname`, `Lname`, `Email`, `Contact_no`, `Aadhar_no`, `Password`)"+" VALUES (?,?,?,?,?,?)";
            ps=con.prepareStatement(str);
            ps.setString(1, fname);
            ps.setString(2, lname);
            ps.setString(3, email);
            ps.setString(4, cno);
            ps.setString(5, ano);
            ps.setString(6, password);
            result=ps.executeUpdate();
            if(result!=0)
            {
                con.close();
                response.sendRedirect("suc.html");
            }
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }    
%>
