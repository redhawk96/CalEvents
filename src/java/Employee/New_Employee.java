/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Uditha
 */
@WebServlet(name = "New_Employee", urlPatterns = {"/E-Management/New-Employee"})
public class New_Employee extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            
           Object authenticate = request.getSession(false).getAttribute("authenticated");
           if(null != authenticate){
           // Creating a object of employee class to get a new employee id
           Employee employee = new Employee();
           
            try {
                // Getting a new id (last id + 1) to add an new employee
                Integer empId = employee.getLastId();
                
                // Setting the new id to a session variable
                request.getSession().setAttribute("empId", empId);
                
                // Setting active nav links
                request.getSession().setAttribute("nav00", "w3-text-gray");
                request.getSession().setAttribute("nav01", "w3-blue");
                request.getSession().setAttribute("nav02", "");
                request.getSession().setAttribute("nav03", "");
                request.getSession().setAttribute("nav04", "");
		request.getSession().setAttribute("nav05", "");
                request.getSession().setAttribute("nav06", "");
                
                
                request.getRequestDispatcher("/User/New_Employee.jsp").forward(request, response);
                
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(New_Employee.class.getName()).log(Level.SEVERE, null, ex);
            }
            }else{
                    response.sendRedirect("/CalEvents/Admin");
                }
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
