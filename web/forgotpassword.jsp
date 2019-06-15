<%@include file="variables.jsp" %>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.Random"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="java.util.Properties"%>



<!DOCTYPE html>
<head><link href="css/newcss.css" rel="stylesheet"><link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <title>Change Password</title>
    <style>
        #topnavbar{
            height: 30%
        }
         #topnavbar1{
            height: 80%
        }
    </style>

</head>



<body>
    
   <header id="topnavbar" style="padding: 0px;">

        <nav class="navbar navbar-inverse" style="margin: 0px;z-index:9;">
            <div  style="height:50px">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                      <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt="logo" width="350" height="100"></a>
                </div>
				
       <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li ><a href="/">Home</a></li>
                        <li><a href="studentpanel.jsp"><% out.print("Welcome ");%> </a></li>
                          <li class="active"><a href="studentpanel.jsp">Account</a></li>
                        </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
		
    </header>
                  
   
 


<div class="login">
    <div class="wrapper" id="loginwrapper">
        <div class="container" style="height:">
            <br><br><h1>Enter your Email id</h1>
                <br><br>
                <form class="form-control-static" name="form2"  method="post" >
                  
                    <input type="email" name="dname" class="form-control-static" placeholder="Email-id">
                      <br>

                    <input type="submit"  name="submit2" value="Submit" style="height:40px;width:100px;color:white" class="btn btn-danger" id="login-button">
  
                    
		</form>
 <% 
 int rcode;
                      float minX = 50.0f;
                        float maxX = 100.0f;
         if(request.getParameter("submit2")!=null){
          
          if(!request.getParameter("dname").equals(""))
      {
    try
{
Class.forName("com.mysql.jdbc.Driver");
Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
try
{

 Random rand=new Random();
   rcode=(int)(((rand.nextFloat() * (maxX - minX) + minX)*10000));
    Properties props = new Properties();
                                props.setProperty("mail.smtp.host", "smtp.gmail.com");
                                props.setProperty("mail.smtp.socketFactory.port", "465");
                                props.setProperty("mail.smtp.socketFactory.class",
                                 "javax.net.ssl.SSLSocketFactory");
                                props.setProperty("mail.smtp.auth", "true");
                                props.setProperty("mail.smtp.port", "465");

                                javax.mail.Session session2 = javax.mail.Session.getInstance(props,
                                                new javax.mail.Authenticator()//see what i did there !1 
                        {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("officialdavietplacements@gmail.com","guptadikshant");
                }
            });
        try {
            Message message = new MimeMessage(session2);
        message.addHeader("Content-type", "text/html; charset=UTF-8");
  //  message.setFrom(new InternetAddress("gtbemailtrial@gmail.com"));
    message.setRecipients(Message.RecipientType.TO,    InternetAddress.parse(request.getParameter("dname")));
    // message.setRecipients(Message.RecipientType.CC,    InternetAddress.parse("javatrials@gmail.com"));
    message.setSubject("This is to inform you that");
 message.setText("This is code for Password Change request at davietplacement.in .Do not share it within anyone. Your verification code is "+rcode); 
        Transport.send(message);
        session.setAttribute("rscode",rcode);
          session.setAttribute("maaaail",request.getParameter("dname"));
         out.print("<h2>Verification code is sent to your registered email. In case you could not view .Check ALL MAIL under more option  ");
           out.print("Please Enter the code below."+"</h2><form class='form-control-static' method='post'><input type='number' name='no' placeholder='Verification Code'>");
             out.print("<input type='submit' name='submit12' align='center' value='Submit' style='height:40px;width:100px;color:white' class='btn btn-danger' id='login-button'></form>");
           }
                catch (MessagingException e)
                {
            throw new RuntimeException(e);
                }
       
}
catch(Exception e)
{
out.println("Error in Connection " + e.getMessage());
}
finally
{
myconnection.close();
}
}
catch(Exception e)
{
out.println("Error in Connection " + e.getMessage());
}

    }
      else
      {
                out.print("<h1 class='form-control'>Qualification Field cannot be empty. "+"</h1>");
              }
      
      }
       
       if(request.getParameter("submit12")!=null){
  if(request.getParameter("no").toString().equals(session.getAttribute("rscode").toString()))
        {
     
         session.setAttribute("mail",session.getAttribute("maaaail"));
        response.sendRedirect("updateinfo.jsp");
        }
else
{
    out.print("<h1 >Wrong code entered . "+"</h1>");


}          }
      
%>

        </div>
        	   
        
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>
</div>
     
        
        <script>
 $("#login-button").click(function(event){
		 event.preventDefault();
	 
	 $('form').fadeOut(500);
	 $('.wrapper').addClass('form-success')});
         </script>
       
         <footer class="footer" >
        <div class="container">
            <div class="row">
                
                <div class="col-sm-6">
                    <ul class="pull-center">
                        
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Faq</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer><!--/#footer-->
      
</body>
</html>

