<%-- 
    Document   : incomingMsg
    Created on : Apr 14, 2012, 12:07:45 AM
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
<%@page import="chat.*"
    contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chat Server X</title>
    </head>
    <body bgcolor="orange">
        <p style="font-family:arial;color:blueviolet;font-size:20px;" align="right"><%out.println(value);%></p>
    <center><h1>Incoming Message<br>
        ----------------------------------------------------------------------------------------------</h1></center>
        
         <META HTTP-EQUIV="Refresh" CONTENT="1;./incomingMsg.jsp">
         <font face="Courier New" >
    
        <%
        //String st = "C://Documents and Settings/Dexterity 101/.netbeans/7.0/apache-tomcat-7.0.14.0_base/webapps/chathistory/chat.txt";
        String rd = reader.read();
        out.println(rd);
        %>
    
            </font>

    </body>
</html>
<%}
else{
    out.println("Invalid Username or Password");
    RequestDispatcher rd2 = request.getRequestDispatcher("/signIn.jsp");
    rd2.forward(request, response);
}
%>