
<%@page import="java.sql.*"%>

<%@include file="variables.jsp" %>

<%
String rollno=request.getParameter("rollno");
try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                  
                        
                            try
                    {
                         //String name1=request.getParameter("name");
                        String b="delete from emstudenttable1 where rollno=?";
                        PreparedStatement mystatement1=myconnection.prepareStatement(b);
                       // mystatement1.setString(1, session.getAttribute("tid").toString());
                         mystatement1.setString(1,rollno); 
                       if(mystatement1.executeUpdate()==1)
                       {
                           response.sendRedirect("viewstudents.jsp?m=del");
                       }
                    }
                             catch(Exception e)
                                {
                                out.print("Error in query");
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