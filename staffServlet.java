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
public class staffServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        long lmob=0l;
        int istd;
         String fname=request.getParameter("fname");
            String lname=request.getParameter("lname");
            String gname=request.getParameter("gname");
            String dob=request.getParameter("dob");
            String mob=request.getParameter("mob");
            String email=request.getParameter("email");
            String addr=request.getParameter("addr");
            String gen=request.getParameter("gender");
            String uname=request.getParameter("uname");
            String pass=request.getParameter("pass");
         try {    
            DateFormat df=new SimpleDateFormat("yyyy-mm-dd");
        
            Date db=df.parse(dob);
            java.sql.Date dt=new java.sql.Date(db.getTime());
            try{
            lmob=Long.parseLong(mob);
           
            }
            catch(NumberFormatException nfe)
            {
                
            }
            out.print(fname+lname+gname+dt+addr+gen);out.print(mob+email);
           
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s="jdbc:sqlserver://localhost;databaseName=schooldb;user=sa;password=password123";
            String q="insert into staff values(?,?,?,?,?,?,?,?,?)";
            Connection con=DriverManager.getConnection(s);
            PreparedStatement ps=con.prepareStatement(q);
            ps.setString(1,fname);
            ps.setString(2,lname);
            ps.setString(3,gen);
            ps.setLong(4,lmob);
            ps.setString(5,gname);
            ps.setString(6,email);
            ps.setDate(7,dt);
                      
            ps.setString(8,uname);
            ps.setString(9,pass);
            int c=ps.executeUpdate();
            out.print(c);
            if(c==1){
                RequestDispatcher rd=request.getRequestDispatcher("index.html");
                rd.forward(request, response);
            }
            
        } catch (ParseException ex) {
            ex.printStackTrace();
        }catch (ClassNotFoundException ex) {
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
