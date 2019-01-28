/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author STUDENTS
 */
public class issueServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String bname=request.getParameter("bname");
            String aname=request.getParameter("aname");
            String sname=request.getParameter("sname");
            String lname=request.getParameter("lname");
            
            DateFormat df=new SimpleDateFormat("yyyy-mm-dd");
            Date dt=new Date();
            long lt=dt.getTime()+7*24*60*60*1000;
            java.sql.Date sqldt1=new java.sql.Date(dt.getTime());out.print(sqldt1);
            Date rdt=new Date(lt);
            java.sql.Date sqldt2=new java.sql.Date(rdt.getTime());out.print(sqldt2);
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");   
            String s="jdbc:sqlserver://localhost;databaseName=schooldb;user=sa;password=password123";
            Connection con=DriverManager.getConnection(s);
            String q="select staffid from staff where fname=? and lname=? ";
            PreparedStatement p=con.prepareStatement(q);
            p.setString(1,sname);
            p.setString(2,lname);            
            ResultSet rs=p.executeQuery();
            rs.next();            
            int sid=rs.getInt("staffid");
            String q1="select quantity,bookid from books where bookname=? and authorname=? ";
            PreparedStatement p1=con.prepareStatement(q1);
            p1.setString(1,bname);
            p1.setString(2,aname);
            ResultSet rs1=p1.executeQuery();
            rs1.next();
            int qty=rs1.getInt("quantity");
            int bkid=rs1.getInt("bookid");
            
            if(qty>0)
            {
                String q2="insert into bkissue2 values(?,?,?,?,?,?,?)";
                PreparedStatement p2=con.prepareStatement(q2);
                p2.setInt(1,sid);
                p2.setString(2,sname+" "+lname);
                p2.setString(3,bname);
                p2.setString(4,aname);
                p2.setDate(5, sqldt1);
                p2.setDate(6, sqldt2);               
                p2.setInt(7, bkid);
                int c=p2.executeUpdate();
                if(c==1){
                    String q3="update books set quantity=? where bookname=? and authorname=?";
                    PreparedStatement p3=con.prepareStatement(q3);
                    p3.setInt(1, qty-1);
                    p3.setString(2, bname);
                    p3.setString(3, aname);
                    int c1=p3.executeUpdate();
                    out.print(c1);
                }
            }
        } catch (ClassNotFoundException ex) {
             ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
