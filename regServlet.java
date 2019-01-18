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
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author STUDENTS
 */
public class regServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         long lmob=0;int istd=0;
            String fname=request.getParameter("fname");
            String lname=request.getParameter("lname");
            String gname=request.getParameter("gname");
            String dob=request.getParameter("dob");
            String mob=request.getParameter("mob");
            String email=request.getParameter("email");
            String addr=request.getParameter("addr");
            String gen=request.getParameter("gender");
            String rel=request.getParameter("rel");
            String std=request.getParameter("std");
            String div=request.getParameter("div");
            String uname=request.getParameter("uname");
            String pass=request.getParameter("pass");
         try {    
            DateFormat df=new SimpleDateFormat("yyyy-mm-dd");
        
            Date db=df.parse(dob);
            java.sql.Date dt=new java.sql.Date(db.getTime());
            try{
            lmob=Long.parseLong(mob);
            istd=Integer.parseInt(std);
            }
            catch(NumberFormatException nfe)
            {
                
            }
            out.print(fname+lname+gname+dt+addr+gen+rel);out.print(mob+email);
           
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s="jdbc:sqlserver://localhost;databaseName=schooldb;user=sa;password=password123";
            String q="insert into student values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            Connection con=DriverManager.getConnection(s);
            PreparedStatement ps=con.prepareStatement(q);
            ps.setString(1,fname);
            ps.setString(2,lname);
            ps.setString(3,gname);
            ps.setDate(4,dt);
            ps.setLong(5,lmob);
            ps.setString(6,email);
            ps.setString(7,addr);
            ps.setString(8,gen);
            ps.setString(9,rel);
            ps.setInt(10,istd);
            ps.setString(11,div);
            ps.setString(12,uname);
            ps.setString(13,pass);
            int c=ps.executeUpdate();
            out.print(c);
            if(c==1){
                RequestDispatcher rd=request.getRequestDispatcher("index.html");
                rd.forward(request, response);
            }
            
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ParseException ex) {
            ex.printStackTrace();
        }

           
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
