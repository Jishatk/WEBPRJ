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
public class markServlet extends HttpServlet {

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
            String val=request.getParameter("b");
            String cls=request.getParameter("cl");
            String div=request.getParameter("dv");out.print(cls+div);
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s="jdbc:sqlserver://localhost;databaseName=schooldb;user=sa;password=password123";
            Connection con=DriverManager.getConnection(s);
            if(val.equals("Get")){
               
                String q1="select fname+' '+lname as sname,admno from student where standard=? and div=?";
                PreparedStatement ps=con.prepareStatement(q1);
                ps.setInt(1, Integer.parseInt(cls));
                ps.setString(2, div);
                ResultSet rs=ps.executeQuery();//out.print(rs);
                request.setAttribute("res", rs);
                request.setAttribute("cls", cls);
                request.setAttribute("div", div);
               // request.setAttribute("fac", fac);//out.print("rs");
                RequestDispatcher rd=request.getRequestDispatcher("Entermark.jsp");
                rd.forward(request, response);
            }
            if(val.equals("Enter")){
                String fac=request.getParameter("st");
                String sub=request.getParameter("sub");
                String adm[]=request.getParameterValues("adm");
                String nam[]=request.getParameterValues("sname");
                String mark1[]=request.getParameterValues("mark1");
                String mark2[]=request.getParameterValues("mark2");
                String res[]=new String[mark1.length];
                int ano[]=new int[mark1.length];
                int m1[]=new int[mark1.length];
                int m2[]=new int[mark1.length];
                int tot[]=new int[mark1.length];
                String gr[]=new String[mark1.length];
                for(String sn:nam){
                   out.print(sn); 
                }
                for(int i=0;i<mark1.length;i++){
                   ano[i]= Integer.parseInt(adm[i]);
                   m1[i]=Integer.parseInt(mark1[i]);
                   m2[i]=Integer.parseInt(mark2[i]);
                   tot[i]=m1[i]+m2[i];
                   if(tot[i]>=80){
                       gr[i]="A";res[i]="pass";
                   }
                   else if(tot[i]>=60 && tot[i]<80){
                       gr[i]="B";res[i]="pass";
                   }
                   else if(tot[i]>=40 && tot[i]<60){
                       gr[i]="c";res[i]="pass";
                   }
                   else{
                       gr[i]="D";res[i]="fail";
                   }
                }
                String q1="insert into result values(?,?,?,?,?,?,?,?,?,?,?)";
                 PreparedStatement ps=con.prepareStatement(q1);
                 for(int i=0;i<nam.length;i++)
                {
                   ps.setInt(1,ano[i]);
                   ps.setString(2,nam[i]);
                   ps.setString(3,fac);
                   ps.setString(4,sub);
                   ps.setInt(5,Integer.parseInt(cls));
                   ps.setString(6, div);
                   ps.setInt(7, m1[i]);
                   ps.setInt(8, m2[i]);
                   ps.setInt(9, tot[i]);
                   ps.setString(10, gr[i]);
                   ps.setString(11, res[i]);
                   int c=ps.executeUpdate();
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
