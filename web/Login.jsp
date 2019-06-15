<%
  Cookie mycookie1[]=request.getCookies();
    String name="",mail="",id="";
    boolean adminflag=false,studentflag=false,teacherflag=false,employeeflag=false;
    
if(mycookie1!=null)
{
    for(Cookie mycookies2:mycookie1)
    {
       if(mycookies2.getName().equals("adminname"))
       {
           name=mycookies2.getValue();
           adminflag=true;
       }
      else if(mycookies2.getName().equals("studentname"))
       {
           name=mycookies2.getValue();
           studentflag=true;
       }
       else if(mycookies2.getName().equals("studentmail"))
       {
           mail=mycookies2.getValue();
         studentflag=true;
                   
       }
       else if(mycookies2.getName().equals("tname"))
       {
           name=mycookies2.getValue();
           teacherflag=true;
                   
       }
       else if(mycookies2.getName().equals("tid1"))
       {
           id=mycookies2.getValue();
           teacherflag=true;
                   
       }
       else if(mycookies2.getName().equals("ename"))
       {
           name=mycookies2.getValue();
           employeeflag=true;
                   
       }
       
       
    }
    if(adminflag)
    {
        session.setAttribute("a", name);
        response.sendRedirect("adminpanel.jsp");
    }
   else if(studentflag)
    {
         session.setAttribute("mail",mail);
                            session.setAttribute("name",name);
                        response.sendRedirect("studentpanel.jsp");
    }
   else if(teacherflag)
       
    {
         session.setAttribute("tid", id);
         
                             session.setAttribute("tname", name);
                        response.sendRedirect("teacherpanel.jsp");
    }
    else if(employeeflag)
       
    {
         session.setAttribute("eid", id);
          session.setAttribute("ename", name);
		//  session.setAttribute("bid",myresult3.getString("bid"));
	if(name.equalsIgnoreCase("tpo")||name.equalsIgnoreCase("kunal")||name.equalsIgnoreCase("tpo_admin"))
                     {   response.sendRedirect("tpopanel.jsp"); }
					else
						response.sendRedirect("hodpanel.jsp");
    }
}
%>

<%@page import="java.sql.*" %>
<%@include file="variables.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


 
<head>
    <link href="css/newcss.css" rel="stylesheet"><link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    
    <style>
        #topnavbar{
            height: 30%
        }
         #topnavbar1{
            height: 80%
        }
    </style>
              
      <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
       	
      <title>Login</title>
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
                    <a class="navbar-brand" href="/"><img src="images/logo.png" alt="logo" width="350" height="100"></a>
                </div>
		 <div class="collapse navbar-collapse navbar-right">
                   <ul class="nav navbar-nav">
                        <li class="active"><a href="/">Home</a></li>
                        <li><a href="#">Welcome</a></li>
                          <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login<i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                               <li><a href="Login.jsp" >Student</a>
                                </li>
                               
                                  <li><a href="Login.jsp">TPO</a></li>
                                    <li><a href="Login.jsp">HOD</a></li>
                            </ul>
                        </li>
                        <li><a href="http://www.davietjal.org/awards-and-accolades/technical-achievements/">Achievements</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Register<i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                               <li><a href="signupstudent.jsp">Student</a></li>
                                <li><a href="recruitersignup.jsp">Recruiter</a></li>
                                                            </ul>
                        </li>
                        <li><a href="http://www.davietjal.org/about/">About us</a></li> 
                        </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
		
    </header>
     
   
