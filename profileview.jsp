<%-- 
    Document   : profileview
    Created on : Feb 27, 2019, 11:24:05 AM
    Author     : STUDENTS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
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
        td{
            font-size: 20px;
            
            height:40px;
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
        <div align="right">Welcome </div>
        
        <%
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s="jdbc:sqlserver://localhost;databaseName=schooldb;user=sa;password=password123";
            String q="select * from student s join profile p on s.admno=p.admno where s.admno=(select admno from student where uname=?);";
            Connection con=DriverManager.getConnection(s);
            PreparedStatement ps=con.prepareStatement(q); 
            ps.setString(1, "sandra");
            ResultSet rs=ps.executeQuery();
            rs.next();//out.print("rs"+rs.getString("n2"));
            String n1=""+rs.getString("n1");//out.print("n1"+n1);
            if(n1.equals("null"))
                n1="";
            
             String n2=""+rs.getString("n2");//out.print("n2"+n2);
             if(n2.equals("null"))
                n2="";
           
         %>  
         <center><h3>Personal Info</h3></center>
         <div style="font-size:large; colour: #313A3D;border-style: ridge;width:700px;height:450px; margin-left:250px">
             <br><br>
             <table style="width:100%; width:200px; ">
             <tr>
                 <td></td><td></td>
                 <td></td><td><img src="images/<%=rs.getString("pic")%>" width="100" height="100" /></td>
             </tr>
             <tr>
                 <td>Admission No.  </td><td>: <%=rs.getString("admno")%></td>
                 <td>Username </td><td>: <%=rs.getString("uname")%></td>
             </tr>
             <tr>
                 <td>First Name </td><td>: <%=rs.getString("fname")%></td>
                 <td>Last Name </td><td>: <%=rs.getString("lname")%></td>
             </tr>
             <tr>
                 <td>Guardian Name </td><td>: <%=rs.getString("gname")%></td>
                 <td>Date Of Birth </td><td>: <%=rs.getString("dob")%></td>
             </tr>
             <tr>
                 <td>Email </td><td>: <%=rs.getString("email")%></td>
                 <td>Mobile </td><td>: <%=rs.getString("mob")%></td>
             </tr>
             <tr>
                 <td>Address </td><td>: <%=rs.getString("addr")%></td>
                 <td>Mobile </td><td>: <%=rs.getString("gender")%></td>
             </tr>
             <tr>
                 <td>Religion </td><td>: <%=rs.getString("religion")%></td>
                 <td>Password </td><td>: <%=rs.getString("pass")%></td>
             </tr>
             
         </table>
         </div>
         <center><h3> Extra Curriculars</h3></center>
         <div style="font-size:large; colour: #313A3D;border-style: ridge;width:600px;height:320px; margin-left:250px">
             <br>
             <table style="width:100% ">
               <tr>
                 <td>Sports </td>
                 <td><%=rs.getString("sports")%></td>
               </tr>
               
                <tr>
                 <td>Arts</td>
                 <td><%=rs.getString("arts")%></td>                 
                </tr>
                <tr>
                    <td>Club Details</td>
                    <td>: <%=rs.getString("club")%></td>                      
                 </tr>
                <tr>
                    <td>NCC/SCOUTS & GUIDES</td>
                    <td>: <%=n1%>  <%=n2%></td>                      
                 </tr>
             </table>  
               
         </div>
    </body>
</html>
