<%-- 
    Document   : Staffhome
    Created on : Jan 16, 2019, 4:52:38 PM
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
    
    <ul id="menu">
    <li><a href="#">ALPHABET TRAINING</a></li>    
    <li><a href="Staffhome.jsp">Home</a></li>
    <li class="dropdown">
        <a href="javascript:void(0)" class="dropbtn">Marks</a>
        <div class="dropdown-content">
        <a href="Entermark.jsp">Mark Entry</a>
        <a href="Viewmark.jsp">View Marks</a>
        </div>
    </li>
    <li class="dropdown">
        <a href="javascript:void(0)" class="dropbtn">Attendence</a>
        <div class="dropdown-content">
        <a href="Markatt.jsp">Mark Attendence</a>
        <a href="Viewatt.jsp">View Attendence</a>
        </div>
    </li>
    <li class="dropdown">
        <a href="javascript:void(0)" class="dropbtn">Student</a>
        <div class="dropdown-content">
        <a href="profile.jsp">Profile</a>
        <a href="profileupdate.jsp">Edit Profile</a>
        </div>
    </li>
    <li ><a href="#news">News</a></li>
    <li ><a href="logout.jsp">SignOut</a></li>
    </ul>
    </body>
</html>
