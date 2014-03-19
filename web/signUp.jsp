<%-- 
    Document   : signUp
    Created on : Apr 18, 2012, 7:14:36 PM
    Author     : Dexterity 101
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SignUp Page</title>
    </head>
    <body onLoad="document.register.username.focus();" bgcolor="orange">
        
    <center>
        <h1>Sign Up</h1><BR><BR>
        <h2>Step 1</h2><BR><font face="DejaVu Sans" size="4">
        <form name="register" action="/ChatApp/Register" method="POST">
            <TABLE border="0">
              <TR>
                <TD class="white">
                  UserName: 
                </TD>
                <TD width="70%">
                  <input type="text" name="username" value="" size="30"/>
                </TD>
              </TR>
              <TR>
                <TD class="white">
                  Password: 
                </TD>
                <TD width="70%">
                   <input type="password" name="password" value=""  size="30"/>
                </TD>
              </TR>
              <TR>
              <TD class="white">
                  First Name:
              </TD>
                <TD width="70%">
                  <input type="text" name="firstname" value=""  size="30"/>
                </TD>
              </TR>
              <TR>
              <TR>
                <TD class="white">
                  Last Name: 
                </TD>
                <TD width="70%">
                  <input type="text" name="lastname" value=""  size="30"/>
                </TD>
              </TR>
              <TR>
              <TR>
                <TD class="white">
                  Email ID
                </TD>
                <TD width="70%">
                  <input type="text" name="emailID" value=""  size="30"/>
                </TD>
              </TR>
              <TR>    
              <TR>
              <TD>
                  <input type="reset" value="Reset" />
                </TD>
              <TD>
                  <input type="submit" value="Sign Up" name="Sign Up" />
                </TD>
              </TR>
            </TABLE>
        </form>
        </font>
    </center>
    </body>
</html>
