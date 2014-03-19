<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>

<%
    Blob image = null;
    Connection con = null;
    byte[ ] imgData = null ;
    Statement stmt = null;
    ResultSet rs = null;

    Cookie[] cookies = request.getCookies();
    String value=null;
    for(int i=0; i < cookies.length;i++){
        if(cookies[i].getName().equals("user")){
            value = cookies[i].getValue();
                   }
           }
    
    if(value!=null){    
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","root123");
            stmt = con.createStatement();
            rs = stmt.executeQuery("select bImage from upload_image where iImageId = 1");
            
            if (rs.next()) {
                image = rs.getBlob(1);
                imgData = image.getBytes(1,(int)image.length());
            }
            else {
                out.println("Display Blob Example");
                out.println("image not found for given id>");
                return;
            }
            
        // display the image
            
            response.setContentType("image/gif");
            OutputStream o = response.getOutputStream();
            o.write(imgData);
            o.flush();
            o.close();
        }
    
        catch (Exception e) {
            out.println("Unable To Display image");
            out.println("Image Display Error=" + e.getMessage());
            
        }
       }
    
       else{
            out.println("Invalid Username or Password");
            RequestDispatcher rd2 = request.getRequestDispatcher("/signIn.jsp");
            rd2.forward(request, response);
            //out.println("<img src='NoImage.jpg' width=200 height=200 alt=No Image />");
            %>
            <img  src = "NoImage.jpg" width = "100" height = "100" alt = "NoImage" / >
            <%

       }
%> 