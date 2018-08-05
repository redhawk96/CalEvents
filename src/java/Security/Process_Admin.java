/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Security;
import Employee.Employee;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
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
@WebServlet(name = "Process_Admin", urlPatterns = {"/Process_Admin"})
public class Process_Admin extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
           
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            try{
                HashPassword hashPassword = new HashPassword(password);
                String encrypt_password = hashPassword.generatePassword();
                
                Authenticate authenticate = new Authenticate(username, encrypt_password);
                String result = authenticate.validateAdmin();
                
                Integer rowCount = Integer.parseInt(result);
                
                if(rowCount == 1){
                    
                    String privilege_mode = authenticate.getPrivilegeMode();
                    
                    request.getSession().setAttribute("privilege_mode", privilege_mode);
                    request.getSession().setAttribute("authenticated", "user_authenticated");
                    
                    String department = authenticate.getDepartment();
                    
                    ResultSet res = Employee.readEmployeeProfile(username);
                    while (res.next()) {

                       // Read table fields and set to session variables
                       request.getSession().setAttribute("p_id", res.getString("id"));
                       request.getSession().setAttribute("p_username", res.getString("username"));
                       request.getSession().setAttribute("p_nic", res.getString("nic"));
                       request.getSession().setAttribute("p_first_name", res.getString("first_name"));
                       request.getSession().setAttribute("p_last_name", res.getString("last_name"));
                       request.getSession().setAttribute("p_id", res.getString("id"));
                       request.getSession().setAttribute("p_address_line_1", res.getString("address_line_1"));
                       request.getSession().setAttribute("p_address_line_2", res.getString("address_line_2"));
                       request.getSession().setAttribute("p_city", res.getString("city"));
                       request.getSession().setAttribute("p_zip", res.getString("zip"));
                       request.getSession().setAttribute("p_country", res.getString("country"));
                       request.getSession().setAttribute("p_contact_number", res.getString("contact_number"));
                       request.getSession().setAttribute("p_avatar", res.getString("avatar"));
                       request.getSession().setAttribute("p_gender", res.getString("gender"));
                       request.getSession().setAttribute("p_department", res.getString("department"));
                       request.getSession().setAttribute("p_privilege_mode", res.getString("privilege_mode"));
                       
                    }
                    
                    
                    switch(department){
                        
                        case "Event Department" : response.sendRedirect("E-Management/Dashboard"); break;
                        case "Menu Department" : response.sendRedirect("EManagement/Dashboard"); break;
                        case "Gallery Department" : response.sendRedirect("Administrator/Dashboard"); break;
                        case "Facility Department" : response.sendRedirect("Administrator/Dashboard"); break;
                        case "Kitchen Department" : response.sendRedirect("Administrator/Dashboard"); break;
                        case "Customer Department" : response.sendRedirect("Administrator/Dashboard"); break;
                        case "Human Resource Department" : response.sendRedirect("Administrator/Dashboard"); break;
                    }
               
                }else{
                    response.sendRedirect("Admin");
                }
                
            }catch(Exception e){
                out.print(e);
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
