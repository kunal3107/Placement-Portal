<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@include file="header.jsp" %>
 <%@include file="variables.jsp" %>
 <script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/wow.min.js"></script> 
   <script type="text/javascript"></script>
  
<%
  
    if(request.getParameter("submit1")!=null ) 
    {  
       
           try
{
    
Class.forName("com.mysql.jdbc.Driver");
Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
try
{
String q="insert into recruiterdetails (`cname`, `jp`, `jl`, `Salary`, `cad`, `web`, `branches`, `ec`, `Procedure`, `doj`, `name`, `email`, number) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";  
PreparedStatement mystatement=myconnection.prepareStatement(q);
mystatement.setString(1, request.getParameter("cname"));  
mystatement.setString(2, request.getParameter("jp"));

mystatement.setString(3,request.getParameter("jl"));
mystatement.setString(5,request.getParameter("cad"));
mystatement.setString(4,request.getParameter("Salary")); 
mystatement.setString(6,request.getParameter("web"));
mystatement.setString(7,request.getParameter("eb"));
mystatement.setString(8,request.getParameter("ec")); 
mystatement.setString(9,request.getParameter("Procedure"));
mystatement.setString(10,request.getParameter("doj"));
mystatement.setString(11,request.getParameter("n")); 
mystatement.setString(12,request.getParameter("mail"));
mystatement.setString(13,request.getParameter("req"));  
    
if(mystatement.executeUpdate()==1)
{
  
   out.println("<script> alert('Successfully Registered with Daviet Placements.') </script>");
  
   }
else
{
        //out.println("<h1>fdbdgbgfhgfhjgfjdfkidan</h1>");
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
        //out.print("<div class='panel-heading' style='height:0px'><b>Kindly Input the correct verification Code</b></p></div>"); 
    }
    
    
    %>
    <body>
    <div class="login">
     <div class="form" >
        <div class="container" style="height:80px">
           
		
                <form class="form" name="f1" method="post"><br>
                    
                       <table width="100%"  cellpadding="15px" cellspacing="30px" border="1px">
                           <thead> <tr ><th colspan="2"><h1 align="center">Recruiter Sign up</h1></th></tr>
                               <tr> <th colspan="2"><h2 align="center"> Details</h2></th></tr>
                               <tr ><th><b>Company Name</b></th><td><input type="text"  name="cname" placeholder="Name"><br></td></tr>
                               <tr ><th> <b>Job Profile</b></th><td><input type='text' name="jp" placeholder="Profile"><br></td></tr>
                           <tr ><th><b>Job location</b></th><td><input type="text"  name="jl" placeholder="Job location" required=""><br></td></tr>
                               <tr ><th> <b>Salary</b></th><td><input type="text"  name="Salary" placeholder="Salary" required=""><br></td></tr>
                               <tr><th><b> Company's Address </b></th>
                                   <td><input type="text" name="cad" placeholder="Company's Address" required=""></td></tr>
                              <tr><th><b>Company's Website</b></th>
                           <td> <input type="text" name="web" placeholder="Company's Website" required=""></td></tr>
                  <tr><th><b>Eligible Branches</b></th> 
                        <td><input type="text"  name="eb" placeholder="Eligible Branches" required=""></td></tr>
                <tr><th><b>Eligibility Criteria</b></th>
                        <td><input type="text"  name="ec" placeholder="Eligibility Criteria" required=""></td></tr>
                    <tr><th><b>No. of Requirement</b><br></th>
                          <td><input type="number"  name="req" placeholder="No. of Requirement" required=""></td></tr>
                   <tr><th>Selection Procedure</th>
 <td><input type="text"  name="Procedure" placeholder="Procedure" required=""></td></tr>
 <tr><th><b>Date of Joining</b></th>
     <td><input type="date"  name="doj" placeholder="Date of Joining" required=""></td></tr>
                      
                 <tr><th colspan="2"><h2  align="center">CONTACT PERSON DETAILS : </h2></th></tr> <tr><th><b>Contact Person</b></th><br>

     <td><input type="text"  name="n" placeholder="Name"></td></tr>
                       <tr><th><b>Email</b></th>
                           <td><input type="email"  name="mail" placeholder="Email"></td></tr>
                        
 <tr><th colspan="2"><h3 align='center'><input type="submit"  name="submit1" value="Submit" style="height:40px;width:150px;color:red"></h3></th></tr>
 </thead></table>
    <%@include file="footer.jsp" %>
 </form>
 </div> </div> </div>

 </body>
</html>

