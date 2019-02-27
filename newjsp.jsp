<%-- 
    Document   : newjsp
    Created on : Jan 17, 2019, 4:12:09 PM
    Author     : STUDENTS
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            
 ul {
          list-style-type: none;
          margin: 0;
          padding: 0;
          overflow: hidden;
          background-color:#4e555b ;
        }
        li {
          float:left;font-size: 20px;
        }

        li a, .dropbtn {
          display: inline-block;
          color: black;
          text-align: center;
          padding: 14px 36px;
          text-decoration: none;
        }

        li a:hover, .dropdown:hover .dropbtn {
          background-color: #002752;
        }

        li.dropdown {
          display: inline-block;
        }

        .dropdown-content {
          display: none;
          position: absolute;
          background-color: #f9f9f9;
          min-width: 160px;
          box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
          z-index: 1;
        }

        .dropdown-content a {
          color: black;
          padding: 12px 16px;
          text-decoration: none;
          display: block;
          text-align: left;
        }

        .dropdown-content a:hover {background-color: #f1f1f1}

        .dropdown:hover .dropdown-content {
          display: block;
        }
     </style>
    </head>
    <body>
        <%
            
            String S = "jdbc:sqlserver://localhost;databaseName=schooldb;user=sa;password=password123";
            String q="select * from student where  fname=?";
           // String s="select DATEDIFF(mm,'2002-02-15','2000-06-04') as yr";
            Connection con = DriverManager.getConnection(S);
            PreparedStatement pst= con.prepareStatement(q);
            pst.setString(1, "Sandra");
            ResultSet rs=pst.executeQuery();
            rs.next();
            Date dt=rs.getDate("dob");
            String s="select DATEDIFF(mm,'2002-02-15',sysdate) as yr ";
           Statement st=con.createStatement();
            ResultSet rs1=st.executeQuery(s); 
            while(rs.next()){
               /* String sdt=rs.getString("dob");
                DateFormat df=new SimpleDateFormat("dd-MM-yyyy");
                String dt=df.format(sdt);*/
         %>   
         <%=rs.getString("yr")%>
         <%
             }
         %>    
        
        
        
    </body>
</html>
