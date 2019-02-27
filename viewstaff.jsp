<%-- 
    Document   : viewstaff
    Created on : Jan 16, 2019, 4:54:06 PM
    Author     : STUDENTS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff</title>
    </head>
    <body>
        <form action="viewstaffServlet" method="post">
        Staff Name <input type="text" name="sname" value="" />
        <input type="submit" value="Search" />
       <table  cellspacing="10">
            <tr><td>Staff Id</td><td>Name</td><td>Faculty in charge</td><td>email</td><td>Mobile</td></tr>
        <%
            ResultSet rs=(ResultSet)request.getAttribute("res");
            if(rs!=null){
                while(rs.next()){
         %>
         <tr>
             <td><%=rs.getString("staffid")%></td>
             <td><%=rs.getString("fname")%></td>
             <td><%=rs.getString("faculty")%></td>
             <td><%=rs.getString("email")%></td>
             <td><%=rs.getString("mob")%></td>
         </tr>
         <%
                    
                }
            }
         %> 
        </table>
        </form>
    </body>
</html>
