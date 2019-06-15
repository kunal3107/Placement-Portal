<%@ page import ="java.util.*"
        import ="java.text.*" %>

<%
    
 String a=request.getParameter("code");

 if(a.equals(session.getAttribute("vcode").toString()))
 {
     out.print("<img src='images/tick.png' height='20' width='20'>"); 
 }
 else
 {
     out.print("<img src='images/cross.jpg' height='20' width='20'>"); 
 }

%>