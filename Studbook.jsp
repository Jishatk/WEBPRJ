<%-- 
    Document   : Studbook
    Created on : Jan 17, 2019, 12:41:13 PM
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

            .lab{
                font-size: 25px;
                color: #0b2e13;
            }
        </style>
    </head>
    <body>
        <ul id="menu">
          <li><a href="#">LIBRARY</a></li>          
          <li><a href="library.jsp">Home</a></li>

          <li class="dropdown">
            <a href="javascript:void(0)" class="dropbtn">Members</a>
            <div class="dropdown-content">
              <a href="Studview.jsp">View students</a>
              <a href="Studview.jsp">View Staff</a>
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
       <form action="issueServletstud" method="post">
       <table>
        <tr>
        <td><label for="bname" class="lab">Book Name</label></td>
        <td><input type="text" class="txtbox" placeholder="" name="bname" id="bname" required="" ></td>
        </tr>
        <td><label for="aname" class="lab">Author</label></td>
        <td><input type="text"  placeholder="" name="aname" id="aname" required=""></td>
        </tr>   
        <tr>
        <td><label for="sname" class="lab">Student Name</label></td>
        <td><input type="text" class="txtbox" placeholder="" name="sname" id="sname" required="">
        <input type="text" class="txtbox" placeholder="" name="lname" id="lname" required=""></td>
        </tr> 
        <tr>
        <td><label for="cl" class="lab">Class</label></td>
        <td><select name="cl">
                <option value="select">select</option>
                <% for(int i=1;i<=12;i++){ %>
                <option value="<%=i%>"><%=i%></option>
                <% } %>
            </select></td>
        </tr> 
        <tr>
        <td><label for="div" class="lab">Division</label></td>
        <td><input type="text" class="txtbox" placeholder="" name="div" id="div" required=""></td>
        </tr>
        <tr>
        <tr>
        <tr>
        <td><input type="submit" value="Issue" /></td><td></td>
        </tr>
        </table>
         </form>
    </body>
</html>
