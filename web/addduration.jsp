<%
    if(session.getAttribute("eid")==null)
    {
        response.sendRedirect("Login.jsp");
    }
%>

<%@include file="variables.jsp" %>
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


<!DOCTYPE html>
<head><link href="css/newcss.css" rel="stylesheet"><link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <title>Add Subject</title>
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

        <nav class="navbar navbar-inverse"  style="margin: 0px">
            <div  style="height:50px">
                <div class="navbar-header" style="margin:20px">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html">
                        <img src="images/logo.png" alt="logo" width="350" height="100"></a>
                </div>
				
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                       <li><a href="Login.jsp">Welcome</a></li>
                        <li ><a href="index.html">Add Notices for students</a></li>
                           <li><a href="logout.jsp">Logout</a></li>
                        
                        
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Add Misc<i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="blog-item.html">Important News</a></li>
                                <li><a href="pricing.html">Important Dates</a></li>
                                <li><a href="404.html">Events</a></li>
                                <li><a href="shortcodes.html">Awards</a></li>
                            </ul>
                       
                          
                        </li>
                        <li><a href="blog.html">About us</a></li> 
                        </ul>
                </div>
            </div>
        </nav>
		
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
String q="insert into branch (`course_name`, `branch_name`) values(?,?)";
PreparedStatement mystatement=myconnection.prepareStatement(q);
mystatement.setString(1, request.getParameter("course"));
mystatement.setString(2, request.getParameter("sname"));

//mystatement.setString(2, tpwd);

//mystatement.setString(3, emailid);
//mystatement.setString(4, quali);
//mystatement.setString(5, exp);
//mystatement.setString(6, sub);
//mystatement.setString(7, imagename);


if(mystatement.executeUpdate()==1)
{
    
   
        out.print("<h1 class='form-control'>Branch Added Successfully. "+"</h1>");
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
                out.print("<h1 class='form-control'>Subject Field cannot be empty. "+"</h1>");
              }
      
      }
      
%>

<div class="login">
    <div class="wrapper" id="loginwrapper">
        <div class="container" style="height:">
            <h1 ><b>Add Branch</b></h1>
                <br><br><br><br><br>
                <form class="form-control-static" name="form2"  method="post" >
                     <select name="course"  style="width: 350px;height:50px" >
        <option value="0">Choose Course</option>
         <%
             try
                            {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                            try
                            {
                                String aa="select * from course";
                                PreparedStatement mystatement=myconnection.prepareStatement(aa);
                                ResultSet myresult=mystatement.executeQuery();
                              
                                if(myresult.next())
                                {
                                   
                                     do{
                                    
                                    
                                       
                                
                                            out.print("<option>"+ myresult.getString("course_name")+"</option>");
                                                                     }while(myresult.next());
                                  
                                    
                                }
                                
                                
                            }
                            catch(Exception e){
                                   out.print("Error in query"+e.getMessage());
                            }
                            }
                            
                            catch(Exception e)
                                    {
                                           out.print("Error in Connection"+e.getMessage());
                                    }

             %>

    </select>
             <br><br>       <input type="text" name="sname" class="form-control-static" placeholder="Branch Name">
                      <br>
<!--Diploma in Pre-school Education (DPSE)
Bachelor of elementary education (B.EI.ED)degree.
Bachelor of education (B.Ed) degree.
Master of education (M.Ed) degree.
Diploma in Physical Education (D.P.Ed).
Bachelor of Physical Education (B.P.Ed) Degree
Master of Physical Education (M.P.Ed) Degree.
Diploma in Elementary Education (D.EI.Ed).
Bachelor of Education (B.Ed) Degree.
Diploma in Arts Education (Visual Arts).
Diploma in Arts Education (Performing Arts).
B.A.B.Ed/B.Sc.B.Ed Degree.
Bachelor of Education (B.Ed) Degree.
B.Ed.M.Ed.(Integrated) Degree.-->
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

