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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author STUDENTS
 */
public class studmarkServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String sub=request.getParameter("sub");request.setAttribute("sub",sub);
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s="jdbc:sqlserver://localhost;databaseName=schooldb;user=sa;password=password123";
            Connection con=DriverManager.getConnection(s);
            if(sub.equals("All")){
               String q="select * from result where sname=?" ;
               PreparedStatement pst=con.prepareStatement(q);
               pst.setString(1, "Sandra k");
               ResultSet rs=pst.executeQuery();
             //  rs.next();
               if(rs!=null){
                   request.setAttribute("res", rs);
                   RequestDispatcher rd=request.getRequestDispatcher("studmark.jsp");
                   rd.forward(request, response);
               }
            }
            else{
               String q="select * from result where sname=? and subject=?" ;
               PreparedStatement pst=con.prepareStatement(q);
               pst.setString(1, "Sandra k");
               pst.setString(2, sub);
               ResultSet rs=pst.executeQuery();
             //  rs.next();
               if(rs!=null){
                   request.setAttribute("res", rs);
                   RequestDispatcher rd=request.getRequestDispatcher("studmark.jsp");
                   rd.forward(request, response);
               } 
            }
        } catch (ClassNotFoundException ex) {
             ex.printStackTrace();
        } catch (SQLException ex) {
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
