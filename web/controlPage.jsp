<%-- 
    Document   : controlPage
    Created on : Apr 13, 2012, 11:47:26 PM
    Author     : Dexterity 101
--%>

<%
Cookie[] cookies = request.getCookies();
String value=null;
    for(int i=0; i < cookies.length;i++){
        if(cookies[i].getName().equals("user")){
            value = cookies[i].getValue();
          }   
      }
if(value!=null){
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control Page</title>
    </head>
    <body bgcolor="orange">
    <center><font face="DejaVu Sans" size="4">
        <h2>Chat Server X</h2>
        <br>
        <% 
         out.println("Chat Server X - Welcome ("+value+")");
         %>
         <BR><BR>
        <img src="displayblob.jsp" width="200" height="200" alt="No Image Support"/><br><br><br>
        
        <a href ="mainChat.jsp" target ="main" style="text-decoration:none;">Chat Room</a><br />
        <%//<a href ="profileEdit.jsp" target ="main" style="text-decoration:none;">Edit Profile</a><br />%>
        <a href ="imageUpload.jsp" target ="main" style="text-decoration:none;">Upload Profile Image</a><br />
        <a href ="logout.jsp" target ="main" style="text-decoration:none;">Logout</a>
        </font>
    </center>
    </body>
</html>
<%}
else{
    out.println("Invalid Username or Password");
    RequestDispatcher rd2 = request.getRequestDispatcher("/signIn.jsp");
    rd2.forward(request, response);
}
%>