/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package chat.servlet;
import chat.writer;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class sendServlet extends HttpServlet {
    private String colr="blue";

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String inc = request.getParameter("incoming");
           
            
            String value = null ;
            
            Cookie[] cookies = request.getCookies();
            
            for(int i=0; i < cookies.length;i++){
                if(cookies[i].getName().equals("user")){
                    value = cookies[i].getValue();
                }   
            }
            
            SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
            long timef = System.currentTimeMillis();
            String time = dateFormat.format(timef);
            String incoming = "<font color='"+colr+"'>("+ time+") | <b>" + value + "</b> |</font> " + inc;
        
            writer rd = new writer(incoming);
            RequestDispatcher rd1 = request.getRequestDispatcher("/msgSender.jsp");
            rd1.forward(request, response);
            
        } finally {            
            out.close();
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

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
