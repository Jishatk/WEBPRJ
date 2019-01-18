<%-- 
    Document   : Addstudent
    Created on : Jan 16, 2019, 4:47:01 PM
    Author     : STUDENTS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .lb{
                font-size: 25px;
                color: #F5F5F5;
            }
            div{
            margin-top: 50px;
            margin-left: 130px;
             }
            .txtclass{
                 
                height: 20px;
                width: 160px;
          }
          .btnclass{
              height: 40px;
                width: 80px;
                  color: #0099e5;
                  background-color: #5AB1D0
          }
          
        </style>
    </head>
    <body >
        <table><tr><th>REGISTRATION</th></tr></table><br/><br/>
        <form action="regServlet" method="post">   
        <label for="recipient-name" class="lab">Firstname</label><br/>
        <input type="text" class="txtbox" placeholder="" name="fname" id="recipient-name" required=""><br/><br/>
        <label for="lname" class="lab" >Lastname</label><br/>
        <input type="text"  placeholder="" name="lname" id="lname" required=""><br/><br/>
        <label for="gname" class="lab">Guardian name</label><br/>
        <input type="text"  placeholder="" name="gname" id="gname" required=""><br/><br/>
        <label for="dob" class="lab">Date Of Birth</label><br/>
        <input type="date" id="dob" name="dob"  min="1998-01-01" max="2018-12-31"><br/><br/>
        <label for="mob" class="lab">Mobile</label><br/>
        <input type="number" id="mob" name="mob"  ><br/><br/>
        <label for="email" >email</label><br/>
        <input type="email" id="email" name="email"  ><br/><br/>
        <label for="addr" >Address</label><br/>
        <textarea cols="20" rows="4" id="addr" name="addr" required=""></textarea><br/><br/>
        <label for="gen" >Gender</label><br/>
        <input type="radio" name="gender" value="Male" />Male&nbsp;<input type="radio" name="gender" value="Female" />Female<br/><br/>
        <label for="rel" >Religion</label><br/>
        <select name="rel" id="rel" style="width:120px">
            <option value="Select">Select</option>
            <option value="Hindu">Hindu</option>
            <option value="Muslim">Muslim</option>
        </select><br/><br/>
        
        <label for="std" >Standard</label><br/>
        <select name="std" id="std" style="width:60px">
            <% for(int i=1;i<=12;i++){%>
            <option value="<%=i%>"><%=i%></option>
            <%} %>
        </select><br/><br/>
        <label for="div" >Division</label><br/>
        <select name="div" id="div" width="15px">
            <option value="A">A</option><option value="B">B</option><option value="C">C</option>
        </select><br/><br/>
        
        <label for="uname" >Username</label><br/>
        <input type="text"  placeholder="" name="uname" id="uname" required=""><br/><br/>
        <label for="pass" >Password</label><br/>
        <input type="text"  placeholder="" name="pass" id="pass" required=""><br/><br/>
        <input type="submit" value="Register" />&nbsp;<input type="reset" value="Cancel" />
        </form>
    </body>
</html>
