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
import java.sql.Statement;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class studattServlet extends HttpServlet {

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
            HttpSession sess=request.getSession(true);
            String us=(String)sess.getAttribute("user");
            String dt1=request.getParameter("fdt");
            String dt2=request.getParameter("tdt");
            DateFormat df=new SimpleDateFormat("yyyy-mm-dd");
            Date fdt=df.parse(dt1);out.print(us);
            java.sql.Date sdt1=new java.sql.Date(fdt.getTime());
            out.print(dt1+dt2);
            Date tdt=df.parse(dt2);
            java.sql.Date sdt2=new java.sql.Date(tdt.getTime());
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s="jdbc:sqlserver://localhost;databaseName=schooldb;user=sa;password=password123";
            String q="select * from attendence where admno=(select admno from student where uname=?)";
            Connection con=DriverManager.getConnection(s);
            PreparedStatement ps=con.prepareStatement(q);
            ps.setString(1, us);
            ResultSet rs=ps.executeQuery();
            if(rs!=null){
               request.setAttribute("res", rs);
                   RequestDispatcher rd=request.getRequestDispatcher("studatt.jsp");
                   rd.forward(request, response); 
            }
            
        } catch (ParseException ex) {
            ex.printStackTrace();
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
