<%@ page import="java.sql.*" %>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%

Cookie[] cookies = request.getCookies();
String value=null;
for(int i=0; i < cookies.length;i++){
    if(cookies[i].getName().equals("user")){
        value = cookies[i].getValue();
          }   
      }
if(value!=null){  

   Connection conn=null;
   Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root", "root123");

   PreparedStatement psImageInsertDatabase=null;
   
   byte[] b=null;
   try{
       
      out.println("Chat Server X - Welcome ("+value+")");
       
      //String sqlImageInsertDatabase="insert into profile (LogPic) values(?) where username = '"+value+"'";
      String sqlImageInsertDatabase="update table profile set LogPic=(?) where username = '"+value+"'";
      psImageInsertDatabase=conn.prepareStatement(sqlImageInsertDatabase);
      
      DiskFileItemFactory factory = new DiskFileItemFactory();

      ServletFileUpload sfu = new ServletFileUpload(factory);
      List items = sfu.parseRequest(request);

      Iterator iter = items.iterator();
      
      while (iter.hasNext()) {
         FileItem item = (FileItem) iter.next();
         if (!item.isFormField()) {
              b = item.get();
          }
      }
      
      psImageInsertDatabase.setBytes(1,b);
      psImageInsertDatabase.executeUpdate();
   }
   catch(Exception e)
   {
     out.println(e);
     //response.sendRedirect("imageUpload.jsp");
   }
}
else{
    out.println("Invalid Username or Password");
    RequestDispatcher rd2 = request.getRequestDispatcher("/signIn.jsp");
    rd2.forward(request, response);
}
%>

<html>
    <head>
        <title>
            
        </title>
    </head>
    <body bgcolor="orange">
        <font face="DejaVu Sans" size="5">
        Image Saved
        </font>
</body>
</html>
