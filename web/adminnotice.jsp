<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%
    if(session.getAttribute("a")==null)
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
    <title>Add Notice for Teachers</title>
    <style>
        #topnavbar{
            height: 30%
        }
         #topnavbar1{
            height: 80%
        }
    </style>
              <script type="text/javascript" src="jquery/jquery1.js"></script>
                        
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
                               </ul>
                       
                          
                        </li>
                        </ul>
                </div>
            </div>
        </nav>
		
    </header>
   
      <script type="text/javascript">
         $(document).ready(function(){
                $("#date").blur(function(){
                  
                    var a=$(this).val()
                    if(a==0)
                    {
                     $("#answer").html("")     
                    }
                    else
                    {
                       
                    $.ajax({
                        url:"noticeajax.jsp",
                        data:{"days":a},
                        beforeSend:function (){
                           
                            $("#answer").html("<img src='images/preloader.gif' width='100px' align='center'>")
                        }
                        })
                                .done(function(data){
                                 
                         $("#dates").val(data);
                          $("#answer").html("<strong>"+"The notice will last till:-"+data+"</strong>")          
                        })
                    }
                })
            })
    </script>
  
            <%  
   
    boolean flag=false;     
      if(request.getParameter("submit2")!=null){
           String[] depts=request.getParameterValues("Departments");
           DateFormat dateFormat= new SimpleDateFormat("yyyy/MM/dd");

Calendar c = Calendar.getInstance();    
//out.println(dateFormat.format(c.getTime()));
         
          if(!request.getParameter("notice").equals(""))
      {
    try
{
Class.forName("com.mysql.jdbc.Driver");
Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
try
{
    for(int i=0;i<depts.length;i++)
    {
       
String q="insert into adminnotice(notice,depts,date,dateofissue) values(?,?,?,?)";
PreparedStatement mystatement=myconnection.prepareStatement(q);
mystatement.setString(1, request.getParameter("notice"));
mystatement.setString(2, depts[i]);
mystatement.setString(3, request.getParameter("dates"));
mystatement.setString(4, dateFormat.format(c.getTime()));
//mystatement.setString(2, tpwd);

//mystatement.setString(3, emailid);
//mystatement.setString(4, quali);
//mystatement.setString(5, exp);
//mystatement.setString(6, sub);
//mystatement.setString(7, imagename);


if(mystatement.executeUpdate()==1)
{
    flag=true;
   
      
    }

}
   
if(flag)
{
      out.print("<h1 class='form-control'>Notice Added Successfully. "+"</h1>");
}}

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
                out.print("<h1 class='form-control'>Notice Field cannot be empty. "+"</h1>");
              }
      
      }
      
%>

<div class="login">
    <div class="wrapper" id="loginwrapper">
        <div class="container" style="height:">
            <h1 >Add Notices</h1>
                
                <form class="form-control-static" name="form2"  method="post" >
                    <select name="Departments" style="height:100px;width:350px" multiple>
                      <%
                            try
                            {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection myconnection1=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                                try
                                {
                                    String a="Select * from departmenttable";
                                    PreparedStatement mystatement1=myconnection1.prepareStatement(a);
                                    ResultSet myresult=mystatement1.executeQuery();
                                  if(myresult.next())
                                {  do{
                                    out.print("<option value="+ myresult.getString("d_id")+" >"+ myresult.getString("d_name")+"</option>");
                                 }while(myresult.next());
                                }
                                }
                                catch(Exception e)
                                {
                                    out.print("Error in Query"+e.getMessage());
                                }
                                finally
                                {
                                    myconnection1.close();
                                }
    
                            }
                            catch(Exception e)
                                {
                                    out.print("Error in Connection"+e.getMessage());
                                }

                        
                            %>
                    </select>
                    <br><br>
                     <select name="Duration" style="height:50px;width:200px" id="date">
                            <option >Add Notice Duration</option>
                        <option value="1">1 day</option>
                        <option value="2">2 days</option>
                        <option value="3">3 days</option>
                        <option value="5">5 days</option>
                        <option value="10">10 days</option>
                         <option value="15">15 days</option>
                        <option value="30">1 month</option>
                        <option value="90">3 months</option>
                        <option value="183">6 months</option>
                     </select>
                     <div id="answer"></div>
                     <textarea name="notice" class="form-control-static" placeholder="Add Notice" id="name" rows="10" cols="30"></textarea><br>
                    <input type="text" name="dates" id="dates" hidden><br>
                    <input type="submit"  name="submit2" value="Add Notice" style="height:40px;width:100px;color:white" class="btn btn-danger" id="login-button">
  
                    
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

