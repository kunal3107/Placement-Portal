<%@page import="java.sql.*"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@include file="headerstudent.jsp" %>
 <%@include file="variables.jsp" %>
<% 
if(request.getParameter("m")!=null)
{
out.print("<script>alert('Successfully Registered')</script>");
}
if(request.getParameter("p")!=null)
{
out.print("<script>alert('Updated Successfully')</script>");
}

    int flag=0;
    
                    
    try
                            {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection myconnection1=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                                try
                                { 
                                    String a="Select * from emstudenttable1 where email=?";
                                    PreparedStatement mystatement1=myconnection1.prepareStatement(a);
                                    mystatement1.setString(1, session.getAttribute("mail").toString());
                                    ResultSet myresult=mystatement1.executeQuery();
                                     if(myresult.next())
                                { 
                                  
                                try
                                { 
                                    String aa="Select * from teachernotice where bid=? and sem=? and date>=? order by dateofissue desc";
                                    PreparedStatement mystatement=myconnection1.prepareStatement(aa);
                                    mystatement.setString(1, myresult.getString("bid"));
                                    mystatement.setString(2, myresult.getString("semester"));
                                     SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy/MM/dd");
                                      Calendar c = Calendar.getInstance();   
                                    mystatement.setString(3,dateFormat.format(c.getTime()));
                                    ResultSet myresult1=mystatement.executeQuery();
                               
                                  if(myresult1.next())
                                { 
                                  
                                  out.print("<h1 class='panel' align='center'><b>Notices</b></h1>");
                                
                                    do{
                                        flag++;
                                        if(flag<=2)
                                        {
                                    out.print("<div class='form-controla'><strong><marquee>("+myresult1.getString("dateofissue")+")--"+myresult1.getString("notice")+"</marquee></strong><br></div>");
                                        }
                                        if(flag>2)
                                        {
                                            
                                    out.print("<div  align='center'><a href='snotices.jsp'><b>More Recent Notices......</b></a><br></div>");
                                    break;
                                            
                                        }
                                 }while(myresult1.next());
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
                                     else
                                     {
                                         
                                     }
                                } 
    
                            catch(Exception e)
                                {
                                    out.print("Error in Connection 1"+e.getMessage());
                                }
                        } 
                            catch(Exception e)
                                {
                                    out.print("Error in Connection 2"+e.getMessage());
                                } 
    
    
    
    %>
    

    <body>
    <section id="feature" >
        <div class="container">
            <table width="100%"  cellpadding="15px" cellspacing="30px" border="0px">
                
                <thead> 
                    <tr >
                        <th><font color="red"><a href="updateinfo.jsp"><i class="fa fa-list fa-5x" aria-hidden="true" ></i></a></font></th>
                        <th><font color="red"><a href="#"><i class="fa fa-list fa-5x" aria-hidden="true" ></i></a></font></th>
                        <th><font color="red"><a href="snotices.jsp"><i class="fa fa-list fa-5x" aria-hidden="true" ></i></a></font></th>
                           
            <tr><td align="left"><a href="updateinfo.jsp"><b>Update Account Details</b></a></td>
             <td align="left"><a href="#"><b>Aptitute Questions</b></a></td>
              <td align="left"><a href="snotices.jsp"><b>View Notices</b></a></td>
                    </tr>
                
             
                 
                </thead>
            </table>
             

           <div class="center wow fadeInDown">
</div></div>           
               </section>
                  <script src="js/jquery.js"></script>
                  
    
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/wow.min.js"></script>

           </body>
           
               
</html>
<%@include file="footer.jsp" %>