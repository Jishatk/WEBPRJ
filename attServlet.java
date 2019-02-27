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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import java.util.List;
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
public class attServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String val=request.getParameter("b");
            String fac=request.getParameter("st");
            String cls=request.getParameter("cl");
            String div=request.getParameter("dv");out.print(cls+div+fac);
            List l=new ArrayList();
            Date dt=new Date();
            java.sql.Date sqldt1=new java.sql.Date(dt.getTime());out.print(sqldt1);
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s="jdbc:sqlserver://localhost;databaseName=schooldb;user=sa;password=password123";
            Connection con=DriverManager.getConnection(s);
            if(val.equals("Get")){
               
                String q1="select fname,lname,admno from student where standard=? and div=?";
                PreparedStatement ps=con.prepareStatement(q1);
                ps.setInt(1, Integer.parseInt(cls));
                ps.setString(2, div);
                ResultSet rs=ps.executeQuery();//out.print(rs);
                request.setAttribute("res", rs);
                request.setAttribute("cls", cls);
                request.setAttribute("div", div);
                request.setAttribute("fac", fac);//out.print("rs");
                RequestDispatcher rd=request.getRequestDispatcher("Markatt.jsp");
                rd.forward(request, response);
            }
            if(val.equals("Ok")){
               out.print(cls+div);
                String nam[]=request.getParameterValues("sname");
                String adno[]=request.getParameterValues("ano");
                String stat[]=request.getParameterValues("att");
                for(String sn:nam){
                 //  out.print(sn); 
                }
                for(int i=0;i<stat.length-1;i++)
                {
                    if(stat[i].equals("p") && stat[i+1].equals("a"))
                    {
                        l.add("p");
                    }
                    if(!stat[i].equals("p") && stat[i+1].equals("a"))
                    {
                        l.add("a");
                    }
                }
        
                for(int i=0;i<l.size();i++)
                {
                 out.print(l.get(i)); 
                   
                }
                
                 String q1="insert into attendence values(?,?,?,?,?,?,?)";
                 PreparedStatement ps=con.prepareStatement(q1);
                for(int i=0;i<nam.length;i++)
                {
                   ps.setString(1, nam[i]);
                   ps.setString(2,(String)l.get(i));
                   ps.setDate(3, sqldt1);
                   ps.setInt(4,Integer.parseInt(cls));
                   ps.setString(5, div);
                   ps.setString(6, fac);
                   ps.setInt(7, Integer.parseInt(adno[i]));
                   int c=ps.executeUpdate();
                }
                
                //out.print(rs);
                
           //out.print(c); //out.print(stat[0]+stat[1]);
            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        catch (NumberFormatException ex) {
            ex.printStackTrace();
        }
        catch (NullPointerException ex) {
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
