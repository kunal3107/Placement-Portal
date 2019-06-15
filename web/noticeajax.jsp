<%@ page import ="java.util.*"
        import ="java.text.*" %>

<% 
   int ab=Integer.parseInt(request.getParameter("days"));
 Thread.sleep(1000);
 DateFormat dateFormat= new SimpleDateFormat("yyyy/MM/dd");
Calendar c = Calendar.getInstance();    
c.add(Calendar.DATE, ab);
out.println(dateFormat.format(c.getTime()));
%>