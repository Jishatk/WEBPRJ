<%-- 
    Document   : Studhome
    Created on : Jan 16, 2019, 4:53:08 PM
    Author     : STUDENTS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        
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
          padding: 14px 30px;
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
          HttpSession sess=request.getSession(true);
          String us=(String)sess.getAttribute("user");
        %>    
        <ul id="menu">
        <li><a href="#">ALPHABET TRAINING</a></li>    
        <li><a href="Studhome.jsp">Home</a></li>        
        <li ><a href="studmark.jsp">Marks</a></li>
        <li ><a href="studatt.jsp">Attendence</a></li>
        <li ><a href="profileview.jsp">Profile</a></li>
        <li ><a href="">News</a></li>
        <li ><a href="logout.jsp">SignOut</a></li>
        </ul>
        <div align="right">Welcome <%=us%></div>
    </body>
</html>
