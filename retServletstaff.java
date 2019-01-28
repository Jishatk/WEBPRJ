/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import static control.retServletstud.bid;
import static control.retServletstud.qty;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class retServletstaff extends HttpServlet {

   
    static int qty=0;
    static int bid=0;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String val=request.getParameter("b");
            String stid=request.getParameter("stid");
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s="jdbc:sqlserver://localhost;databaseName=schooldb;user=sa;password=password123";
            Connection con=DriverManager.getConnection(s);
            String q="";   
            PreparedStatement p,p1,p2=null; 
            if(val.equals("View")){
              q="select * from bkissue2 where staffid=?" ;
              p=con.prepareStatement(q);
              p.setString(1, stid);
              ResultSet rs=p.executeQuery();
              if(rs.next()){
                  bid=rs.getInt("bkid");
                   Statement st=con.createStatement();
                    ResultSet rs1=st.executeQuery("select quantity from books where bookid="+bid+"");
                    rs1.next();
                    qty=rs1.getInt("quantity");
                  request.setAttribute("res", rs);                  
                 RequestDispatcher rd=request.getRequestDispatcher("Studbookreturn.jsp");
                 rd.forward(request, response);
              }
            }
            if(val.equals("Return")){
                q="delete from bkissue2 where staffid=?";
                p1=con.prepareStatement(q);
                p1.setString(1, stid);
                int c=p1.executeUpdate();
                if(c==1){
                    String q1="update books set quantity=? where bookid=?";
                     p2=con.prepareStatement(q1);
                     p2.setInt(1, qty+1);
                     p2.setInt(2, bid);
                     int c1=p2.executeUpdate();
                     if(c1==1){
                         RequestDispatcher rd=request.getRequestDispatcher("library.jsp");
                         rd.forward(request, response);
                     }
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
