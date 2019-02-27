<%-- 
    Document   : studmark
    Created on : Feb 16, 2019, 10:15:39 AM
    Author     : STUDENTS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mark</title>
        
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
        .btnclass{
            width:70px;
            height:30px;
        }
        #slct{
            width:100px;
            height:30px;
        }
        </style>
        <script type="text/javascript">
           function validate(){ 
               var sub=document.getElementById("slct").value;
            if(sub=="select")           
            {                 
                alert ("Please select subject !");
                return false;
            }
        }
           
        </script>
    </head>
    <body >
      <%
            HttpSession sess=request.getSession(true);
            String us=(String)sess.getAttribute("user");
        %>     
    <ul id="menu">
    <li><a href="#">ALPHABET TRAINING</a></li>    
    <li><a href="Studhome.jsp">Home</a></li>        
    <li ><a href="studmark.jsp">Marks</a></li>
    <li ><a href="studatt.jsp">Attendence</a></li>
    <li ><a href="profile.jsp">Profile</a></li>
    <li ><a href="">News</a></li>
    <li ><a href="logout.jsp">SignOut</a></li>
    </ul>
        <div align="right">Welcome <%=us%></div>
    <center><h3>Mark View</h3></center><br>
    <div align="center">
    <h4>Subjectwise Mark Details</h4>
    <form action="studmarkServlet" method="post" onSubmit="return validate()">
    <%
        String sb=(String)request.getAttribute("sub");
        
        if(sb!=null){
    %>   
    Select&nbsp;<select  name="sub" id="slct" >
                <option value="<%=sb%>"><%=sb%></option>
                
                </select>
    <%
      } else{ 
    %>    
    Select&nbsp;<select  name="sub" id="slct" >
                <option value="select">select</option>
                <option value="All">All</option>
                <option value="English">English</option>
                <option value="Hindi">Hindi</option>
                <option value="Maths">Maths</option>
                <option value="Science">Science</option>
                </select>
    <%}%>
    <input type="submit" value="View" class="btnclass"/><br><br>
    <%
        ResultSet rs=(ResultSet)request.getAttribute("res");
        
        if(rs!=null){
    %>
        <table>
        <tr><th>Subject</th><th>Mark1</th><th>Mark2</th><th>TotalMarks</th><th>Grade</th><th>Result</th></tr>
    <%    
            while(rs.next()){
    %>
    
        <tr><td><%=rs.getString("subject")%></td><td><%=rs.getString("totmark")%></td><td><%=rs.getString("ce")%></td>
            <td><%=rs.getString("total")%></td><td><%=rs.getString("grade")%></td><td><%=rs.getString("result")%></td></tr>
    
    <%
            }
        }
    %>   
   </table>
    </form>
    </div>
    </body>
</html>
