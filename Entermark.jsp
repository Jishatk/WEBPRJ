<%-- 
    Document   : Entermark
    Created on : Feb 8, 2019, 3:12:05 PM
    Author     : STUDENTS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendence</title>
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
        <a href="Viewatt.jsp">View Marks</a>
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
        <br>
      <center><h3> Mark Entry</h3></center><br><br>
    
        <form action="markServlet" method="post">  
            <%
            ResultSet rs=(ResultSet)request.getAttribute("res");
            String c="",d="",name="";
            if(rs!=null){
                c=(String)request.getAttribute("cls");
                d=(String)request.getAttribute("div");
                name=(String)request.getAttribute("fac");
            }
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s="jdbc:sqlserver://localhost;databaseName=schooldb;user=sa;password=password123";
            Connection con=DriverManager.getConnection(s);
            String q="select fname,lname from staff";
            Statement st=con.createStatement();
        
            
        %>    
        Class <input type="text" name="cl" value="<%=c%>" />&nbsp;&nbsp;&nbsp;
            Div <input type="text" name="dv" value="<%=d%>" />
          &nbsp;&nbsp;&nbsp;
          
          <input type="submit" value="Get" name="b"/><br><br><br>   
          Staff   <select name="st">
                <option value="select">select</option>
                <% 
                ResultSet rs1=st.executeQuery(q);
                while(rs1.next()){
                name=rs1.getString("fname")+" "+rs1.getString("lname");
                %>
                <option value="<%=name%>"><%=name%></option>
                <%}%>
                </select>&nbsp;&nbsp;
         Subject <select name="sub"> 
             <option value="select">select</option>
             <option value="English">English</option>
             <option value="Hindi">Hindi</option>
             <option value="Maths">Maths</option>
             <option value="Science">Science</option>
         </select><br><br><br>  
         <table>
              <tr><td>Adm No</td><td>Student Name</td><td>Marks1</td><td>Marks2</td></tr>
         <%
            int i=1;
             if(rs!=null){
             while(rs.next()) {
         %>    
         <tr><td><input style="border:#ffffff; width:20px" name="adm" type="text" value='<%=rs.getString("admno")%>' readonly="readonly"></td><td><input style="border:#ffffff" type="text" value='<%=rs.getString("sname")%>' name="sname" readonly="readonly"></td>
             <td><input type="text" name="mark1" value=""/></td><td><input type="text" name="mark2" value=""/></td></tr>
          <%
              i++;
              }
            }
          %>    
          </table><br><br><br>
          <input type="submit" value="Enter" name="b"/>
        </form> 
    </body>
</html>
