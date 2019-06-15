<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@include file="headerteacher.jsp" %>
 <%@include file="variables.jsp" %>
<% 
    int flag=0;
    
                      // out.print(session.getAttribute("dname").toString()); 
    try
                            {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection myconnection1=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                                try
                                { 
                                    String a="Select * from adminnotice where depts=?  order by dateofissue desc";
                                    PreparedStatement mystatement1=myconnection1.prepareStatement(a);
                                    mystatement1.setString(1, session.getAttribute("dname").toString());
                                     SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy/MM/dd");
                                      Calendar c = Calendar.getInstance();   
                                  //  mystatement1.setString(2,dateFormat.format(c.getTime()));
                                    ResultSet myresult=mystatement1.executeQuery();
                               
                                  if(myresult.next())
                                { 
                                  
                                  out.print("<h1 class='panel' align='center'><b>List of Notices</b></h1><table border=0 width='70%' align='center' cellpadding='10px' cellspacing='30px'><tr><b><th>Date Of Issue of Notice</th><th>Notice</th></b></tr>");
                                
                                    do{
                                        
                                           
                                    out.print("<tr><td><div><strong>"+myresult.getString("dateofissue")+"</td><td>"+myresult.getString("notice")+"</td></tr></strong></div>");
                                                                                
                                 }while(myresult.next());
                                    out.print("</table><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>");
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
   
<%@include file="footer.jsp" %>