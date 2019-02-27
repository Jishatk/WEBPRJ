<%-- 
    Document   : Studbookreturn
    Created on : Jan 17, 2019, 1:25:22 PM
    Author     : STUDENTS
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
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
        <%
            String bname="",aname="",sname="",cl="",div="",rtdt="",admno="";
            
            DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
            
            ResultSet rs=(ResultSet)request.getAttribute("res");
            if(rs!=null){
                admno=rs.getString("admnno");
                bname=rs.getString("bkname");
                aname=rs.getString("auname");
                sname=rs.getString("name");
                cl=rs.getString("class");
                div=rs.getString("div");
                rtdt=df.format(rs.getDate("rtndt"));
            }
        %>
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
        <form action="retServletstud" method="post">
       <table>
        <tr>   
        <td><label for="admno" class="lab">Admission No</label></td>
        <td><input type="text" class="txtbox" placeholder="" name="admno" id="admno" required="" value="<%=admno%>" >
        <input type="submit" value="View" name="b" /></td>
        </tr>   
        <tr>   
        <td><label class="lab">Book Name</label></td>
        <td><input type="text" class="txtbox" name="bname" value="<%=bname%>" /></td>
        </tr>
        <td><label for="aname" class="lab">Author</label></td>
        <td><input type="text" class="txtbox"  name="aname" value="<%=aname%>"></td>
        </tr>   
        <tr>
        <td><label for="sname" class="lab">Student Name</label></td>
        <td><input type="text" class="txtbox"  name="sname" id="sname" value="<%=sname%>" ></td>
        </tr> 
        <tr>
        <td><label for="cl" class="lab">Class</label></td>
        <td><input type="text" class="txtbox" placeholder="" name="cl" id="cl" value="<%=cl%>"></td>
        </tr> 
        <tr>
        <td><label for="div" class="lab">Division</label></td>
        <td><input type="text" class="txtbox" placeholder="" name="div" id="div" value="<%=div%>"></td>
        </tr>
        <tr>
         <td><label for="rdt" class="lab">Return Date</label></td>
        <td><input type="text" class="txtbox" placeholder="" name="rdt" id="rdt" value="<%=rtdt%>"></td>   
        <tr>
        <tr>
        <td><input type="submit" value="Return" name="b" /></td><td></td>
        </tr>
        </table>
         </form>
    </body>
</html>
