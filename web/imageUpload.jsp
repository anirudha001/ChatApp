
<%@ page language="java"  errorPage="" %>


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
<title>Profile Pic</title>
</head>

<body bgcolor="orange">
    <br>
<center>
    <h1>Choose an Image to flaunt your Style!!</h1><br></br>
    <h2>Step 2</h2>
    <br>
<form name="frm" action="saveImage.jsp" enctype="multipart/form-data" method="post">
 <input type="file" name="uProperty" /> <br>
 <input type="submit" name="goUpload" value="Upload" /><br><br>
 <a href="./mainFrame.jsp" style="text-decoration:none;">Skip this Step</a>
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