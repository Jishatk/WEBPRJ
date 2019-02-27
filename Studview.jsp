<%-- 
    Document   : Studview
    Created on : Jan 28, 2019, 12:33:16 PM
    Author     : STUDENTS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

       #menu > li:first-child{
                         float: left;
                         font-size: 30px;
                }
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
          color: white;
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
        <ul id="menu">
            <li><a href="#">LIBRARY</a></li>            
            <li><a href="library.jsp" >Home</a></li>

            <li class="dropdown">
                <a href="javascript:void(0)" class="dropbtn">Members</a>
                <div class="dropdown-content">
                  <a href="Studview.jsp">View students</a>
                  <a href="Staffview.jsp">View Staff</a>
                </div>
            </li>
            <li class="dropdown">
                <a href="javascript:void(0)" class="dropbtn">Books</a>
                <div class="dropdown-content">
                  <a href="Addbook.jsp">Add Books</a>
                  <a href="viewbook.jsp">View Books</a>
                </div>
            </li> 
            <li class="dropdown">
                <a href="javascript:void(0)" class="dropbtn">Book Issue</a>
                <div class="dropdown-content">
                  <a href="Studbook.jsp">Student</a>
                  <a href="Staffbook.jsp">Staff</a>
                </div>
            </li> 
            <li class="dropdown">
                <a href="javascript:void(0)" class="dropbtn">Book Return</a>
                <div class="dropdown-content">
                  <a href="Studbookreturn.jsp">Student</a>
                  <a href="Staffbookreturn.jsp">Staff</a>
                </div>
            </li> 
            <li><a href="/school/logout.jsp">Sign Out</a></li>
        </ul> 
         <table  cellspacing="10">
        <tr><td>Adm. No</td><td>First Name</td><td>Last Name</td><td>Class</td><td>Div</td><td>Email</td><td>Mobile</td></tr>
        <%
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s="jdbc:sqlserver://localhost;databaseName=schooldb;user=sa;password=password123";
            Connection con=DriverManager.getConnection(s);
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from student order by admno");
            while(rs.next()){
        %> 
        <tr>
                    <td><%=rs.getString("admno")%></td>
                    <td><%=rs.getString("fname")%></td>
                    <td><%=rs.getString("lname")%></td>
                    <td><%=rs.getString("standard")%></td>
                    <td><%=rs.getString("div")%></td>
                    <td><%=rs.getString("email")%></td>
                    <td><%=rs.getString("mob")%></td>
        </tr>
        <%
            }
        %>
    </body>
</html>
