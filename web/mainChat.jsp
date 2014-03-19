<%-- 
    Document   : mainChat
    Created on : Apr 13, 2012, 11:48:39 PM
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
        <title>JSP Page</title>
    </head>
    <frameset rows="*,175">
    <frame noresize="noresize" src="./incomingMsg.jsp" name="top" />
    <frame noresize="noresize" src="./msgSender.jsp" name="main" />
</frameset>
<noframes>
<body bgcolor="orange">
<h2>No Frame Support</h2>
Loser.!!!
</body>
</noframes>
</html>
<%}
else{
    out.println("Invalid Username or Password");
    RequestDispatcher rd2 = request.getRequestDispatcher("/signIn.jsp");
    rd2.forward(request, response);
}
%>