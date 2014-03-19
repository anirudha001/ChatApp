package chat.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class signInServlet extends HttpServlet {
 
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String uname = request.getParameter("uname");
        String passwd = request.getParameter("passwd");
        double ID=0;
        String pic="";
        boolean flag=false;
        
        
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatserver","root","root123");
            out.println("Database Connection Successful");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from profile");
            

            while(rs.next()){
                if((rs.getString(3).equals(uname))&&(rs.getString(4).equals(passwd))){
                    System.out.println("Signed in as "+uname);
                    ID = rs.getDouble(1);
                    pic = rs.getString(2);
                    flag = true;
                    
                }
            }
            
            if(flag=true){
            
                out.println("Login Successful");
                Cookie cookie = new Cookie("user", uname);
                response.addCookie(cookie);
                //request.setAttribute("uname", uname);
                //RequestDispatcher rd1 = request.getRequestDispatcher("/newWelcome.jsp");
                RequestDispatcher rd1 = request.getRequestDispatcher("/mainFrame.jsp");
                rd1.forward(request, response);
                out.println("Login Successful1");
            }
            else{
                
                System.out.println("Invalid Username or Password");
                out.println("Invalid Username or Password");
                RequestDispatcher rd2 = request.getRequestDispatcher("/signIn.jsp");
                rd2.forward(request, response);
            }
            st.close();
           

        } finally {            
            out.close();
            
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            try {
                processRequest(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(signInServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(signInServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            try {
                processRequest(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(signInServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(signInServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
