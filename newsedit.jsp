<%-- 
    Document   : newsedit
    Created on : Feb 25, 2019, 4:34:51 PM
    Author     : STUDENTS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>News</title>
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
        .lbl{
            width:100px;
            height:50px;
        }
        .txt{
            width:250px;
            height:40px;
        }
        .btn{
            width:100px;
            height:50px;
        }
        .slct{
            width:150px;
            height:50px;
        }
    </style>
    </head>
    <body>
         <ul id="menu">
    <li><a href="#">ALPHABET TRAINING</a></li>
    <li><a href="#Adminhome"></a></li>
    <li><a href="Adminhome.jsp">Home</a></li>
    <li class="dropdown">
        <a href="javascript:void(0)" class="dropbtn">Students</a>
        <div class="dropdown-content">
        <a href="Addstudent.jsp">Add Student</a>
        <a href="viewstudent.jsp">View Student</a>
        </div>
    </li>
    <li class="dropdown">
        <a href="javascript:void(0)" class="dropbtn">Staff</a>
        <div class="dropdown-content">
        <a href="Addstaff.jsp">Add Staff</a>
        <a href="viewstaff.jsp">View Staff</a>
        </div>
    </li>
    <li class="dropdown">
        <a href="javascript:void(0)" class="dropbtn">News</a>
        <div class="dropdown-content">
        <a href="news.jsp">Add News</a>
        <a href="newsedit.jsp">Edit News</a>
        </div>
    </li>
    <li ><a href="logout.jsp">SignOut</a></li>
  </ul>  <br><br>
        <%
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");            
            String s="jdbc:sqlserver://localhost;databaseName=schooldb;user=sa;password=password123";
            Connection con=DriverManager.getConnection(s);
            String q="select * from news";
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(q);
            ResultSet rs1=(ResultSet)request.getAttribute("res");
            String str=(String)request.getAttribute("tt");
            int id=0;
         %> 
         <div style="font-size:large; colour: #313A3D;border-style: ridge;width:450px;height:550px; margin-left:250px;padding-left: 20px"><br><br>
             <form action="newseditServlet" method="post">
             <label class="lbl">Title  </label><br><br>
             <% if(str!=null){%><select name="tit" class="slct">
                 <option value="<%=str%>"><%=str%></option></select><% }else{ %>
        <select name="tit" class="slct">
            <option value="select">select</option>
            <% while(rs.next()) {
               id=rs.getInt("refid");out.print(id);
            %>
            <option value="<%=rs.getString("head")%>"><%=rs.getString("head")%></option>
            <% } %>
        </select><% } %>&nbsp;&nbsp;<input type="submit" value="Get" class="btn" name="b"/><br><br><br>
        <input type="hidden" name="rid" value="<%=id%>"/>
        <label class="lbl">Description  </label><br><br>
        <textarea  name="desc" cols="50" rows="10"> 
            <%if(rs1!=null) { rs1.next();%><%=rs1.getString("descrptn")%><%}%>
        </textarea><br><br><br>
        <input type="submit" value="Edit" name="b"/>&nbsp;&nbsp;
        <input type="submit" value="Delete" class="btn" name="b"/>
             </form>
    </div>   
    </body>
</html>
