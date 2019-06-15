<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@include file="header.jsp" %>
 <%@include file="variables.jsp" %>

    <body>
        <section id="feature" >
        <div class="container">
         
            <table width="50%"  cellpadding="25px" cellspacing="10px" border="0px"><tr>
 
        <%
        String sid;
              try
                {  Class.forName("com.mysql.jdbc.Driver");
                    Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                         try
                    {
                        String b="Select * from emstudenttable1,alotstud where alotstud.bid=emstudenttable1.bid and rollno=? and alotstud.sis=emstudenttable1.semester";
                        PreparedStatement mystatement1=myconnection.prepareStatement(b);
                        mystatement1.setString(1, session.getAttribute("b").toString());
                        ResultSet myresult1=mystatement1.executeQuery();
                        if(myresult1.next())
                        {
                  
                       
                            do
                            {
                      sid=myresult1.getString("sid");
                   
                        String ab="Select * from subjecttable where sid=?";
                        PreparedStatement mystatement=myconnection.prepareStatement(ab);
                      mystatement.setString(1,sid);
                        ResultSet myresult11=mystatement.executeQuery();
                        if(myresult11.next())
                        {
                            do
                            {
                                    out.print("<td align='left'><a href='subjectinfo.jsp?s="+myresult11.getString("sid")+"'><b><img src=subjectimages/" + myresult11.getString("simage") + " width='80px' height='80px'></b></a><br><br>");
                                 out.print("<a href='subjectinfo.jsp?s="+myresult11.getString("sid")+"'><b>"+ myresult11.getString("sname")+"</b></a></td>");
                                 
                                
                      //  out.print("<table width='100%' cellpadding='15px' cellspacing='30px'"
                        //        + " border='1px'><thead><tr><th><font color='black'><a href='subject.jsp'><h1>"+ myresult11.getString("sname")+"</h1></i></a></th></tr></thead></table>");  
                        
                            }while(myresult11.next());
                        }
                    }while(myresult1.next());
                        }}  
                            catch(Exception e)
                            {
                                out.print("Error in query bhj"+e.getMessage());
                            }
                }
              
                            catch(Exception e)
                            {
                                out.print("Error in Connection"+e.getMessage());
                            }
            
            
            
            
            %>
                </tr>
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