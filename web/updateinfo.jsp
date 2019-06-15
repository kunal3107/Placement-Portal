<%String name="";String password="";String email="" ;String course="";String branch="";String semster="";String imagename2=null;
      String rollno1=request.getParameter("rollno");
    if(session.getAttribute("mail")==null)
    {
        response.sendRedirect("Login.jsp");
    }
    
    %>
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
                      <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt="logo" width="350" height="100"></a>
                </div>
				
       <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li ><a href="/">Home</a></li>
                        <li><a href="studentpanel.jsp"><% out.print("Welcome ");%> </a></li>
                          <li class="active"><a href="studentpanel.jsp">Account</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
		
    </header>
                  
  
            <%
                String imagename="default",rollno="";

    try
{
Class.forName("com.mysql.jdbc.Driver");
Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
try
{
String q="select * from emstudenttable1,branch where branch.bid=emstudenttable1.bid and email=?";
PreparedStatement mystatement=myconnection.prepareStatement(q);
mystatement.setString(1, session.getAttribute("mail").toString());
ResultSet m=mystatement.executeQuery();
if(m.next())
{
 name=m.getString("name");
rollno=m.getString("rollno");
// out.println("<script> alert('m.getString('name')') </script>");
 password=m.getString("password");
 email=m.getString("email");
course=m.getString("course_name");
 branch=m.getString("branch_name");
 semster=m.getString("semester");
 imagename2=m.getString("imagename");
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
  
String  name2="",emailid2="", password12="" , rollno2="",branch2="",course2="",sem2="",path2="",imagename4="",image="";int bid=0;; 
boolean successful=true;
boolean a= ServletFileUpload.isMultipartContent(request);

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
 rollno2=value;
}
else if(itemName1.equals("sname")) //control's name - textbox name
{
name2=value;
}
else if(itemName1.equals("spwd")) //control's name - textbox name
{
password12=value;
}
else if(itemName1.equals("mail")) //control's name - textbox name
{
emailid2=value;
}

else if(itemName1.equals("course")) //control's name - textbox name
{
 course2=value;
}

else if(itemName1.equals("branch")) //control's name - textbox name
{
 branch2=value;
}

else if(itemName1.equals("sem")) //control's name - textbox name
{
 sem2=value;
}
}

else
{
String type=myitem.getContentType();
long size=myitem.getSize()/1024; //kbytes
//out.print(myitem.getSize());
if(size==0)
{
imagename4=imagename2;
}
else if((type.equals("image/pjpeg") || type.equals("image/jpeg")
|| type.equals("image/png") || type.equals("image/x-png")
|| type.equals("image/gif")) && size<2000)
{
imagename4=new java.util.Date().getTime()+myitem.getName();
path2=config.getServletContext().getRealPath("/") + "studentimages/" + imagename4;
File savefile=new File(path2);
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
                                
                        String b="Select (bid) from branch where course_name=? and branch_name=?" ;
                        PreparedStatement mystatement1=myconnection.prepareStatement(b);
                        mystatement1.setString(1,course2); 
                         mystatement1.setString(2, branch2);
                         ResultSet myresult=mystatement1.executeQuery();
                         if(myresult.next())
                         {
                             bid=myresult.getInt("bid");  
                         }
String q="update emstudenttable1 set `rollno`=?, `name`=?, `password`=MD5(?), `email`=?, bid=?, `semester`=?, `imagename`=? where email=?"; 
PreparedStatement mystatement=myconnection.prepareStatement(q,PreparedStatement.RETURN_GENERATED_KEYS);
mystatement.setString(1, rollno2);

mystatement.setString(2, name2);

mystatement.setString(3, password12+"#@%#%^$%^%&$%#$#%#$^$%");
mystatement.setString(4, email);
mystatement.setString(5, String.valueOf(bid)); 
mystatement.setString(6, sem2);

mystatement.setString(7, imagename4);
//mystatement.setString(9, session.getAttribute("tid").toString()); 
mystatement.setString(8, email); 

if(mystatement.executeUpdate()==1)
{
//   ResultSet myset=mystatement.getGeneratedKeys(); 
//    if(myset.next()) 
//    {
//        out.print(myset.getString("password"));
//    if(myset.getString("password").equals(password))
//    {
                      float minX = 50.0f;
                        float maxX = 100.0f; 
     Random rand=new Random();
   int  rcode=(int)(((rand.nextFloat() * (maxX - minX) + minX)*100));  
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
    message.setRecipients(Message.RecipientType.TO,    InternetAddress.parse(email));
    // message.setRecipients(Message.RecipientType.CC,    InternetAddress.parse("javatrials@gmail.com"));
    message.setSubject("This is to inform you that");
    message.setText("Your one time verification code for Daviet Placement Account Updation is  "+ rcode); 
        Transport.send(message);
           }
                catch (MessagingException e)
                {
            throw new RuntimeException(e);
        }
session.setAttribute("rno",rollno);
session.setAttribute("name",name);
session.setAttribute("mail",email);  
session.setAttribute("course",course);
session.setAttribute("vcode",rcode); 
//out.println("<script> alert('Sorry only pictures of less than 400kb are allowed to upload') </script>");
              
response.sendRedirect("updatedeclaration.jsp?upd=yes");
out.print("<div class='panel-heading' style='height:60px'><b>Student Updated Successfully </b></p></div>");
}
else
{
     out.print("<div class='panel-heading' style='height:60px'><b>Password incorrect.Please Input the same password as you entered during registeration.</b></p></div>"); 

}
} 

catch(Exception e)
{
out.println("dsf"+e.getMessage()); 
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
		<h1>Info Update</h1>
		
                 <form class="form" name="f1" method="post" enctype="multipart/form-data" >
                     <input type="text"  name="sroll" placeholder="Roll no" required="" value="<%=rollno%>"> 
                     <%out.print("<input type='text' name='sname' placeholder='Name'  value="+name+" required=''>"+ 
                    "<input type='password' name='spwd' placeholder='Password' value='' required=''>"+ 
                    "<input type='email' name='mail' placeholder='E-Mail ID' required='' value="+email+" disabled>");%>
                     <table border="0px" cellspacing="100px" cellpadding="10px">
                                        <tr>
                                                          <td ><select name="course"  style="width: 150px;height:40px" required="" id="crse">
                                                                  <option><%=course%></option>
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
                                            out.print("<option>"+ myresult.getString("course_name")+"</option>");
                                            
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
                                      
    <td> <div id="answer">
        
            <select  name="branch" style="width: 150px;height:40px" required="" id="brnch">
                 <option><%=branch%></option>
    <option value="Choose">Choose branch</option>
<%
   if(course.equalsIgnoreCase("Btech"))
   {
               try
              {
                  Class.forName("com.mysql.jdbc.Driver");
              Connection  myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                  try
                  {
                      String q="select * from branch where course_name=?";
                      PreparedStatement mystatement=myconnection.prepareStatement(q);
                      mystatement.setString(1,"BTech");  
                      ResultSet myresult=mystatement.executeQuery();
                      if(myresult.next())
                      {
                       do
                        {
            out.println("<option>"+myresult.getString("branch_name")+"</option>");
                        }
                          while(myresult.next());
                     
                    }
                      else
                      {
                          out.println("<option>No departments found</option>");
                      }

                  }
                  catch(Exception e)
                  {
                      out.println("Error in query " + e.getMessage());
                  }
                  finally
                  {
                      myconnection.close();
                  }
                  
              }
              catch(Exception e)
              {
                  out.println("Error in connection " + e.getMessage());
              }       }
%>
</select>

            
        </div>
                         </td><br>
                                              <td> 
                                                  <div id="answer2">
                                                      <select  name="sem" style="width: 150px;height:40px" required="" id="seme"><option><%=semster%></option> 
    <option value="Choose">Choose Semester</option>
<%
   if(course.equalsIgnoreCase("BTech"))
   {
  
 for(int i=1;i<=8;i++)
 {
   out.println("<option>"+i+"</option>");   
 }
   }
%>
                                                      
                                                      </select> 
                                                      
                                                  </div>
                                                                                  
                                                 </td>
                                                  
                                                 
                                             
                                                  </tr></table>
         <%  out.print("<img src=studentimages/" + imagename2 + " width='100px' height='100px' id='i'>"); %><br><br>
                 <h3><b>Change Passport Size Photo(Less or equal than 1.5 MB)</b></h3>
                         <input type="file"  name="pic" id="pic" style="height:40px;width:300px;color:white" onchange="getFilename(this)">
                    <input type="submit"  name="submit1" value="Update" style="height:40px;width:150px;color:white" >
                    <h3><b>Connection could be slow.(Note:-Click the Save Button only once.)</b></h3>

		</form>
	<br><br><br><br><br><br>
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
