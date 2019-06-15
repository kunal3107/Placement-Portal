<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@include file="headerstudent.jsp" %>
 <%@include file="variables.jsp" %>
   
    <% 
   
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
                                    String aa="Select * from teachernotice where bid=? and sem=? and dateofissue<=? order by dateofissue desc";
                                    PreparedStatement mystatement=myconnection1.prepareStatement(aa);
                                    mystatement.setString(1, myresult.getString("bid"));
                                    mystatement.setString(2, myresult.getString("semester"));
                                     SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy/MM/dd");
                                      Calendar c = Calendar.getInstance();   
                                    mystatement.setString(3,dateFormat.format(c.getTime()));
                                    ResultSet myresult1=mystatement.executeQuery();
                               
                               
                              if(myresult1.next()) 
                                { 
                                  
                                  out.print("<h1 class='panel' align='center'><b>List of Notices</b></h1><table border=0 width='70%' align='center' cellpadding='10px' cellspacing='30px'><tr><b><th>Image</th><th></th><th align='center'>Date_Of_Issue of Notice</th><th></th><th align='center'>Notice</th></b></tr>");
                                
                                    do{
                                out.print("<tr><td><a href=noticeimages/"+myresult1.getString("imagename")+">"+"<img src=noticeimages/" + myresult1.getString("imagename")+" width='100px' height='100px'></a>"+"</td><td></td><td><strong>"+myresult1.getString("dateofissue")+"<strong></td><td></td><td>"+myresult1.getString("notice")+"</td></tr>"); 
                                                                                
                                 }while(myresult1.next()); 
                                    out.print("</table><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>");
                                }
                              else
                              {
                                  out.print("<br><br><br><h1 class='panel' align='center'>No Notice is declared so far.Stay Updated.</h1>");
                                out.print("</table><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>");
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
    
}}
                                 catch(Exception e)
                                {
                                    out.print("Error in Connection"+e.getMessage());
                                }
                                }
                                 catch(Exception e)
                                {
                                    out.print("Error in Connection"+e.getMessage());
                                }

    %>
   
<%@include file="footer.jsp" %>