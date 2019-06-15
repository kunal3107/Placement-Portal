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
    <title>Add Teacher</title>
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
                        <li ><a href="adminnotice.jsp">Add Notices for Teachers</a></li>
                        <li><a href="viewteachers.jsp">View Teachers List</a></li>
                           <li><a href="logout.jsp">Logout</a></li>
                        
                        
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Add Misc<i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                               
                            </ul>
                       
                          
                        </li>
                        <li><a href="blog.html">About us</a></li> 
                        </ul>
                </div>
            </div>
        </nav>
		
    </header>
  
<%

String  tname="", imagename="",emailid="", tpwd="" , sub="",quali="",exp="",path="", dept="",designation="" ;
boolean successful=true;
boolean a= ServletFileUpload.isMultipartContent(request);
String twd[]=new String[5];
if(a)
{

DiskFileItemFactory factoryobj = new DiskFileItemFactory();
ServletFileUpload uploadobj = new ServletFileUpload(factoryobj);
List<FileItem> items=null;
items = uploadobj.parseRequest(request);
for(FileItem myitem:items)
{
if (myitem.isFormField())
{
String itemName1 = myitem.getFieldName(); //field name
String value=myitem.getString(); //value

if(itemName1.equals("tname")) //control's name - textbox name
{
 tname=value;
}
else if(itemName1.equals("tpwd")) //control's name - textbox name
{
    tpwd=value;
//    for(int x=1;x<5;x++)
//    {
//    twd[x]=value+twd[x-1];
//    }
}
else if(itemName1.equals("tmail")) //control's name - textbox name
{
 emailid=value;
}


else if(itemName1.equals("experience")) //control's name - textbox name
{
exp=value;
}
else if(itemName1.equals("dept")) //control's name - textbox name
{
dept=value;
}

else if(itemName1.equals("quali")) //control's name - textbox name
{
 quali=quali+value+",";
}

else if(itemName1.equals("subject")) //control's name - textbox name
{
  sub=sub+value+",";
}
else if(itemName1.equals("designation")) //control's name - textbox name
{
  designation=value;
}
}

else
{
String type=myitem.getContentType();
long size=myitem.getSize()/1024; //kbytes
//out.print(myitem.getSize());
if(size==0)
{
imagename="default.jpg";
}
else if((type.equals("image/pjpeg") || type.equals("image/jpeg")
|| type.equals("image/png") || type.equals("image/x-png")
|| type.equals("image/gif")) && size<2000)
{
imagename=new java.util.Date().getTime()+myitem.getName();
path=config.getServletContext().getRealPath("/") + "teacherimages/" + imagename;
File savefile=new File(path);
myitem.write(savefile); 
}
else
{
successful=false;
out.println("Sorry only pictures of less than 2000kb are allowed to upload");
} 
}

}
if(successful==true)
{
   
    try
{
Class.forName("com.mysql.jdbc.Driver");
Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
try
{
String q="insert into teachertable (`name`, `password`, `email`, `qid`, `experience`, `subjects`,imagename,d_id,designation) values(?,MD5(?),?,?,?,?,?,?,?)";
PreparedStatement mystatement=myconnection.prepareStatement(q,PreparedStatement.RETURN_GENERATED_KEYS);
mystatement.setString(1, tname);

mystatement.setString(2, tpwd+"@!#@!%$#^#$%#%#$%$^$%&!@!#");

mystatement.setString(3, emailid);
mystatement.setString(4, quali.substring(0,quali.lastIndexOf(',')));
mystatement.setString(5, exp);
mystatement.setString(6, sub.substring(0,sub.lastIndexOf(',')));
mystatement.setString(7, imagename);
mystatement.setString(8, dept);
mystatement.setString(9,designation);



if(mystatement.executeUpdate()==1)
{
    ResultSet myresult=mystatement.getGeneratedKeys();
    if(myresult.next())
    {
        int tid=myresult.getInt(1);
        out.print("<h1 class='form-control'>Teacher Added Successfully. Your Id is to login for next time is "+tid+"</h1>");
    }

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
}

%>


<div class="login">
    <div class="wrapper" id="loginwrapper">
        <div class="container" style="height:80px">
		<h1>ADD TEACHER</h1>
		
                <form class="form" name="form2"  method="post" enctype="multipart/form-data">
               
                    <input type="text" name="tname" placeholder="Name">
                    <input type="password" name="tpwd" placeholder="Password">
                    <input type="email" name="tmail" placeholder="E-Mail ID">
                    <select name="designation" style="width:250px;height:40px">
                        <option>Choose Designation</option>
                        <option>Professor</option>
                        <option>Assisstant Professor</option>
                        <option>New Lecturer</option><option>Hod</option>
                        
                        
                        
                    </select><br>
                    <select  name="experience" style="width: 250px;height:40px">
                        <option>Choose Experience</option>
                            <option>1 year</option>
                    
                     <%
                            
                        {
                            for(int aq=2;aq<=15;aq++)
                            {
                                out.print("<option>"+aq+" Years"+"</option>");
                            }
                        }
                       out.print("<option>"+"More than 15 years"+"</option>");
                            
                          %>  
                    </select><br>
                    <select name="quali"  style="width: 350px;height:80px" class='form-control-static' multiple>
                        <%
                            try
                            {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                            try
                            {
                                String aa="select * from qualificationtable";
                               
                                PreparedStatement mystatement=myconnection.prepareStatement(aa);
                                ResultSet myresult=mystatement.executeQuery();
                                if(myresult.next())
                                {
                                    
                                    do
                                    {
                                        out.print("<option  value="+ myresult.getString("qid")+">"+ myresult.getString("qname")+"</option>");
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
    <select name="dept"  style="width: 350px;height:30px" >
        <option value="0">Choose Department</option>
         <%
             try
                            {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                            try
                            {
                                String aa="select * from departmenttable";
                                PreparedStatement mystatement=myconnection.prepareStatement(aa);
                                ResultSet myresult=mystatement.executeQuery();
                              
                                if(myresult.next())
                                {
                                   
                                    do
                                    {
                                        
                                        out.print("<option value="+ myresult.getString("d_id")+">"+ myresult.getString("d_name")+"</option>");
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

    </select><br><br>
     <select name="subject"  style="width: 350px;height:80px" multiple>
         <%
             try
                            {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                            try
                            {
                                String aa="select * from subjecttable";
                                PreparedStatement mystatement=myconnection.prepareStatement(aa);
                                ResultSet myresult=mystatement.executeQuery();
                              
                                if(myresult.next())
                                {
                                   
                                    do
                                    {
                                        
                                        out.print("<option value="+ myresult.getString("sid")+">"+ myresult.getString("sname")+"</option>");
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
         <input type="file"  name="pic"  style="height:40px;width:300px;color:white" >
               
                    <input type="submit"  name="submit2" value="Save" id="login-button" style="height:40px;width:150px;color:white" >
  
                    
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
            $("document").ready(function(){
               
 $("#login-button").click(function(event){
		 event.preventDefault();
	 
	 $('form').fadeOut(500);
	 $('.wrapper').addClass('form-success');
     });})
     
     
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

