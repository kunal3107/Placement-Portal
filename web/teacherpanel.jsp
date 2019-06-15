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
                                    String a="Select * from adminnotice where depts=? and date>=? order by dateofissue desc";
                                    PreparedStatement mystatement1=myconnection1.prepareStatement(a);
                                    mystatement1.setString(1, session.getAttribute("dname").toString());
                                     SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy/MM/dd");
                                      Calendar c = Calendar.getInstance();   
                                    mystatement1.setString(2,dateFormat.format(c.getTime()));
                                    ResultSet myresult=mystatement1.executeQuery();
                               
                                  if(myresult.next())
                                { 
                                  
                                  out.print("<h1 class='panel' align='center'><b>Notices</b></h1>");
                                
                                    do{
                                        flag++;
                                        if(flag<=2)
                                        {
                                    out.print("<div class='form-controla'><strong><marquee>("+myresult.getString("dateofissue")+")--"+myresult.getString("notice")+"</marquee></strong><br></div>");
                                        }
                                        if(flag>2)
                                        {
                                            
                                    out.print("<div  align='center'><a href='notices.jsp'><b>More Recent Notices......</b></a><br></div>");
                                    break;
                                            
                                        }
                                 }while(myresult.next());
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
    
    <body>
    <section id="feature" >
        <div class="container">
            <table width="100%"  cellpadding="15px" cellspacing="30px">
                
                <thead> <tr ><th><font color="black"><a href="alotstudentsteacher.jsp"><i class="fa fa-plus-circle fa-5x" aria-hidden="true" ></i></a></font></th>
                        <th><font color="black"><a href="viewstudents.jsp"><i class="fa fa-list fa-5x" aria-hidden="true">  </i> </a></font></th><font>
                <th><font color="red"><i class="fa fa-plus-square fa-5x" aria-hidden="true"></font></i></th></tr>
                    
            <tr><td align="left"><a href="alotstudentsteacher.jsp"><b>Alot Students</b></a></td>
                <td><a href="viewstudents.jsp"><b>View Students</b></a></td>
                        <td><b>Add Assignments</b></td>
                    </tr>
                
                <tr ><th><i class="fa fa-search fa-5x" aria-hidden="true"></i></th>
                        <th><i class="fa fa-bar-chart-o fa-5x" aria-hidden="true"></i></i></th>
                        <th><i class="fa fa-qrcode fa-5x" aria-hidden="true"></i></th></tr>
                    <tr><td align="left"><b>Search for Students</b></td>
                        <td><b>Add Attendence</b></td>
                        <td><b>Add Quiz</b></td>
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