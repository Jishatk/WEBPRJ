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
import javax.servlet.http.HttpSession;

/**
 *
 * @author STUDENTS
 */
public class logServlet extends HttpServlet {

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
            String q="";
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String rol=request.getParameter("role");
            String uname=request.getParameter("name");
            String pass=request.getParameter("Password");
            out.print(rol+uname+pass);
            PreparedStatement ps=null;
            ResultSet rs=null;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s="jdbc:sqlserver://localhost;databaseName=schooldb;user=sa;password=password123";
            Connection con=DriverManager.getConnection(s);
            HttpSession sess=request.getSession(true);
            sess.setAttribute("user",uname);
            if(uname.equals("admin") && pass.equals("admin123") && rol.equals("admin")){
                RequestDispatcher rd=request.getRequestDispatcher("Adminhome.jsp");
                rd.forward(request, response);
            }
            if(uname.equals("libadmin") && pass.equals("lib123") && rol.equals("lib")){
                RequestDispatcher rd=request.getRequestDispatcher("lib/library.jsp");
                rd.forward(request, response);
            }
            if(rol.equals("student"))
            {
                q="select uname,pass from student where uname=? and pass=?";
                ps=con.prepareStatement(q);
                ps.setString(1, uname);
                ps.setString(2, pass);
                rs=ps.executeQuery();
                if(rs.next())
                {
                    RequestDispatcher rd=request.getRequestDispatcher("Studhome.jsp");
                    rd.forward(request, response);
                }
                else{
                    RequestDispatcher rd=request.getRequestDispatcher("index.html");
                    rd.forward(request, response);
                }
            }
            if(rol.equals("staff"))
            {
                q="select username,password from staff where username=? and password=?";
                ps=con.prepareStatement(q);
                ps.setString(1, uname);
                ps.setString(2, pass);
                rs=ps.executeQuery();
                if(rs.next())
                {
                    RequestDispatcher rd=request.getRequestDispatcher("Staffhome.jsp");
                    rd.forward(request, response);
                }
                else{
                    RequestDispatcher rd=request.getRequestDispatcher("index.html");
                    rd.forward(request, response);
                }
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(logServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(logServlet.class.getName()).log(Level.SEVERE, null, ex);
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
