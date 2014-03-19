<%-- 
    Document   : logout
    Created on : Apr 19, 2012, 1:38:09 AM
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
    <body bgcolor="orange"><br></br><br>
    <center>
        <font face="DejaVu Sans" size="5">
        Are you sure you want to Sign Out?
        <br><br>
        <form action="/ChatApp/signout" method="POST">
            <input type="submit" value="  Yes  " name="Yes" />
        </form>
        <form action="/ChatApp/mainChat.jsp" method="POST">
            <input type="submit" value="   No   " name="No" size="15"/>
        </form>
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
