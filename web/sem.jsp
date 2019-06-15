<%@page import="java.sql.*"%>

<%@ page import ="java.util.*"
        import ="java.text.*" %>

<%@include file="variables.jsp" %>

<select  name="sem" style="width: 150px;height:40px" required="" id="seme">
    <option value="Choose">Choose Semester</option>
<%
   String ab=request.getParameter("branch");
  String a[]= ab.split(",");
   double m=Double.parseDouble(a[0])*2;
 Thread.sleep(0000001);
 for(int i=1;i<=m;i++)
 {
   out.println("<option>"+i+"</option>");   
 }
         
//            
//              try
//              {
//                  Class.forName("com.mysql.jdbc.Driver");
//              Connection  myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
//                  try
//                  {
//                      String q="select * from semester where branch_name=?";
//                      PreparedStatement mystatement=myconnection.prepareStatement(q);
//                      mystatement.setString(1, a[1]);
//                      ResultSet myresult=mystatement.executeQuery();
//                      if(myresult.next())
//                      {
//                       do
//                        {
//            out.println("<option>"+myresult.getString("semester")+"</option>");
//                        }
//                          while(myresult.next());
//                     
//                    }
//                      else
//                      {
//                          out.println("<option>No sem found</option>");
//                      }
//
//                  }
//                  catch(Exception e)
//                  {
//                      out.println("Error in query " + e.getMessage());
//                  }
//                  finally
//                  {
//                      myconnection.close();
//                  }
//                  
//              }
//              catch(Exception e)
//              {
//                  out.println("Error in connection " + e.getMessage());
//              }
%>
</select>
 <script type="text/javascript">
      $(document).ready(function(){
                $("#seme").change(function(){
                  
                    var a=$(this).val()
                    var value="<%=ab%>,"
              
                    if(a=="Choose")
                    {
                     $("#answer3").html("")     
                    }
                    else
                    {
                       
                    $.ajax({
                        url:"show.jsp",
                        data:{"sem":value+a},
                        beforeSend:function (){
                           
                            $("#answer3").html("<img src='images/preloader.gif' width='100px' align='center'>")
                        }
                        })
                                .done(function(data){
                                    
                         $("#answer3").html(data)          
                        })
                    }
                })
            })
                </script>  

