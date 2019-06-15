		
 <%
    if(session.getAttribute("a")==null)
    {
        response.sendRedirect("Login.jsp");
    }
 %>
<!DOCTYPE html>

<html lang="en">
<head>
    <%@page import="java.sql.*"%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
	
	<!-- core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <%@include file="variables.jsp" %>
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
<!--<link href="css/newcss.css" rel="stylesheet">-->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body class="homepage">

    <header id="header">
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <<div class="col-sm-6 col-xs-8">
                       <div class="social">
                            <ul class="social-share">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li> 
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                <li><a href="#"><i class="fa fa-skype"></i></a></li>
                            </ul>
                            <div class="search">
                                <form role="form">
                                    <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                                    <i class="fa fa-search"></i>
                                </form>
                           </div>
                       </div>
                    </div>
                </div>
            </div><!--/.container-->
        </div><!--/.top-bar-->

        <nav class="navbar navbar-inverse" >
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/"><img src="images/logo.png" alt="logo" width="350" height="100"></a>
                </div>
				
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="adminpanel.jsp" ><% out.print("Welcome "+  session.getAttribute("a"));%> </a></li>
                        <li ><a href="adminnotice.jsp">Add Notice</a></li>
                        <li><a href="about-us.html">View Teachers List</a></li>
                        <li><a href="Login.jsp">Preview Site</a></li>
                         <li><a href="logout.jsp">Logout</a></li>
                        
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Add Misc<i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="blog-item.html">Important News</a></li>
                                <li><a href="pricing.html">Placements</a></li>
                                <li><a href="404.html">Events</a></li>
                                <li><a href="shortcodes.html">Awards</a></li>
                            </ul>
                        </li>
                       
                        </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
		
    </header>

   
  <% 
      if(request.getParameter("submit2")!=null){
          
          if(!request.getParameter("sname").equals(""))
      {
    try
{
Class.forName("com.mysql.jdbc.Driver");
Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
try
{
String q="insert into employeetable (`ename`, `password`) values(?,?)";
PreparedStatement mystatement=myconnection.prepareStatement(q);
mystatement.setString(1, request.getParameter("sname"));
mystatement.setString(2, request.getParameter("password"));

//mystatement.setString(2, tpwd);

//mystatement.setString(3, emailid);
//mystatement.setString(4, quali);
//mystatement.setString(5, exp);
//mystatement.setString(6, sub);
//mystatement.setString(7, imagename);


if(mystatement.executeUpdate()==1)
{
    
   
        out.print("<h1 class='form-control'>Person Added Successfully. "+"</h1>");
    }

}

catch(Exception e)
{
out.println("Error in Query " + e.getMessage());
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
                out.print("<h1 class='form-control'>Name Field cannot be empty. "+"</h1>");
              }
      
      }
      
%>

<div class="login">
    <div class="wrapper" id="loginwrapper">
        <div class="container" style="height:">
            <h1 ><b>Add Others</b></h1>
                <br><br><br><br><br>
                <form class="form-control-static" name="form2"  method="post" >
          

             <br><br>       <input type="text" name="sname" class="form-control-static" placeholder="Username">
              <input type="password" name="password" class="form-control-static" placeholder="Password">
                      <br>

                    <input type="submit"  name="submit2" value="Quick Add" style="height:40px;width:100px;color:white" class="btn btn-danger" id="login-button">
  
                    
		</form>
	
        

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

