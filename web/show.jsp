<%@page import="java.sql.*"%>

<%@ page import ="java.util.*"
        import ="java.text.*" %>

<%@include file="variables.jsp" %>
<%
    int bid=0;
    String ab=request.getParameter("sem");
    String a[]= ab.split(",");
     try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                     Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                  
                         try
                    {
                                
                        String b="Select (bid) from branch where course_name=? and branch_name=?" ;
                        PreparedStatement mystatement1=myconnection.prepareStatement(b);
                        mystatement1.setString(1,a[1]); 
                         mystatement1.setString(2, a[2]);
                         ResultSet myresult=mystatement1.executeQuery();
                         if(myresult.next())
                         {
                             bid=myresult.getInt("bid");
                         }
                  
   String b2="Select * from emstudenttable1 where bid=? and semester=? ";
                        PreparedStatement mystatement2=myconnection.prepareStatement(b2);
                  //    mystatement2.setString(2, session.getAttribute("tid").toString());
                         mystatement2.setString(1,String.valueOf(bid));  
                         
                         
                           mystatement2.setString(2,a[3]); 
                      ResultSet myresult12=mystatement2.executeQuery();
                        if(myresult12.next())
                        {
                            out.print("<table class='table table-striped'><thead><tr class='info'><th>Image</th><th>Roll No.</th><th>Name</th><th>Email</th><th>Course</th><th>Branch</th><th>Semester</th></tr>");
                            do
                            {
                                out.print("<tbody><tr> " +"<td><img src=studentimages/" + myresult12.getString("imagename") + " width='100px' height='100px'>"+"</td><td>" +myresult12.getString("rollno")+
                                             "</td><td>"+myresult12.getString("name")+
                                        "</td><td>"+myresult12.getString("email")+
                                        "</td><td>"+a[1]+
                            "</td><td>"+a[2]+"</td><td>"+myresult12.getString("semester")+"</td>");
                        //       "<td><a href='updatestudent.jsp?rollno=" + myresult1.getString("rollno")+ "'><i class='fa fa-pencil-square-o fa-3x' aria-hidden='true'></i></td></a>"+"<td><a href='deletestudent.jsp?rollno=" + myresult1.getString("rollno")+ "'><i class='fa fa-trash-o fa-3x' aria-hidden='true'></i></td></a></tr>");
                        
                            
                            }while(myresult12.next());
                            out.print("</tbody></table>");
                         
                        }
                  
                        
                  
                        
                        else
                                                    {
                                                        out.print("<p class='alert agileits w3layouts alert-warning'>No records</p>");
                                                    }
                    }
                            
                        catch(Exception e)
                                {
                                out.print("Error in query aa"+e.getMessage());
                                }
                            finally
                            {
                                myconnection.close();
                            }
                }
                               catch(Exception e)
                                {
                                out.print("Error in query");
                                }
      



%>
 

