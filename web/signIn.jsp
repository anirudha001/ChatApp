<%-- 
    Document   : signIn
    Created on : Apr 6, 2012, 9:08:16 PM
    Author     : Dexterity 101
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SignIn Page</title>
    </head>
    <body onLoad="document.login.uname.focus();" bgcolor="orange">
    <center>
        <h1>Login</h1><br><br><font face="DejaVu Sans" size="4">
        <form name="login" action="/ChatApp/Login" method="POST">
            <TABLE border="0">
              <TR>
                <TD class="white">
                  Username: 
                </TD>
                <TD width="70%">
                  <input type="text" name="uname" value="" size="30"/>
                </TD>
              </TR>
              <TR>
                <TD class="white">
                  Password: 
                </TD>
                <TD width="70%">
                   <input type="password" name="passwd" value=""  size="30"/>
                </TD>
              </TR>
              <TR>
              <TD>
                  
              </TD>    
              <TD>
                  <input type="submit" value="Sign In" name="signin" />
                </TD>
              </TR>
            </TABLE>
        </form>
        </font>
    </center>
    </body>
</html>
