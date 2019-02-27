<%-- 
    Document   : studatt
    Created on : Feb 16, 2019, 11:45:59 AM
    Author     : STUDENTS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
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
        <script type="text/javascript">
            function check(){
          var d1=document.getElementById("fdt").value  ;
          var d2=document.getElementById("tdt").value  ;
          if(d1>d2)
          alert("d1")
            }
        </script>
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
        <li ><a href="profile.jsp">Profile</a></li>
        <li ><a href="">News</a></li>
        <li ><a href="logout.jsp">SignOut</a></li>
        </ul>
        <div align="right">Welcome <%=us%></div>
        <% 
            
            Date d=new Date();
            DateFormat df=new SimpleDateFormat("yyyy-MM-dd");            
            String dt=df.format(d);  out.print(dt );
                
        %>
        <center><h3>Attendence Details</h3></center><br>
        <div align="center">
        <form action="studattServlet" method="post">
        From Date&nbsp; <input type="date" min='2018-06-01' max='2019-03-31' value='<%=dt%>' name="fdt" id="fdt"/>&nbsp;
        To Date&nbsp;<input type="date" min='2018-06-01' max='2019-03-31' value='<%=dt%>' name="tdt" id="tdt"/>&nbsp;
        <input type="submit" value="View" onclick="check()" /><br><br>
        <%
        ResultSet rs=(ResultSet)request.getAttribute("res");
        
        if(rs!=null){
    %>
        <table>
        <tr><th>Date</th><th>Attendence</th></tr>
        <%    
            while(rs.next()){
    %>
    
        <tr><td><%=rs.getString("adate")%></td><td><%=rs.getString("att")%></td></tr>
            
    
    <%
            }
        }
    %>   
        </table>
        </form>
        </div>
    </body>
</html>
