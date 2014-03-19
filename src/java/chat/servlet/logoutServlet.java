
package chat.servlet;

import chat.Clear;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class logoutServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //String value=null;
            Cookie[] cookies = request.getCookies();
            
            for(int i=0; i < cookies.length;i++){
                if(cookies[i].getName().equals("user") || cookies[i].getName().equals("JSESSIONID")){
                    cookies[i].setMaxAge(0);
                    cookies[i].setMaxAge(-1);
                    cookies[i].setValue(null);
                }   
            }
            //Integer x =Clear.getActiveSessions();
            if((Clear.getActiveSessions()) == 0){
                    File f = new File("C://Documents and Settings/Dexterity 101/.netbeans/7.0/apache-tomcat-7.0.14.0_base/webapps/chathistory/chat.txt");
                    f.delete();
                }
            RequestDispatcher rd1 = request.getRequestDispatcher("/mainFrame.jsp");
            rd1.forward(request, response);
            out.println("Sign Out Successful");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
