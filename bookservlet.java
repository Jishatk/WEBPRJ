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
public class bookservlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String bname=request.getParameter("bname");
            String aname=request.getParameter("aname");
            String qty=request.getParameter("qty");
            PreparedStatement ps,ps1,ps2=null;
            ResultSet rs=null;
            int qt=0;
            int bkid=0;
            int c=0;
            String q="";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s="jdbc:sqlserver://localhost;databaseName=schooldb;user=sa;password=password123";
            Connection con=DriverManager.getConnection(s);
            String q1="select * from books where bookname=? and authorname=?";
            ps1=con.prepareStatement(q1);
            ps1.setString(1,bname);
            ps1.setString(2,aname);
            rs=ps1.executeQuery();
            if(rs.next()){
                qt=rs.getInt("quantity");
                bkid=rs.getInt("bookid");
                q="update books set quantity=? where bookid=?";
                ps2=con.prepareStatement(q);
                ps2.setInt(1, qt+Integer.parseInt(qty));
                ps2.setInt(2, bkid);
                c=ps2.executeUpdate();
            }
            else{
                q="insert into books values(?,?,?)";
                
                ps=con.prepareStatement(q);
                ps.setString(1,bname);
                ps.setString(2,aname);
                ps.setString(3,qty);
                c=ps.executeUpdate();
                out.print(c);
            }
            if(c==1){
                RequestDispatcher rd=request.getRequestDispatcher("library.jsp");
                rd.forward(request, response);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(bookservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(bookservlet.class.getName()).log(Level.SEVERE, null, ex);
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
