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
public class profServlet extends HttpServlet {

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
            String b=request.getParameter("bt");out.print(b);
            String ano=request.getParameter("ano");out.print(ano);
            String pic=request.getParameter("myfile");
            String sports=request.getParameter("sports");
            String mem=request.getParameter("mem");
            String arts=request.getParameter("arts");
            String n1=request.getParameter("nss");
            String n2=request.getParameter("ncc");
            String n3=request.getParameter("sg");
          //  out.print(pic);
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s="jdbc:sqlserver://localhost;databaseName=schooldb;user=sa;password=password123";
            Connection con=DriverManager.getConnection(s);
            if(b.equals("View")){out.print("vw");
                String q1="select * from student where admno=?";
                 PreparedStatement ps=con.prepareStatement(q1);
                ps.setInt(1,Integer.parseInt(ano));
                ResultSet rs=ps.executeQuery();out.print(rs);
                if(rs!=null){
                request.setAttribute("ano", ano);    
                request.setAttribute("res", rs);
                RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
                rd.forward(request, response);
                }
               
            }
            if(b.equals("Add")){
                String q="insert into profile values(?,?,?,?,?,?,?)";            
                PreparedStatement ps=con.prepareStatement(q);
                ps.setInt(1,Integer.parseInt(ano));
                ps.setString(2, sports);
                ps.setString(3, arts);
                ps.setString(4, mem);
                ps.setString(5, n2);
                ps.setString(6, n3);
                ps.setString(7, pic);
               
                int c=ps.executeUpdate();
                if(c==1){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Profile added successfully');");
                    out.println("location='Staffhome.jsp';");
                    out.println("</script>");
                }
            }
        } catch (ClassNotFoundException ex) {
           ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        catch (NumberFormatException ex) {
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