<div class="login">
    <div class="wrapper" id="loginwrapper">
        <div class="container" style="height:80px"><br><br><br><br><br><br>
		<h1 id="heading">Welcome</h1>
		
                <form name="fs2" method="post" id="form">
                    <input type="text"  name="uname" placeholder="Email ID/Username">
                    <input type="password" name="pwd" placeholder="Password">
                       <label>Stay Signed in<input type="checkbox" name="remember" ></label>
                        <input type="submit" name="submit" value="Login" id="button"  style="height:40px;width:150px;color:white" >
                  <a href="forgotpassword.jsp">
                       <b>Forgot Password?</b>
             </a><br>
                      <a href="signupstudent.jsp">
                       <b>Don't have an account yet!Create one!</b>
  </a>
                </form>

        <%
       if(request.getParameter("submit")!=null)
        {
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
            
         Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                try
                {
                    String a="Select * from admintable where name=? and password=?";
                    PreparedStatement mystatement=myconnection.prepareStatement(a);
                    mystatement.setString(1, request.getParameter("uname"));
                    mystatement.setString(2, request.getParameter("pwd"));
                    ResultSet myresult=mystatement.executeQuery();
                    if(myresult.next())
                    {
                        if(request.getParameter("remember")!=null)
                        {
                            Cookie mycookie=new Cookie("adminname",myresult.getString("name"));
                            
                            mycookie.setMaxAge(24*7*60*60);
                            response.addCookie(mycookie);
                            
                        
                    }
                        session.setAttribute("a", request.getParameter("uname"));
                        response.sendRedirect("adminpanel.jsp");
                    }
                    else
                    {
                     String b="Select * from emstudenttable1 where email=? and password=MD5(?)";
                    PreparedStatement mystatement1=myconnection.prepareStatement(b);
                    mystatement1.setString(1, request.getParameter("uname"));
                    mystatement1.setString(2, request.getParameter("pwd")+"#@%#%^$%^%&$%#$#%#$^$%");
                    ResultSet myresult1=mystatement1.executeQuery();
                    if(myresult1.next())
                    {
                        if(request.getParameter("remember")!=null)
                        {
                           Cookie mycookie=new Cookie("studentname",myresult1.getString("name"));
                           Cookie mycookie2=new Cookie("studentmail",myresult1.getString("email"));
                            mycookie.setMaxAge(24*7*60*60);
                            mycookie2.setMaxAge(24*7*60*60);
                            response.addCookie(mycookie);
                            response.addCookie(mycookie2);
                        }
                            session.setAttribute("mail", request.getParameter("uname"));
                            session.setAttribute("name", myresult1.getString("name"));
                        response.sendRedirect("studentpanel.jsp");
                    }
                    else
                    {
                        String c="Select * from teachertable where teacher_id=? and password=MD5(?)";
                    PreparedStatement mystatement2=myconnection.prepareStatement(c);
                    mystatement2.setString(1, request.getParameter("uname"));
                    mystatement2.setString(2, request.getParameter("pwd")+"@!#@!%$#^#$%#%#$%$^$%&!@!#");
                    ResultSet myresult2=mystatement2.executeQuery();
                        if(myresult2.next())
                    {
                        if(request.getParameter("remember")!=null)
                        {
                            Cookie mycookie=new Cookie("tid",myresult2.getString("teacher_id"));
                            Cookie mycookie2=new Cookie("tname",myresult2.getString("name"));
                            mycookie.setMaxAge(24*7*60*60);
                            response.addCookie(mycookie);
                        }
                        session.setAttribute("tid",myresult2.getString("teacher_id"));
                        session.setAttribute("tname", myresult2.getString("name"));
                           session.setAttribute("dname", myresult2.getString("d_id"));
                        response.sendRedirect("teacherpanel.jsp");
                        }
                        else
                    {
                        String d="Select * from employeetable where ename=? and password=?";
                    PreparedStatement mystatement3=myconnection.prepareStatement(d);
                    mystatement3.setString(1, request.getParameter("uname"));
                    mystatement3.setString(2, request.getParameter("pwd"));
                    ResultSet myresult3=mystatement3.executeQuery();
                        if(myresult3.next())
                    {
                        if(request.getParameter("remember")!=null)
                        {
                            Cookie mycookie=new Cookie("eid",myresult3.getString("emp_id"));
                            Cookie mycookie2=new Cookie("ename",myresult3.getString("ename"));
                            mycookie.setMaxAge(24*7*60*60);
                            response.addCookie(mycookie);
                            response.addCookie(mycookie2);
                        }
						session.setAttribute("eid",myresult3.getString("emp_id"));
                        session.setAttribute("ename",myresult3.getString("ename"));
                        session.setAttribute("bid",myresult3.getString("bid"));
                     
						if(request.getParameter("uname").equals("tpo")||request.getParameter("uname").equals("kunal")||request.getParameter("uname").equals("tpo_admin"))
                        {
							response.sendRedirect("tpopanel.jsp");
						}
						else
						{
							response.sendRedirect("hodpanel.jsp");
						}
                    }    
                    
                        else
                        {
                            out.print("<h1>Wrong Username/password</h1>");
                        }
                    
                    }
                        
                }}
                }
                catch(Exception e)
                {
                    out.print("Error in query"+e.getMessage());
                }
                finally
                {
                    myconnection.close();
                }
            }
             catch(Exception e)
                {
                    out.print("Error in Connection "+e.getMessage());
            
        }
        
        
        }
        
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
        
        <%@include file="footer.jsp" %>
    
        <script type="text/javascript">
           
    
 $("#button").on('click',function(){
	 $('form').fadeOut(500);
	 $('.wrapper').addClass('form-success')
         $('#heading').html("<strong>Signing in.....</strong>")});
        </script>
              

            
  
           
</body>
</html>
