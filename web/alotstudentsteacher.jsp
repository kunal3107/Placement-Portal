
<%@include file="headerteacher.jsp" %>
<%@include file="variables.jsp" %>
   <script type="text/javascript" src="jquery/jquery1.js">alert('hi')</script>
<body >
         <%
       int bid=0;          
if(request.getParameter("alot")!=null)
{
 String[] ma=request.getParameter("course").split(",");
     try
                { 
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                     try
                    {
                                
                        String b="Select (bid) from branch where course_name=? and branch_name=?" ;
                        PreparedStatement mystatement1=myconnection.prepareStatement(b);
                        mystatement1.setString(1,ma[1]);
                         mystatement1.setString(2, request.getParameter("branch"));
                         ResultSet myresult=mystatement1.executeQuery();
                         if(myresult.next())
                         {
                             bid=myresult.getInt("bid");
                         }
                   String ab="insert into alotstud (`teacher_id`, `sid`,`sis`, `bid`) values (?,?,?,?)" ;
                        PreparedStatement mystatement11=myconnection.prepareStatement(ab);
                        mystatement11.setString(1, session.getAttribute("tid").toString());
                         mystatement11.setString(2, request.getParameter("subject"));
                           mystatement11.setString(4,String.valueOf(bid)); 
                           //  mystatement11.setString(4, request.getParameter("branch"));
                               mystatement11.setString(3, request.getParameter("sem"));
                        if(mystatement11.executeUpdate()==1)
                        {
                            out.print("<h1 class='form-control'><b>Student Alotted Successfully. </b></h1>"); 
                         
                       
                        }
                         
                            
                                       else
                                                    {
                                                    //    out.print("<p class='alert agileits w3layouts alert-warning'>Error</p>");
                                                    }
                        
                                                }
                                                catch(Exception e)
                                                {
                                                    out.println("Error in Query a" + e.getMessage());
                                                }
                                                
                                             }
                                             catch(Exception e)
                                             {
                                                 out.println("Error in Connection " + e.getMessage());
                                             }
                                             
                     
    
}
                      
                      %>    
     
 
    
       
     <section id="feature" >
        <div class="container">
            <div class="search">
                                <form role="form" style="color:black">
                                     <table cellspacing="100px" cellpadding="10px" border="0px">
                                                      
                                    <th><select name="subject"  style="width: 150px;height:40px"><option value="0">Choose Subject</option>
                                                     
                                            
                                            
                                            <%
                                                         String subjcq[]=null; 
                                                         try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                    try
                    {
                                                          String aabq="select * from teachertable where teacher_id=?";
                                PreparedStatement mystatement1=myconnection.prepareStatement(aabq);
                                mystatement1.setString(1,session.getAttribute("tid").toString());
                                ResultSet myresult1=mystatement1.executeQuery();
                                if(myresult1.next())
                                { 
                                         subjcq=myresult1.getString("subjects").split(",");   
                                             }
                                
                                }
                   catch(Exception e)
                                                {
                                                    out.println("Error in Query " + e.getMessage());
                                                }
                                   
                    
                    try
                    {
                                                          String aabq="select * from subjecttable";
                                PreparedStatement mystatement121=myconnection.prepareStatement(aabq);
                                ResultSet myresult12=mystatement121.executeQuery();
                                if(myresult12.next())
                                {
                                       do{ 
                                    for(String ma:subjcq)
                                    {
                                         //out.print("<script>"+"alert("+m+")"+"</script>");
                                        
                               
                                        //out.print("<script>"+"alert("+myresult.getString("qid")+")"+"</script>");
                                    if(myresult12.getString("sid").equals(ma))
                                            {
                                  
                                        out.print("<option value="+myresult12.getString("sid")  +">"+myresult12.getString("sname")+"</option>");
                                          //  break;
                                             }
                                
                                }}
                                    while(myresult12.next());}
                                
                    }
                    catch(Exception e)
                                                {
                                                    out.println("Error in Query " + e.getMessage());
                                                }
                                                
                                             }
                                             catch(Exception e)
                                             {
                                                 out.println("Error in Connection " + e.getMessage());
                                             }
                                             
                               
                                                         
                                                         
                                                         %>
                                                 
                                                 
                                                 
                                                 
                                                 </select>
           
                                                        </th></tr>
                                                  </table>
                                                 
                                    <table border="0px" cellspacing="100px" cellpadding="10px">
                                        <tr>
                                                          <td ><select name="course"  style="width: 150px;height:40px" required="" id="crse">
                                              <option value="0">Choose Coarse</option>
                        <%
                            
                           double m=0;
             try
                            {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                            try
                            {
                                String aa="select * from course";
                                PreparedStatement mystatement=myconnection.prepareStatement(aa);
                                ResultSet myresult=mystatement.executeQuery();
                              
                                if(myresult.next())
                                {
                                   
                                     do{
                                    
                                    
                                       
                                m=Double.parseDouble(myresult.getString("duration"));
                                            out.print("<option value="+myresult.getString("duration")+","+myresult.getString("course_name")+">"+ myresult.getString("course_name")+"</option>");
                                                                     }while(myresult.next());
                                  
                                    
                                }
                                else{
                                    out.print("Dfsgfsd");
                                }
                                
                                
                            }
                            catch(Exception e){
                                   out.print("Error in query"+e.getMessage());
                            }
                            }
                            
                            catch(Exception e)
                                    {
                                           out.print("Error in Connection"+e.getMessage());
                                    }

             %>

                         </select>    </td>
                                                    <script type="text/javascript">
         $(document).ready(function(){
                $("#crse").change(function(){
                  
                    var a=$(this).val()
                
                 
                    if(a=="select")
                    {
                     $("#answer").html("")     
                    }
                    else
                    {
                       
                    $.ajax({
                        url:"branch.jsp",
                        data:{"course":a},
                        beforeSend:function (){
                           
                            $("#answer").html("<img src='images/preloader.gif' width='100px' align='center'>")
                        }
                        })
                                .done(function(data){
                                 
                         $("#answer").html(data)          
                        })
                    }
                })
            })
    </script>
                                                          <td> <div id="answer"></div>
                         </td><br>
                                              <td> 
                                                  <div id="answer2"></div>
                                                                                  
                                                 </td>
                                                  
                                                  <td>   <input type="submit" value="Alot Students" name="alot" ></td>
                                                
                                             
                                                  </tr></table>
                                                 
                                                  <br><br>
                    
                
                      </form>            
            </div><br><br>
           
                    
                 <div id="answer3"></div> 
                                    
           
                  
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