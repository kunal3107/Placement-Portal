<%@page import="java.sql.*"%>

<%@ page import ="java.util.*"
        import ="java.text.*" %>

<%@include file="variables.jsp" %>
<select  name="branch" style="width: 150px;height:40px" required="" id="brnch">
    <option value="Choose">Choose branch</option>
<%
   String ab=request.getParameter("course");
  String[] m=ab.split(",");
 Thread.sleep(0);
 
         
            
              try
              {
                  Class.forName("com.mysql.jdbc.Driver");
              Connection  myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                  try
                  {
                      String q="select * from branch where course_name=?";
                      PreparedStatement mystatement=myconnection.prepareStatement(q);
                      mystatement.setString(1, m[1]);
                      ResultSet myresult=mystatement.executeQuery();
                      if(myresult.next())
                      {
                       do
                        {
            out.println("<option>"+myresult.getString("branch_name")+"</option>");
                        }
                          while(myresult.next());
                     
                    }
                      else
                      {
                          out.println("<option>No departments found</option>");
                      }

                  }
                  catch(Exception e)
                  {
                      out.println("Error in query " + e.getMessage());
                  }
                  finally
                  {
                      myconnection.close();
                  }
                  
              }
              catch(Exception e)
              {
                  out.println("Error in connection " + e.getMessage());
              }
%>
</select>
  <script type="text/javascript">
         $(document).ready(function(){
                $("#brnch").change(function(){
                  
                    var a=$(this).val()
                    var value="<%=ab%>,"
                 
                    if(a=="Choose")
                    {
                     $("#answer2").html("")     
                    }
                    else
                    {
                       
                    $.ajax({
                        url:"sem.jsp",
                        data:{"branch":value+a},
                        beforeSend:function (){
                           
                            $("#answer2").html("<img src='images/preloader.gif' width='100px' align='center'>")
                        }
                        })
                                .done(function(data){
                         $("#answer2").html(data)          
                        })
                    }
                })
            })
                </script>   