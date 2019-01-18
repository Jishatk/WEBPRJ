<%-- 
    Document   : Adminhome
    Created on : Jan 16, 2019, 4:49:43 PM
    Author     : STUDENTS
--%>

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
    <li><a href="#">ALPHABET TRAINING</a></li>
    <li><a href="#Adminhome"></a></li>
    <li><a href="Adminhome.jsp">Home</a></li>
    <li class="dropdown">
        <a href="javascript:void(0)" class="dropbtn">Students</a>
        <div class="dropdown-content">
        <a href="Addstudent.jsp">Add Student</a>
        <a href="viewstudent.jsp">View Student</a>
        </div>
    </li>
    <li class="dropdown">
        <a href="javascript:void(0)" class="dropbtn">Staff</a>
        <div class="dropdown-content">
        <a href="Addstaff.jsp">Add Staff</a>
        <a href="viewstaff.jsp">View Staff</a>
        </div>
    </li>
    <li ><a href="#news">Library</a></li>
    <li ><a href="#news">News</a></li>
  </ul>
    </body>
</html>
