<%-- 
    Document   : Addstaff
    Created on : Jan 16, 2019, 4:39:52 PM
    Author     : STUDENTS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="background" background="images/staff.jpg">
        <form action="staffServlet" method="post">   
        <label for="recipient-name" class="lab">First Name</label><br/>
        <input type="text" class="txtbox" placeholder="" name="fname" id="recipient-name" required=""><br/><br/>
        <label for="lname" class="lab" >Last Name</label><br/>
        <input type="text"  placeholder="" name="lname" id="lname" required=""><br/><br/>
        <label for="gname" class="lab">Faculty in charge</label><br/>
        <input type="text"  placeholder="" name="gname" id="gname" required=""><br/><br/>
        <label for="dob" class="lab">Date of birth</label><br/>
        <input type="date" id="dob" name="dob"  min="1970-01-01" max="1995-12-31"><br/><br/>
        <label for="mob" class="lab">Mobile</label><br/>
        <input type="number" id="mob" name="mob"  ><br/><br/>
        <label for="email" >email</label><br/>
        <input type="email" id="email" name="email"  ><br/><br/>
        <label for="addr" >Address</label><br/>
        <textarea cols="20" rows="4" id="addr" name="addr" required=""></textarea><br/><br/>
        <label for="gen" >Gender</label><br/>
        <input type="radio" name="gender" value="Male" />Male&nbsp;<input type="radio" name="gender" value="Female" />Female<br/><br/>
        <label for="uname" class="lab" >Username</label><br/>
        <input type="text"  placeholder="" name="uname" id="uname" required=""><br/><br/>
        <label for="pass" class="lab" >Password</label><br/>
        <input type="password"  placeholder="" name="pass" id="pass" required=""><br/><br/>
        <input type="submit" value="Add" />
    </body>
</html>
