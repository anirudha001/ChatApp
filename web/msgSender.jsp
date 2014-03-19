<%-- 
    Document   : msgSender
    Created on : Apr 14, 2012, 12:08:12 AM
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chat Server X</title>
    </head>
    <body onLoad="document.send.incoming.focus();" bgcolor="orange">
    <center>
        <form name="send" action="/ChatApp/sendServlet" method="POST">
        <br><br><br>
        <input type="text" name="incoming" value="" size="60" />
        <input type="submit" value="Send" name="Send" />
        </form>
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