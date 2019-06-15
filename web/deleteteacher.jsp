
<%@page import="java.sql.*"%>

<%@include file="variables.jsp" %>

<%
String tid=request.getParameter("teacher_id");
try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                  
                        
                            try
                    {
                         //String name1=request.getParameter("name");
                        String b="delete from teachertable where teacher_id=?";
                        PreparedStatement mystatement1=myconnection.prepareStatement(b);
                       // mystatement1.setString(1, session.getAttribute("tid").toString());
                         mystatement1.setString(1,tid); 
                       if(mystatement1.executeUpdate()==1)
                       {
                           response.sendRedirect("viewteachers.jsp?m=del");
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