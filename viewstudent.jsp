<%-- 
    Document   : viewstudent
    Created on : Jan 16, 2019, 5:00:09 PM
    Author     : STUDENTS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="viewstudServlet" method="post">
            Student Name <input type="text" name="sname" value="" />
            <input type="submit" value="Search" />
            <table  cellspacing="10">
                <tr><td>Adm.No.</td><td>Name</td><td>Class</td><td>Div</td><td>Mobile</td></tr>
                <%
                    ResultSet rs = (ResultSet) request.getAttribute("res");
                    if (rs != null) {
                        while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("admno")%></td>
                    <td><%=rs.getString("fname")%></td>
                    <td><%=rs.getString("standard")%></td>
                    <td><%=rs.getString("div")%></td>
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
