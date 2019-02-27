<%-- 
    Document   : profileupdate
    Created on : Feb 21, 2019, 2:55:45 PM
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
        //  HttpSession sess=request.getSession(true);
         // String us=(String)sess.getAttribute("user");
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
            String fnam="",lnam="",gnam="",mail="",mob="",addr="",rel="",pass="",db="",gen="",pic="",unam="";
            String sports="",arts="",n1="",n2="",club="";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s="jdbc:sqlserver://localhost;databaseName=schooldb;user=sa;password=password123";
           // String q="select * from student s join profile p on s.admno=p.admno where s.admno=(select admno from student where uname=?);";
           String q1="select admno from student";
            Connection con=DriverManager.getConnection(s);
            Statement st=con.createStatement();            
            ResultSet rs1=st.executeQuery(q1);
           ResultSet rs=(ResultSet)request.getAttribute("res");out.print(rs);
           String an=(String)request.getAttribute("no");out.print(an);
           if(rs!=null){
           rs.next();
           pic=rs.getString("pic");
           fnam=rs.getString("fname");
           lnam=rs.getString("lname");
           gnam=rs.getString("gname");
           unam=rs.getString("uname");
           db=rs.getString("dob");
           mail=rs.getString("email");
           mob=rs.getString("mob");
           addr=rs.getString("addr");
           gen=rs.getString("gender");
           rel=rs.getString("religion");
           pass=rs.getString("pass");
           sports=rs.getString("sports");
           arts=rs.getString("arts");
           club=rs.getString("club");
           n1=rs.getString("n1");
           n2=rs.getString("n2");
           }
         %> 
         <form action="profeditServlet" method="post">
         <center><h3>Personal Info</h3></center>
         <div style="font-size:large; colour: #313A3D;border-style: ridge;width:600px;height:450px; margin-left:250px">
             <br><br>
          <table>
             <tr>
                 <td></td><td></td>
                 <td><label class="lbl">Profile Picture </label></td><td><img src="images/<%=pic%>" width="100" height="100" /></td>
             </tr>
             <tr>
                 <td><label class="lbl">Admission No. </label></td>
                 <td><%  if(an!=null) { int ano=Integer.parseInt(an);%><select name="ano"><option value="<%=ano%>"><%=ano%></option></select><% } else { %>
                     <select name="ano"><option value="select">select</option>
                         <% while(rs1.next()){ %><option value="<%=rs1.getString("admno")%>"><%=rs1.getString("admno")%></option><% } %>
                            
                     </select><% } %><input type="submit" value="View" />
                         </td>
                 <td><label class="lbl">username </label></td><td><input type="text" name="uname" value="<%=unam%>" readonly /></td>
             </tr>
             <tr>
                 <td><label class="lbl">First Name </label></td><td><input type="text" name="fname" value="<%=fnam %>"/></td>
                 <td><label class="lbl">Last Name </label></td><td><input type="text" name="lname" value="<%=lnam %>"/></td>
             </tr>
             <tr>
                 <td><label class="lbl">Guardian Name </label></td><td><input type="text" name="gname" value="<%=gnam%>"/></td>
                 <td><label class="lbl">Date Of Birth </label></td><td><input type="text" name="dob" value="<%=db%>"/></td>
             </tr>
             <tr>
                 <td><label class="lbl">Email </label></td><td><input type="email" name="email" value="<%=mail%>"/></td>
                 <td><label class="lbl">Mobile </label></td><td><input type="text" name="mob" value="<%=mob%>"/></td>
             </tr>
             <tr>
                 <td><label class="lbl">Address </label></td><td><textarea rows="4" cols="30" name="addr" ><%=addr%></textarea></td>
                 <td><label class="lbl">Gender </label></td><td><input type="text" name="gen" value="<%=gen%>"/></td>
             </tr>
             <tr>
                 <td><label class="lbl">Religion </label></td><td><input type="text" name="rel" value="<%=rel%>"/></td>
                 <td><label class="lbl">Password </label></td><td><input type="text" name="pwd" value="<%=pass%>"/></td>
             </tr>
             <tr>
                 <td><label class="lbl">Upload Photo</label></td><td><input type="file" name="myfile"></td>
             </tr>
             
          </table>
         </div>
         
         <center><h3> Extra Curriculars</h3></center>
           <div style="font-size:large; colour: #313A3D;border-style: ridge;width:600px;height:320px; margin-left:250px">
             <br>
             <table>
               <tr>
                 <td><label class="lbl">Sports </label></td>
                 <td><textarea name="sports" rows="4" cols="50"><%=sports%></textarea></td>
               </tr>
               
                <tr>
                 <td><label class="lbl">Arts</label></td>
                 <td><textarea name="arts" rows="4" cols="50"><%=arts%></textarea></td>                 
                </tr>
                <tr>
                 <td><label class="lbl">Club Details</label></td>
                 <td><input type="text" name="club" value="<%=club%>"/></td>                 
                </tr>
                <tr>
                    <td><label class="lbl">Member</label></td>
                    <td>
                        <%if(n1.equals("NCC")) { %>
                        <input type="checkbox" name="ncc" value="<%=n1%>" checked />NCC
                        <%} else {%>
                        <input type="checkbox" name="ncc" value="NCC" />NCC
                        <%}
                        if(n2.equals("SCOUTS&GUIDES")) {%>
                        <input type="checkbox" name="sg" value="<%=n2%>" checked />SCOUTS & GUIDES
                        <% }else {%>
                         <input type="checkbox" name="sg" value="SCOUTS & GUIDES" />SCOUTS & GUIDES
                        <% }%>
                    </td>
                </tr>
                <tr>
                 <td><input type="submit" value="Update"/></td>
                 <td></td>                 
                </tr>
             </table>  
               
         </div>
         </form>
    </body>
</html>
