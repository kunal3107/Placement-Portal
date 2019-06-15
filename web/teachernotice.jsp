<%@page import="javax.activation.DataHandler"%>
<%@page import="javax.activation.FileDataSource"%>
<%@page import="javax.activation.DataSource"%>
<%@page import="javax.mail.*"%> 
<%@page import="javax.mail.internet.*"%>
<%@page import="java.util.Properties"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%

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
    <title>Add Notice for Students</title>
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

        <nav class="navbar navbar-inverse"  >
            <div  style="height:70px">
                <div class="navbar-header" >
          
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
                        <li ><a href="tpopanel.jsp"><% out.print("Welcome "+  session.getAttribute("ename"));%> </a></li>
                      <li><a href="viewstudents.jsp">View Students List</a></li>
                        <li><a href="teachernotice.jsp">Add Notice for Students</a></li>
                         <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
                
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
                           
                            $("#ans").html("<img src='images/preloader.gif' width='100px' align='center'>")
                        }
                        })
                                .done(function(data){
                                 
                         $("#dates").val(data);
                          $("#ans").html("<strong>"+"The notice will last till:-"+data+"</strong>")          
                        })
                    }
                })
            })
    </script>
   <%
String  imagename="",date="", notice="", branch="",course="",sem="",path="" ; 
boolean successful=true; int bid=0;
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

if(itemName1.equals("course")) //control's name - textbox name
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
else if(itemName1.equals("dates")) //control's name - textbox name
{
date=value;
}
else if(itemName1.equals("notice")) //control's name - textbox name
{
notice=value;
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
path=config.getServletContext().getRealPath("/") + "noticeimages/" + imagename; 
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
   
  boolean flag=false;     
   DateFormat dateFormat= new SimpleDateFormat("yyyy/MM/dd");
Calendar c = Calendar.getInstance();    
//out.println(dateFormat.format(c.getTime()));
           if(notice!=null)
      {
          // out.println("<script> alert('Sorry only pictures of less than 400kb are allowed to upload') </script>");
         
           String[] mab=course.split(",");
           int bidz=0;
   try
                { 
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                     try
                    {
                        
                              
                        String b="Select (bid) from branch where course_name=? and branch_name=?" ;
                        PreparedStatement mystatement1=myconnection.prepareStatement(b);
                        mystatement1.setString(1,mab[1]);
                         mystatement1.setString(2, branch);
                         ResultSet myresult=mystatement1.executeQuery();
                         if(myresult.next())
                         {
                          bidz=myresult.getInt("bid");
                          
                               
                         }

String q="insert into teachernotice(`date`, `notice`, `dateofissue`, `bid`, `sem`,imagename) values(?,?,?,?,?,?)";
PreparedStatement mystatement=myconnection.prepareStatement(q);
mystatement.setString(2, notice); 
mystatement.setString(4, String.valueOf(bidz));  
mystatement.setString(1, date);
mystatement.setString(3, dateFormat.format(c.getTime()));
mystatement.setString(5, sem); 
mystatement.setString(6, imagename); 

if(mystatement.executeUpdate()==1)
{ flag=true;
 }

if(flag)
{
    String result;
String ab="Select email from emstudenttable1 where bid=? and semester=?";
                                    PreparedStatement mystatement12=myconnection.prepareStatement(ab);
                                    mystatement12.setString(1, String.valueOf(bidz));
                                     mystatement12.setString(2, sem);
                                    ResultSet myresult2=mystatement12.executeQuery();
                                     if(myresult2.next())
                                { 
                                    do
                                    {
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
       try{ 
       MimeMessage message = new MimeMessage(session2);
       //message.setFrom(new InternetAddress(from)); 
       //message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));  
         message.addHeader("Content-type", "text/html; charset=UTF-8");
  //  message.setFrom(new InternetAddress("gtbemailtrial@gmail.com"));
    message.setRecipients(Message.RecipientType.TO,    InternetAddress.parse(myresult2.getString("email")));
      message.setSubject("Notice");
    message.setText("This is to inform that "+notice); 
//       BodyPart messageBodyPart = new MimeBodyPart(); 
//       messageBodyPart.setText("This is message body"); 
//       Multipart multipart = new MimeMultipart(); 
//       multipart.addBodyPart(messageBodyPart); 
//       messageBodyPart = new MimeBodyPart(); 
//       String filename = "file.txt"; 
//       DataSource source = new FileDataSource(filename); 
//       messageBodyPart.setDataHandler(new DataHandler(source)); 
//       messageBodyPart.setFileName(filename); 
//       multipart.addBodyPart(messageBodyPart);   
//       message.setContent(multipart ); 
       Transport.send(message); 
       String title = "Send Email"; 
       result = "Sent message successfully...."; 
    }
    catch (MessagingException mex) { 
       mex.printStackTrace(); 
       result = "Error: unable to send message...."; 
   }
                                    }
                                    while(myresult2.next());
      out.print("<h1 class='form-control'>Notice Added Successfully. "+"</h1>");
}
                    else
{
      out.print("<h1 class='form-control'>Error Occured Successfully. "+"</h1>");

} }

}
catch(Exception e)
{
out.println("Error in Connection 1" + e.getMessage());
}

 }     
   catch(Exception e) 
{
out.println("Error in Connection 2" + e.getMessage());
}
}
else
{
    out.println("Sorrytion " );
}
}
     catch(Exception e) 
{
out.println("Error in Connection 2" + e.getMessage());
}
}
}
%>

<div class="login">
    <div class="wrapper" id="loginwrapper">
        <div class="container" style="height:">
            <h1 >Add Notices</h1>
                
            <form role="form" style="color:black" enctype="multipart/form-data" method="post">
                                    <table border="0px">
                                       
                                                          <td ><select name="course"  style="width: 200px;height:40px" required="" id="crse" >
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
                                                  
                                                
                                                      </table>
                    

                                                       </select>
                    <br>
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
                     <div id="ans"></div>
                  
                     <textarea name="notice" class="form-control-static" placeholder="Add Notice" id="name" rows="10" cols="30"></textarea><br>
                    <input type="text" name="dates" id="dates" hidden>
                        <h3><b>Add Additional Picture</b></h3>
                    <input type="file"  name="pic"  style="height:40px;width:300px;color:white" value="fds" >
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

