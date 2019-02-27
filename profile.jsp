<%-- 
    Document   : profile
    Created on : Feb 16, 2019, 4:23:44 PM
    Author     : STUDENTS
--%>

<%@page import="java.sql.Statement"%>
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
       
       
       
        </style>
    </head>
    <body>
        <%
          HttpSession sess=request.getSession(true);
          String us=(String)sess.getAttribute("user");
        %>   
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
        <div align="right">Welcome </div>
        <%
            String fnam="",lnam="",div="",unam="",admno="",std="";
          //  int std=0;
           
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s="jdbc:sqlserver://localhost;databaseName=schooldb;user=sa;password=password123";
            Connection con=DriverManager.getConnection(s);
           // String q="select * from student where admno=(select admno from student where uname=?)";
           // String q1="select admno from student";
           // Statement st=con.createStatement();
           // ResultSet rs1=st.executeQuery(q1);
          /*  PreparedStatement ps=con.prepareStatement(q); 
            ps.setString(1, "fth@gmail.com");
            ResultSet rs=ps.executeQuery();
            rs.next();*/
          String ano=(String)request.getAttribute("ano");out.print("ano"+ano);
         /* if(ano!=null){
             admno=ano;
          }*/
         
          ResultSet rs1=(ResultSet)request.getAttribute("res");
            if(rs1!=null){
                rs1.next();
                fnam=rs1.getString("fname");
                lnam=rs1.getString("lname");
                div=rs1.getString("div");
                unam=rs1.getString("uname");
                std=rs1.getString("standard");
            }
         %>  
         
    <center>Profile</center>
        <div style="font-size:large; colour: #313A3D;border-style: ridge;width:600px;height:550px; margin-left:250px;padding-left: 20px">
             <br><br>
             <form action="profServlet" method="post">
         <table  width="100%">
             <tr>
                 <td><label class="lbl">Adm. No. </label></td>
                 <td><% if(ano!=null){%>
                     <input type="text" name="ano" value="<%=ano%>" ><%}else{%>
                     <input type="text" name="ano"  ><%}%>
                     <input type="submit" value="View" name="bt"/>
                 </td>
                 <tr>
                      <tr>
                          <td><label class="lbl">Name</label></td><td><input type="text" name="nam" value="<%=fnam%>" readonly></td>
             </tr>
                 <td><label class="lbl">Class</label></td><td><input type="text" name="cl" value="<%=std %>" readonly></td>
             </tr>
              <tr>
                 <td><label class="lbl">Div</label></td><td><input type="text" name="div" value="<%=div %>" readonly></td>
             </tr>
             <tr>
                 <td><label class="lbl">username </label></td><td><input type="text" name="uname" value="<%=unam%>" readonly/></td>
             </tr>
             <%// }} %>
             <tr>
                 <td><label class="lbl">Upload Photo</label></td><td><input type="file" name="myfile" ></td>
             </tr>
             
         
       
 <!--   <center> Extra Curriculars</center>-->
   <!--      <div style="font-size:large; colour: #313A3D;border-style: ridge;width:600px;height:250px; margin-left:250px">-->
         
               <tr>
                 <td><label class="lbl">Sports </label></td>
                 <td><textarea name="sports" rows="4" cols="30"></textarea></td>
               </tr>
               
                <tr>
                 <td><label class="lbl">Arts</label></td>
                 <td><textarea name="arts" rows="4" cols="30"></textarea></td>                 
                </tr>
                <tr>
                    <td>Member</td>
                    <td><select name="mem">
                            <option value="select">select</option>
                            <option value="Science Club">Science Club</option>
                            <option value="Maths Club">Maths Club</option>
                            <option value="Nature Club">Nature Club</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label class="lbl">Member</label></td>
                    <td>
                      
                        <input type="checkbox" name="ncc" value="NCC" />NCC
                        <input type="checkbox" name="sg" value="SCOUTS & GUIDES" />SCOUTS & GUIDES
                    </td>
                </tr>
                <tr>
                 <td></td>
                 <td><input type="submit" value="Add" name="bt"/></td>                 
                </tr>
             </table>  
           </form>    
        </div>
         
    </body>
</html>
