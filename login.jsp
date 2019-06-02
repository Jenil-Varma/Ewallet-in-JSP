<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String email=request.getParameter("email");
  String password=request.getParameter("pwd");
  session.setAttribute("semail",email);
  session.setAttribute("spwd",password);
  Connection con=null;
  PreparedStatement ps=null;
  ResultSet rs=null;
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
                con.close();
                response.sendRedirect("userpage.jsp");   
            } 
            else
            {
                con.close();
                response.sendRedirect("error.html");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
%>