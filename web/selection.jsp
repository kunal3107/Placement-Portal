<%@page import="java.sql.*"%>
<%@ page import ="java.util.*"
        import ="java.text.*" %>
<%@include file="variables.jsp" %>
<script type="text/javascript" src="jquery/jquery1.js"></script>
                  
<%
    if(Integer.parseInt(request.getParameter("val"))==2)
    {
       out.print("<h4>Which Type of Business do you want to go for?</h4><select  name='busi' style='width: 150px;height:28px' required='' id='seme'><option value='Choose'>Select Option</option><option value='Startup'>Startup"
        + "</option><option value='Family Business'>Family Business</option></select><input type='text' name='desbusiness' required='' placeholder='Description'>");
    }
 if(Integer.parseInt(request.getParameter("val"))==3)
    {
       out.print("<h4>Where would you like to go for higher studies?</h4><select name='study' style='width: 150px;height:28px' required='' id='seme'><option value='Choose'>Select Option</option><option value='India'>India"
        + "</option><option value='Abroad'>Abroad</option></select><input type='text' name='desstudy' required='' placeholder='Name of Course and University'>");
    }
else if(Integer.parseInt(request.getParameter("val"))==4) 
    {
       out.print("<h4>Which branch of defence you are looking for?</h4><select name='defence' style='width: 150px;height:28px' required='' id='seme'><option value='Choose'>Select Option</option><option value='Army'>Army"
        + "</option><option value='Airforce'>Airforce</option><option value='Navy'>Navy</option></select>");
    }
   else  if(Integer.parseInt(request.getParameter("val"))==5) 
    {
       out.print("<input type='text' name='specify' required='' placeholder='Please Specify'>");
    }
    
%>