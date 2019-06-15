<%String name="Unknown";String password="123";String email="a@gmail.com" ;String course="as";String branch="a";String semster="1";String imagename2=null;
      String rollno1=request.getParameter("rollno");
    if(session.getAttribute("mail")==null)
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
    <style>
        #topnavbar{
            height: 30%
        }
         #topnavbar1{
            height: 80%
        }
    </style>
  <title>Add Student</title>
  <script>
        $("#pic").change(function(e){
    $("#i").html("njhn")

    })   
 $("pic").on('change', function() {
    
         ///// Your code
});
 $("#pic").live('change', function(){  });
 function getFileName(elm) {
   var fn = $(elm).val();

}
  </script>
</head>



<body>
    
    <header id="topnavbar" style="padding: 0px;">

        <nav class="navbar navbar-inverse">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt="logo" width="350"></a>
                </div>
				
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li ><a href="index.html">Home</a></li>
                        <li><a href="studentpanel.jsp"><% out.print("Welcome "+  name);%> </a></li>
                          <li class="active"><a href="studentpanel.jsp">Account</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->	
    </header>
  
<%

   
String imagename="default";

    try
{
Class.forName("com.mysql.jdbc.Driver");
Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
try
{
String q="select * from emstudenttable1  where email=?";
PreparedStatement mystatement=myconnection.prepareStatement(q);
mystatement.setString(1, session.getAttribute("mail").toString());
ResultSet m=mystatement.executeQuery();
if(m.next())
{
   
         
 name=m.getString("name");

// out.println("<script> alert('m.getString('name')') </script>");
 password=m.getString("password");
 email=m.getString("email");
course=m.getString("course");
 branch=m.getString("branch");
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

    

    %>
     <%

String  name2="",emailid2="", password12="" , rollno2="",branch2="",course2="",sem2="",path2="",imagename4="",image="";
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

else if(itemName1.equals("semester")) //control's name - textbox name
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
    //out.print("HKEKEKEKEKEKEKEKEEKEKE");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
try
{
String q="update emstudenttable1 set `rollno`=?, `name`=?, `password`=?, `email`=?, `course`=?, `branch`=?, `semester`=?, `imagename`=? where rollno=?";
PreparedStatement mystatement=myconnection.prepareStatement(q);
mystatement.setString(1, rollno2);

mystatement.setString(2, name2);

mystatement.setString(3, password12);
mystatement.setString(4, emailid2);
mystatement.setString(5, course2);
mystatement.setString(6, branch2);
mystatement.setString(7, sem2);

mystatement.setString(8, imagename4);
//mystatement.setString(9, session.getAttribute("tid").toString()); 
mystatement.setString(9, rollno1); 

if(mystatement.executeUpdate()==1)
{
    
response.sendRedirect("viewstudents.jsp?upd=update");
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
}
%>
<div class="login">
    <div class="wrapper" id="loginwrapper">
        <div class="container" style="height:80px">
		<h1>UPDATE STUDENT</h1>
                <form class="form" name="f1" method="post" enctype="multipart/form-data" >
                    <input type="text"  name="sroll" placeholder="Roll no" required="" value=<%=request.getParameter("rollno") %>>
                    <% out.print("<input type='text' name='sname' placeholder='Name'  value="+name+" required=''>"+
                    "<input type='password' name='spwd' placeholder='Password' value="+ password +" required='' >"+
                    "<input type='email' name='mail' placeholder='E-Mail ID' required='' value="+email +" disabled>");%>
                    <select name="course"  style="width: 250px;height:40px" required=""  >
                        <option><%=course%></option>
                        <%
                            if(course.equalsIgnoreCase("BTech"))
                        {
                            out.print("<option>MCA</option>"+
                                        "<option>MBA</option>");
                        }
                           else if(course.equalsIgnoreCase("MCA"))
                        {
                            out.print("<option>BTech</option>"+
                                        "<option>MBA</option>");
                        }
                           else if(course.equalsIgnoreCase("MBA"))
                           {
                               out.print("<option>BTech</option>"+
                                        "<option>MCA</option>");
                       
                           }
                            else 
                           {
                               out.print("<option>BTech</option>"+"<option>MBA</option>"+
                                        "<option>MCA</option>");
                       
                           } 
                        %>
                          
                    </select><br>
                    <select  name="branch" style="width: 250px;height:40px" required="">
                        <option><%=branch%></option>
                        <option>Choose Branch</option>
                        <option>CSE</option>

                                                <option>IT</option>
                        <option>ECE</option>

                        
                        
                                            
                    
                    </select><br>
                    <select name="semester"  style="width: 250px;height:40px"><option><%=semster %></option> <option>Choose Semester</option>
                        
                      <%
                            
                        {
                            for(int a2=1;a2<=8;a2++)
                            {
                                out.print("<option>"+a2+"</option>");
                            }
                        }
                            
                      %>  
                            </select><br><br>
                            <%  out.print("<img src=studentimages/" + imagename2 + " width='100px' height='100px' id='i'>"); %><br><br>
                         <input type="file"  name="pic" id="pic" style="height:40px;width:300px;color:white" onchange="getFilename(this)">
                    <input type="submit"  name="submit1" value="Update" style="height:40px;width:150px;color:white" >
<br><br><br><br><br><br>
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
        <%@include file="footer.jsp" %>
        
        <script>
 $("#login-button").click(function(event){
		 event.preventDefault();
	 
	 $('form').fadeOut(500);
	 $('.wrapper').addClass('form-success')});
 

 
   
//     $(document).ready(function(){
//         $("#pic").blur(function(){
//         var a=(this).value;
//         
//          if(a.length==0)
//             {
//                 
//             }
//             else
//             {
//                 $.ajax({
//             url:"ajaxpic.jsp",
//             data:{"img":default.jpg}
//             
//            
//         })
//                 .done(function(data){
//                     
//                   $("#pic").html("<img src= studentimages/" + data + " width='100px' height='100px'>")  
//                     
//                     
//         })    
//             }
//         })
//         
//     })
         </script>
         
</body>
</html>
