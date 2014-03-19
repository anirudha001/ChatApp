<%-- 
    Document   : mainFrame
    Created on : Apr 13, 2012, 11:46:32 PM
    Author     : Dexterity 101
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <% 
            out.println("Chat Server X - Welcome ("+value+")");
            %>
        </title>
    </head>
   <frameset cols="330,*" >
    <frame noresize="noresize" src="./controlPage.jsp" name="top" />
    <frame noresize="noresize" src="./mainChat.jsp" name="main" />
</frameset>
<noframes>
<body bgcolor="orange">
<h2>No Frame Support</h2>
Loser.!!!
</body>
</noframes>
</html>
<%
}
else{
    out.println("Invalid Username or Password");
    RequestDispatcher rd2 = request.getRequestDispatcher("/signIn.jsp");
    rd2.forward(request, response);
}
                       
%>
