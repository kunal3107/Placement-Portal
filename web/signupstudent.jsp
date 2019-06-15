<%@page import="java.util.Random"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="java.util.Properties"%>
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
    <script type="text/javascript" src="jquery/jquery1.js"></script>
    <style>
        #topnavbar{
            height: 30%
        }
         #topnavbar1{
            height: 80%
        }
    </style>
    <title>Student Info</title>
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
    <%
String  name="", imagename="",emailid="", password1="" , rollno="",branch="",course="",sem="",path="" ;
boolean successful=true; int bid=0;
boolean a= ServletFileUpload.isMultipartContent(request);
  int rcode;
                      float minX = 50.0f;
                        float maxX = 100.0f;
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

if(itemName1.equals("sroll")) //control's name - textbox name
{
 rollno=value;
}
else if(itemName1.equals("sname")) //control's name - textbox name
{
name=value;
}
else if(itemName1.equals("spwd")) //control's name - textbox name
{
password1=value;
}
else if(itemName1.equals("mail")) //control's name - textbox name
{
emailid=value;
}

else if(itemName1.equals("course")) //control's name - textbox name
{
 course=value;
}

else if(itemName1.equals("branch")) //control's name - textbox name
{
 branch=value;
}

else if(itemName1.equals("sem")) //control's name - textbox name
{
 sem=value;
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
path=config.getServletContext().getRealPath("/") + "studentimages/" + imagename;
File savefile=new File(path);
myitem.write(savefile); 
                savefile.setWritable(true, true);
                savefile.setExecutable(true, false);
                savefile.setReadable(true, false);

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
     String[] ma=course.split(",");
   try
                { 
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                     try
                    {
                                
                        String b="Select (bid) from branch where course_name=? and branch_name=?" ;
                        PreparedStatement mystatement1=myconnection.prepareStatement(b);
                        mystatement1.setString(1,ma[1]);
                         mystatement1.setString(2, branch);
                         ResultSet myresult=mystatement1.executeQuery();
                         if(myresult.next())
                         {
                             bid=myresult.getInt("bid");
                         }

 
     //encrypted password
String q="insert into emstudenttable1 values(?,?,MD5(?),?,?,?,?)";
PreparedStatement mystatement=myconnection.prepareStatement(q);
mystatement.setString(1, rollno);

mystatement.setString(2, name);

mystatement.setString(3, password1+"#@%#%^$%^%&$%#$#%#$^$%"); 
mystatement.setString(7, emailid);
mystatement.setString(4, sem);
mystatement.setString(5, imagename); 
mystatement.setString(6, String.valueOf(bid));  

//mystatement.setString(9, session.getAttribute("tid").toString()); 
if(mystatement.executeUpdate()==1)
{
     Random rand=new Random();
     rcode=(int)(((rand.nextFloat() * (maxX - minX) + minX)*100));
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
                     return new PasswordAuthentication("davietplacement123@gmail.com","kunal3107");
                }
            });
        try {
            Message message = new MimeMessage(session2);
        message.addHeader("Content-type", "text/html; charset=UTF-8");
  //  message.setFrom(new InternetAddress("gtbemailtrial@gmail.com"));
    message.setRecipients(Message.RecipientType.TO,    InternetAddress.parse(emailid));
    // message.setRecipients(Message.RecipientType.CC,    InternetAddress.parse("javatrials@gmail.com"));
    message.setSubject("This is to inform you that");
    message.setText("Your one time verification code for Daviet Placement Account is  "+ rcode); 
        Transport.send(message);
           }
                catch (MessagingException e)
                {
            throw new RuntimeException(e);
        }
session.setAttribute("rno",rollno);
session.setAttribute("name",name);
session.setAttribute("mail",emailid);
session.setAttribute("course",course);
session.setAttribute("vcode",rcode); 
//out.println("<script> alert('Sorry only pictures of less than 400kb are allowed to upload') </script>");
              
response.sendRedirect("declaration.jsp");
out.print("<div class='panel-heading' style='height:60px'><b>Student Added Successfully </b></p></div>");
}


}
catch(Exception e)
{
out.println("<div class='panel-heading' style='height:60px'><b>Email Already Registered </b></p></div> ");
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
		<h1>Student Info</h1>
		
                <form class="form" name="f1" method="post" enctype="multipart/form-data" >
                    <input type="text"  name="sroll" placeholder="Class Roll no" required="">
                    <input type="text" name="sname" placeholder="Name" required="">
                    <input type="password" name="spwd" placeholder="Password" required="">
                    <input type="email" name="mail" placeholder="E-Mail ID(Username)" required="">
                     <table border="0px" cellspacing="100px" cellpadding="10px">
                                        <tr>
                                                          <td ><select name="course"  style="width: 150px;height:40px" required="" id="crse">
                                              <option value="0">Choose Course</option>
                        <%
                            
                           double m=0; 
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
                                    
                                    
                                       
                                m=Double.parseDouble(myresult.getString("duration"));
                                            out.print("<option value="+myresult.getString("duration")+","+myresult.getString("course_name")+">"+ myresult.getString("course_name")+"</option>");
                                                                     }while(myresult.next());
                                  
                                    
                                }
                                else{
                                    out.print("Dfsgfsd");
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

                         </select>    </td>
                                                    <script type="text/javascript">
         $(document).ready(function(){
                $("#crse").change(function(){
                  
                    var a=$(this).val()
                
                 
                    if(a=="select")
                    {
                     $("#answer").html("")     
                    }
                    else
                    {
                       
                    $.ajax({
                        url:"branch.jsp",
                        data:{"course":a},
                        beforeSend:function (){
                           
                            $("#answer").html("<img src='images/preloader.gif' width='100px' align='center'>")
                        }
                        })
                                .done(function(data){
                                 
                         $("#answer").html(data)          
                        })
                    }
                })
            })
    </script>
                                                          <td> <div id="answer"></div>
                         </td><br>
                                              <td> 
                                                  <div id="answer2"></div>
                                                                                  
                                                 </td>
                                                  
                                                 
                                             
                                                  </tr></table>
             <h3><b>Add Passport Size Photo(Less than or equal to 1.5 MB)</b></h3>
                    <input type="file"  name="pic"  style="height:40px;width:300px;color:white" value="fds">
                    <input type="submit"  name="submit1" value="Save" style="height:40px;width:150px;color:white" >
                     <h3><b>Connection could be slow.<br>(Note:-Click the Save Button only once.)</b></h3>

                    

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
                             <%@include file="footer.jsp" %>
</div>
       
        
        <script>
 $("#login-button").click(function(event){
		 event.preventDefault();
	 
	 $('form').fadeOut(500);
	 $('.wrapper').addClass('form-success')});
         </script>
         
</body>
</html>
