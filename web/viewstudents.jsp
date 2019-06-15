<%@include file="headeremployee.jsp" %>
<%@include file="variables.jsp" %>
<script type="text/javascript" src="jquery/jquery1.js"></script>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="java.io.*" %>
<body >

    <section id="feature" >
        <div class="container">
            <div class="search">
                    <form role="form" style="color:black" name="cs2" method="post">
                        <table border="1px" cellpadding="20px"><tr>
                   <td><input style="border: 1px solid gray; border-radius: 25px 0 25px 0;" type="text"  name="name" autocomplete="off" ></td>
                         <td> <input type="submit" class="fadeInDown" name="submit" autocomplete="off" placeholder="Search By Name" style="color:black;height:50px:border:1px" value="Search By Name"></td>
                     </tr>
                        </table>
                                </form> 
             
                <form role="form" style="color:black" name="fn3" method="post">
                    <table border="1px"><tr>
                           <td><select name="sele"  style="width: 300px;height:40px" required="">
                                                                <option value="0">Choose one</option>
                                                                <option value="1">Will join the placement provided by the Institute</option>
                                                                 <option value="2">Will venture into Entrepreneurship or Family Business </option>
                                                                  <option value="3">Will go for Higher Studies</option> 
                                                                  <option value="4">Will Explore career in Defence Forces</option>
                                                                   <option value="5">Any Other Option! </option>
                                                </select></td>
                                               <td><select name="course"  style="width: 150px;height:40px" required="" id="crse">
                                              <option value="0">Choose Course</option>
                        <%
                            java.util.Date date2=new java.util.Date();
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
                                   out.print("Error in query dsfsd"+e.getMessage());
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
                                          
              <td> <input type="submit" class="fadeInDown" name="submita" autocomplete="off" placeholder="Search" style="color:black;height:50px:border:1px" class="search-form" value="Search"></td></tr></table>
              </form>  <br>
            
            </div>
                 
          <br>
                
              <%     String path="";
                String name1=request.getParameter("name"); 
                  java.util.Date date = new java.util.Date(); 
                    
    if(request.getParameter("submit")!=null)
     {  
             try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                  
                        
                            try
                    {
                       
                        String b="Select * from emstudenttable1,branch,selectionresult,otherstudentinfo where " 
                                + "emstudenttable1.bid=branch.bid and "
                                + "selectionresult.email=emstudenttable1.email and otherstudentinfo.email=emstudenttable1.email and name like ?";
                        PreparedStatement mystatement1=myconnection.prepareStatement(b);
                       // mystatement1.setString(1, session.getAttribute("tid").toString());
                         mystatement1.setString(1,"%"+name1+"%");
                         session.setAttribute("search", name1);
                      //      mystatement1.setString(2, session.getAttribute("tid").toString());
                        ResultSet myresult1=mystatement1.executeQuery();
                      
                        if(myresult1.next())
                        {
                            
                            out.print("<table class='table table-striped' width='100%' cellpadding='20px' border='0px'><thead><tr class='info'><th>Image</th><th>R.No.</th><th>Full_Name</th>"
                                   + "<th>Course</th><th>Branch</th><th>Sem</th><th>Choice</th><th>Gender</th><th>Father's_Name</th><th>Date_of_Birth</th><th>Email</th><th><h2 align='center'>Tenth</h2><br>Board_P.Year_Marks</th><th><h2 align='center'>Twelvth</h2><br>Board_P.Year_Marks</th><th><h2 align='center'>Diploma</h2><br>Board_P.Year_Marks</th><th>Marks</th><th>Backlogs</th></tr>");
                            do
                            {
                              
                                out.print("<tbody><tr> <td>" +"<img src=studentimages/" + myresult1.getString("imagename") + " width='100px' height='100px'>"+"</td><td>" +myresult1.getString("rollno")+
                                             "</td><td>"+myresult1.getString("name")+"</td><td>"+myresult1.getString("course_name")+"</td><td>"+myresult1.getString("branch_name")+"</td><td>"+myresult1.getString("semester")+"</td>"+
                                        "<td>"+myresult1.getString("seid")+"_"+myresult1.getString("options")+"_"+myresult1.getString("ans")+"</td><td>"+myresult1.getString("gender").charAt(0)+"</td><td>"+myresult1.getString("fname")+"</td><td>"+myresult1.getString("dateofbirth")+"</td><td>"+myresult1.getString("email")+
                                       "</td><td>"+myresult1.getString("tboard")+"-"+myresult1.getString("tyear")+"-"+myresult1.getString("tmarks")+"</td><td>"+myresult1.getString("twboard")+"-"+myresult1.getString("twyear")+"-"+myresult1.getString("twmarks")+"</td><td>"+myresult1.getString("dboard")+"-"+myresult1.getString("dyear")+"-"+myresult1.getString("dmarks")+"</td><td>"+myresult1.getString("bmarks")+"</td><td>"+myresult1.getString("backlogs")+"</td>");
                                 
                                        }while(myresult1.next());
                            out.print("<form name='second'><input type='submit' method='post' class='fadeInDown' name='excel'  "
                        + " placeholder='Search' style='color:black;height:50px:border:0px' value='Download Excel File'"+"></form><br><br>");
                            out.print("</tbody></table>");
                   
                       
} 
                        else
                                                    {
                                                        out.print("<p class='alert agileits w3layouts alert-warning'>No records</p>");
                                                    }
                    }
                        catch(Exception e)
                                {
                                out.print("Error in query hjjh");
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
     }
              
       if(request.getParameter("excel")!=null)
              {
                   String content=name1+"-"+date2.getTime() +".xls"; 
                         String filename2= config.getServletContext().getRealPath("/") + "/excel/" +session.getAttribute("search")+"-"+date2.getTime() +".xls" ;  
                  try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
                  
                        
                            try
                    {
                        
                        String b="Select * from emstudenttable1,branch,selectionresult,otherstudentinfo where " 
                                + "emstudenttable1.bid=branch.bid and "
                                + "selectionresult.email=emstudenttable1.email and otherstudentinfo.email=emstudenttable1.email and name like ?";
                        PreparedStatement mystatement1=myconnection.prepareStatement(b);
                       // mystatement1.setString(1, session.getAttribute("tid").toString());
                         mystatement1.setString(1,"%"+session.getAttribute("search")+"%"); 
                      //      mystatement1.setString(2, session.getAttribute("tid").toString());
                        ResultSet myresult1=mystatement1.executeQuery();
                      
                        if(myresult1.next())
                        {
                            
                          
                                ResultSet myset=mystatement1.executeQuery();
                                 HSSFWorkbook hwb = new HSSFWorkbook();
                                HSSFSheet sheet = hwb.createSheet("new sheet"); 
                                 HSSFRow rowhead = sheet.createRow((short)2);
                               for(int i=0;i<=255;i++)
                                rowhead.createCell((short) i).setCellValue("SNo"+i);
                                

int index=3;
int sno=0;
String name="";
while(myset.next()) 
{
sno++;

HSSFRow row = sheet.createRow((short)index);
row.createCell((short) 0).setCellValue(sno);
row.createCell((short) 1).setCellValue(myset.getString("rollno"));
row.createCell((short) 2).setCellValue(myset.getString("name"));
row.createCell((short) 3).setCellValue(myset.getString("course_name"));
row.createCell((short) 4).setCellValue(myset.getString("branch_name"));
row.createCell((short) 5).setCellValue(myset.getString("semester"));
row.createCell((short) 6).setCellValue(myset.getString("gender"));
row.createCell((short) 7).setCellValue(myset.getString("email"));
row.createCell((short) 8).setCellValue(myset.getString("fname"));
row.createCell((short) 9).setCellValue(myset.getString("dateofbirth"));
row.createCell((short) 10).setCellValue(myset.getString("tboard"));
row.createCell((short) 11).setCellValue(myset.getString("tmarks"));
row.createCell((short) 12).setCellValue(myset.getString("tyear"));
row.createCell((short) 13).setCellValue(myset.getString("twboard"));
row.createCell((short) 14).setCellValue(myset.getString("twmarks"));
row.createCell((short) 15).setCellValue(myset.getString("twyear"));
row.createCell((short) 16).setCellValue(myset.getString("dboard"));
row.createCell((short) 17).setCellValue(myset.getString("dmarks"));
row.createCell((short) 18).setCellValue(myset.getString("dyear"));
row.createCell((short) 19).setCellValue(myset.getString("bmarks"));
row.createCell((short) 20).setCellValue(myset.getString("backlogs"));
row.createCell((short) 21).setCellValue(myset.getString("options"));
row.createCell((short) 21).setCellValue(myset.getString("ans"));
index++;
}
File fileOut = new File(filename2);
hwb.write(fileOut);
 fileOut.setExecutable(true,true);
        fileOut.setReadable(true,false);
       fileOut.setWritable(true,false);
out.println("<b>Your excel file has been generated.</b><a href='excel/"+content+"'>Click Here to Download</a>");                            

              }
                    }  catch(Exception e)
                                {
                                out.print("Error in query hjjh"+e.getMessage());
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
              }%>
     
     
     
     
           
   <%
                 if(request.getParameter("submita")!=null)
                    {
                        
                        String am[]=request.getParameter("course").split(","); 
                          int record_per_page=80,offset,pageno;
            double totalpages,totalrecords=0;   String aa1="";
try
{
   Class.forName("com.mysql.jdbc.Driver");
   Connection myconnection=DriverManager.getConnection(PATH+PLACE,USERNAME,PASSWORD);
   try
   {
    String a="Select count(*) from emstudenttable1,branch,selectionresult,otherstudentinfo where "
                                + "emstudenttable1.bid=branch.bid and course_name=? and branch_name=? and semester=? and "
                                + "selectionresult.email=emstudenttable1.email and otherstudentinfo.email=emstudenttable1.email and selectionresult.seid=?";
    PreparedStatement mystatement=myconnection.prepareStatement(a);
         mystatement.setString(1,am[1]);
         mystatement.setString(3,request.getParameter("sem"));
         mystatement.setString(2,request.getParameter("branch"));
         mystatement.setString(4,request.getParameter("sele"));
         session.setAttribute("course", am[1]);
         session.setAttribute("branch",request.getParameter("branch"));
         session.setAttribute("Sele", request.getParameter("sele"));
         session.setAttribute("sem", request.getParameter("sem"));
  ResultSet myresult=mystatement.executeQuery();

    if(myresult.next())
    {
        
            totalrecords=myresult.getInt(1);
    }
    
    
      if(request.getParameter("pageno")!=null)
      {
                   
          pageno=Integer.parseInt(request.getParameter("pageno"));
         
      }
      else
      {
          pageno=1;
      }
      offset=(pageno-1)*record_per_page;
     
                            
                           
                                if(am[1].equalsIgnoreCase("Btech"))
                                {
                                       try
                    {
                       
                      String b2="Select * from emstudenttable1,branch,selectionresult,otherstudentinfo where "
                                + "emstudenttable1.bid=branch.bid and course_name=? and branch_name=? and semester=? and "
                                + "selectionresult.email=emstudenttable1.email and otherstudentinfo.email=emstudenttable1.email and  selectionresult.seid=? limit " + offset + "," + record_per_page;
                        PreparedStatement mystatement2=myconnection.prepareStatement(b2);
                      mystatement2.setString(1,am[1]); 
                         mystatement2.setString(3,request.getParameter("sem"));
                           mystatement2.setString(2,request.getParameter("branch"));
                                     mystatement2.setString(4,request.getParameter("sele"));

                        ResultSet myresult1=mystatement2.executeQuery();
                          
                        if(myresult1.next())
                        {
                           out.print("<table class='table table-striped' width='100%' cellpadding='20px' border='0px'><thead><tr class='info'><th>Image</th><th>R.No.</th><th>Full_Name</th>"
                                   + "<th>Course</th><th>Branch</th><th>Sem</th><th>Gender</th><th>Father's_Name</th><th>Option</th><th>Date_of_Birth</th><th>Email</th><th><h2 align='center'>Tenth</h2><br>Board_P.Year_Marks</th><th><h2 align='center'>Twelvth</h2><br>Board_P.Year_Marks</th><th><h2 align='center'>Diploma</h2><br>Board_P.Year_Marks</th><th><h2 align='center'>Btech</h2><br>Marks</th><th>Backlogs</th></tr>");
                            do
                            { out.print("<tbody><tr> <td>" +"<img src=studentimages/" + myresult1.getString("imagename") + " width='100px' height='100px'>"+"</td><td>" +myresult1.getString("rollno")+
                                             "</td><td>"+myresult1.getString("name")+"</td><td>"+myresult1.getString("course_name")+"</td><td>"+myresult1.getString("branch_name")+"</td><td>"+myresult1.getString("semester")+"</td>"+
                                        "<td>"+myresult1.getString("gender").charAt(0)+"</td><td>"+myresult1.getString("fname")+"</td><td>"+myresult1.getString("options")+"-"+myresult1.getString("ans")+"</td><td>"+myresult1.getString("dateofbirth")+"</td><td>"+myresult1.getString("email")+
                                       "</td><td>"+myresult1.getString("tboard")+"-"+myresult1.getString("tyear")+"-"+myresult1.getString("tmarks")+"</td><td>"+myresult1.getString("twboard")+"-"+myresult1.getString("twyear")+"-"+myresult1.getString("twmarks")+"</td><td>"+myresult1.getString("dboard")+"-"+myresult1.getString("dyear")+"-"+myresult1.getString("dmarks")+"</td><td>"+myresult1.getString("bmarks")+"</td><td>"+myresult1.getString("backlogs")+"</td>");
                              }while(myresult1.next());
                            out.print("</tbody></table>");
                            String content2=session.getAttribute("course").toString()+"-"+session.getAttribute("branch").toString()+"-"+session.getAttribute("sem").toString()+"-Option-"+session.getAttribute("Sele").toString()+"-"+date2.getTime() +".xls";
                            
                         String filename21= config.getServletContext().getRealPath("/") + "/excel/" +session.getAttribute("course").toString()+"-"+session.getAttribute("branch").toString()+"-"+session.getAttribute("sem").toString()+"-Option-"+session.getAttribute("Sele").toString()+"-"+date2.getTime() +".xls" ; 
  
                                 ResultSet myset=mystatement2.executeQuery(); 
                                 HSSFWorkbook hwb = new HSSFWorkbook();
                                HSSFSheet sheet = hwb.createSheet("new sheet"); 

                                HSSFRow rowhead = sheet.createRow((short)2);
                               // for(int i=0;i<24;i++)
                                rowhead.createCell((short) 0).setCellValue("SNo.");
                                rowhead.createCell((short) 1).setCellValue("Roll No.");
                                rowhead.createCell((short) 2).setCellValue("Name");
                                rowhead.createCell((short) 3).setCellValue("Course Name");
                                rowhead.createCell((short) 4).setCellValue("Branch");
                                rowhead.createCell((short) 5).setCellValue("Semester");
                                rowhead.createCell((short) 6).setCellValue("Gender");
                                rowhead.createCell((short) 7).setCellValue("Email");
                                rowhead.createCell((short) 8).setCellValue("Address");
                                rowhead.createCell((short) 9).setCellValue("Contact");
                                rowhead.createCell((short) 10).setCellValue("Father Name");
                                rowhead.createCell((short) 11).setCellValue("Date of Birth");
                                rowhead.createCell((short) 12).setCellValue("10th Board");
                                rowhead.createCell((short) 13).setCellValue("10th Marks");
                                rowhead.createCell((short) 14).setCellValue("10th Passing Year");
                                rowhead.createCell((short) 15).setCellValue("12th Board");
                                rowhead.createCell((short) 16).setCellValue("12th Marks");
                                
                                rowhead.createCell((short) 17).setCellValue("12th Passing Year");
                                rowhead.createCell((short) 18).setCellValue("Diploma");
                                rowhead.createCell((short) 19).setCellValue("Diploma Marks");
                                rowhead.createCell((short) 20).setCellValue("Diploma Passing Year");
                                rowhead.createCell((short) 21).setCellValue("Degree Marks");
                                rowhead.createCell((short) 22).setCellValue("Backlogs");
                                rowhead.createCell((short) 23).setCellValue("Option");
                                rowhead.createCell((short) 24).setCellValue("Answer");

int index=3;
int sno=0;
String name="";
while(myset.next()) 
{
sno++;

HSSFRow row = sheet.createRow((short)index);
row.createCell((short) 0).setCellValue(sno);
row.createCell((short) 1).setCellValue(myset.getString("rollno"));
row.createCell((short) 2).setCellValue(myset.getString("name"));
row.createCell((short) 3).setCellValue(myset.getString("course_name"));
row.createCell((short) 4).setCellValue(myset.getString("branch_name"));
row.createCell((short) 5).setCellValue(myset.getString("semester"));
row.createCell((short) 6).setCellValue(myset.getString("gender"));
row.createCell((short) 7).setCellValue(myset.getString("email"));
row.createCell((short) 8).setCellValue(myset.getString("address"));
row.createCell((short) 9).setCellValue(myset.getString("contact"));
row.createCell((short) 10).setCellValue(myset.getString("fname"));
row.createCell((short) 11).setCellValue(myset.getString("dateofbirth"));
row.createCell((short) 12).setCellValue(myset.getString("tboard"));
row.createCell((short) 13).setCellValue(myset.getString("tmarks"));
row.createCell((short) 14).setCellValue(myset.getString("tyear"));
row.createCell((short) 15).setCellValue(myset.getString("twboard"));
row.createCell((short) 16).setCellValue(myset.getString("twmarks"));
row.createCell((short) 17).setCellValue(myset.getString("twyear"));
row.createCell((short) 18).setCellValue(myset.getString("dboard"));
row.createCell((short) 19).setCellValue(myset.getString("dmarks"));
row.createCell((short) 20).setCellValue(myset.getString("dyear"));
row.createCell((short) 21).setCellValue(myset.getString("bmarks"));
row.createCell((short) 22).setCellValue(myset.getString("backlogs"));
if(myset.getString("options").equals("0"))
{
row.createCell((short) 23).setCellValue("Placement"); 
row.createCell((short) 24).setCellValue("");
}
else
{
row.createCell((short) 23).setCellValue(myset.getString("options"));
row.createCell((short) 24).setCellValue(myset.getString("ans"));
}
index++;
}
File fileOut = new File (filename21);
hwb.write(fileOut);
 fileOut.setExecutable(true,true);
        fileOut.setReadable(true,false);
       fileOut.setWritable(true,false);

out.println("<b>Your excel file has been generated.</b><a href='excel/"+content2+"'>Click Here to Download</a>");                            
                            totalpages=Math.ceil(totalrecords/record_per_page);
                            if(totalpages>1)
                            {
                                out.print("<table width='20%' align='center' cellspacing='5px' cellpadding='5px'><tr>");
                                for(int i=1;i<=totalpages;i++)
                                {
                                if(i==pageno)
                                {
                                    out.print("<td><font color='black'>"+i+"</font></td>");
                                }
                                else
                                {
                                     out.print("<td><a href=viewstudents.jsp?pageno="+i+"&sele="+request.getParameter("sele")+"&course=4%2CBtech"+"&branch="+request.getParameter("branch")+"&sem="+request.getParameter("sem")+"&submita=Search>"+i+"</a></td>");
                               }
                            }
                                out.print("</table>");
                            }
                }
                       else
                                                    {
                                                        out.print("<p class='alert agileits w3layouts alert-warning'>No records</p>");
                                                    }
                    }
                                       catch(Exception e)
                                       {
                                           out.print("Error"+e.getMessage()); 
                                       }
                                }
                                else if(am[1].equalsIgnoreCase("MCA"))
                                {
                                try
                    {
                       
                      String b2="Select * from emstudenttable1,branch,selectionresult,otherstudentinfo,mtechstudentinfo where "
                                + "emstudenttable1.bid=branch.bid and course_name=? and branch_name=? and semester=? and "
                                + "selectionresult.email=emstudenttable1.email and otherstudentinfo.id=mtechstudentinfo.id and otherstudentinfo.email=emstudenttable1.email and  selectionresult.seid=? limit " + offset + "," + record_per_page;
                        PreparedStatement mystatement2=myconnection.prepareStatement(b2);
                      mystatement2.setString(1,am[1]); 
                         mystatement2.setString(3,request.getParameter("sem"));
                           mystatement2.setString(2,request.getParameter("branch"));
                                     mystatement2.setString(4,request.getParameter("sele"));

                        ResultSet myresult1=mystatement2.executeQuery();
                        if(myresult1.next())
                        {
                              
                         out.print("<table class='table table-striped' width='100%' cellpadding='20px' border='0px'><thead><tr class='info'><th>Image</th><th>R.No.</th><th>Full_Name</th>"
                   + "<th>Course</th><th>Branch</th><th>Sem</th><th>Gender</th><th>Father's_Name</th><th>Date_of_Birth</th><th>Email</th><th><h2 align='center'>Tenth</h2><br>Board_P.Year_Marks</th><th><h2 align='center'>Twelvth</h2><br>Board_P.Year_Marks</th><th><h2 align='center'>Diploma</h2><br>Board_P.Year_Marks</th><th><h2 align='center'>Btech</h2><br>Branch_College_Marks_Year</th><th>MCA Marks<th>Backlogs</th></tr>");
                          
                              String contentt=session.getAttribute("course").toString()+"-"+session.getAttribute("branch").toString()+"-"+session.getAttribute("sem").toString()+"-Option-"+session.getAttribute("Sele").toString()+"-"+date2.getTime() +".xls";
                         String filename22= config.getServletContext().getRealPath("/") + "/excel/" +session.getAttribute("course").toString()+"-"+session.getAttribute("branch").toString()+"-"+session.getAttribute("sem").toString()+"-Option-"+session.getAttribute("Sele").toString()+"-"+date2.getTime() +".xls" ; 
  
                                    HSSFWorkbook hwb = new HSSFWorkbook();
                                HSSFSheet sheet = hwb.createSheet("new sheet"); 

                                HSSFRow rowhead = sheet.createRow((short)2);
                           //  for(int i=0;i<255;i++)
                                rowhead.createCell((short) 0).setCellValue("SNo.");
                                rowhead.createCell((short) 1).setCellValue("Roll No.");
                                rowhead.createCell((short) 2).setCellValue("Name");
                                rowhead.createCell((short) 3).setCellValue("Course Name");
                                rowhead.createCell((short) 4).setCellValue("Branch");
                                rowhead.createCell((short) 5).setCellValue("Semester");
                                rowhead.createCell((short) 6).setCellValue("Gender");
                                rowhead.createCell((short) 7).setCellValue("Email");
                                rowhead.createCell((short) 8).setCellValue("Address");
                                rowhead.createCell((short) 9).setCellValue("Contact");
                                rowhead.createCell((short) 10).setCellValue("Father Name");
                                rowhead.createCell((short) 11).setCellValue("Date of Birth");
                                rowhead.createCell((short) 12).setCellValue("10th Board");
                                rowhead.createCell((short) 13).setCellValue("10th Marks");
                                rowhead.createCell((short) 14).setCellValue("10th Passing Year");
                                rowhead.createCell((short) 15).setCellValue("12th Board");
                                rowhead.createCell((short) 16).setCellValue("12th Marks");
                                
                                rowhead.createCell((short) 17).setCellValue("12th Passing Year");
                                rowhead.createCell((short) 18).setCellValue("Diploma");
                                rowhead.createCell((short) 19).setCellValue("Diploma Marks");
                                rowhead.createCell((short) 20).setCellValue("Diploma Passing Year");
                                rowhead.createCell((short) 21).setCellValue("B Branch");
                                rowhead.createCell((short) 22).setCellValue("College");
                                rowhead.createCell((short) 23).setCellValue("Marks");
                                rowhead.createCell((short) 24).setCellValue("Year");
                                rowhead.createCell((short) 25).setCellValue("Degree Marks");
                                rowhead.createCell((short) 26).setCellValue("Backlogs");
                                rowhead.createCell((short) 27).setCellValue("Option");
                                rowhead.createCell((short) 28).setCellValue("Ans");
                                 

int index=3;
int sno=0;
String name=""; 
                                 do
                            { 
                   out.print("<tbody><tr> <td>" +"<img src=studentimages/" + myresult1.getString("imagename") + " width='100px' height='100px'>"+"</td><td>" +myresult1.getString("rollno")+
                                             "</td><td>"+myresult1.getString("name")+"</td><td>"+myresult1.getString("course_name")+"</td><td>"+myresult1.getString("branch_name")+"</td><td>"+myresult1.getString("semester")+"</td>"+
                                         "<td>"+myresult1.getString("gender").charAt(0)+"</td><td>"+myresult1.getString("fname")+"</td><td>"+myresult1.getString("dateofbirth")+"</td><td>"+myresult1.getString("email")+
                                       "</td><td>"+myresult1.getString("tboard")+"-"+myresult1.getString("tyear")+"-"+myresult1.getString("tmarks")+"</td><td>"+myresult1.getString("twboard")+"-"+myresult1.getString("twyear")+"-"+myresult1.getString("twmarks")+"</td><td>"+myresult1.getString("dboard")+"-"+myresult1.getString("dyear")+"-"+myresult1.getString("dmarks")+"</td>"
                                               + "<td>"+myresult1.getString("bbranch")+"_"+myresult1.getString("college")+"_"+myresult1.getString("bbmarks")+"_"+myresult1.getString("byear")+"</td><td>"+myresult1.getString("bmarks")+"</td><td>"+myresult1.getString("backlogs")+"</td>");
                       
                            
sno++;

HSSFRow row = sheet.createRow((short)index);
row.createCell((short) 0).setCellValue(sno);
row.createCell((short) 1).setCellValue(myresult1.getString("rollno"));
row.createCell((short) 2).setCellValue(myresult1.getString("name"));
row.createCell((short) 3).setCellValue(myresult1.getString("course_name"));
row.createCell((short) 4).setCellValue(myresult1.getString("branch_name"));
row.createCell((short) 5).setCellValue(myresult1.getString("semester"));
row.createCell((short) 6).setCellValue(myresult1.getString("gender"));
row.createCell((short) 7).setCellValue(myresult1.getString("email"));
row.createCell((short) 8).setCellValue(myresult1.getString("address"));
row.createCell((short) 9).setCellValue(myresult1.getString("contact"));
row.createCell((short) 10).setCellValue(myresult1.getString("fname"));
row.createCell((short) 11).setCellValue(myresult1.getString("dateofbirth"));
row.createCell((short) 12).setCellValue(myresult1.getString("tboard"));
row.createCell((short) 13).setCellValue(myresult1.getString("tmarks"));
row.createCell((short) 14).setCellValue(myresult1.getString("tyear"));
row.createCell((short) 15).setCellValue(myresult1.getString("twboard"));
row.createCell((short) 16).setCellValue(myresult1.getString("twmarks"));
row.createCell((short) 17).setCellValue(myresult1.getString("twyear"));
row.createCell((short) 18).setCellValue(myresult1.getString("dboard"));
row.createCell((short) 19).setCellValue(myresult1.getString("dmarks"));
row.createCell((short) 20).setCellValue(myresult1.getString("dyear"));
row.createCell((short) 21).setCellValue(myresult1.getString("bbranch"));
row.createCell((short) 22).setCellValue(myresult1.getString("college"));
row.createCell((short) 23).setCellValue(myresult1.getString("bbmarks"));
row.createCell((short) 24).setCellValue(myresult1.getString("byear"));
row.createCell((short) 25).setCellValue(myresult1.getString("bmarks"));
row.createCell((short) 26).setCellValue(myresult1.getString("backlogs"));
if(myresult1.getString("options").equals("0"))
{
    row.createCell((short) 27).setCellValue("Placements");
row.createCell((short) 28).setCellValue("");
}
else
{
row.createCell((short) 27).setCellValue(myresult1.getString("options"));
row.createCell((short) 28).setCellValue(myresult1.getString("ans"));
}

index++;

                            }while(myresult1.next());
                           
                     File fileOut = new File(filename22); 
                     hwb.write(fileOut);
 fileOut.setExecutable(true,true);
        fileOut.setReadable(true,false);
       fileOut.setWritable(true,false);
out.println("<b>Your excel file has been generated.</b><a href='excel/"+contentt+"'>Click Here to Download</a>");                            
                            
                        } 
                            out.print("</tbody></table>");
                           
                            
                            totalpages=Math.ceil(totalrecords/record_per_page);
                            if(totalpages>1)
                            {
                                out.print("<table width='20%' align='center' cellspacing='5px' cellpadding='5px'><tr>");
                                for(int i=1;i<=totalpages;i++)
                                {
                                if(i==pageno)
                                {
                                    out.print("<td><font color='black'>"+i+"</font></td>");
                                }
                                else
                                {
                                     out.print("<td><a href=viewstudents.jsp?pageno="+i+"&sele="+request.getParameter("sele")+"&course=4%2CMBA"+"&branch="+request.getParameter("branch")+"&sem="+request.getParameter("sem")+"&submita=Search>"+i+"</a></td>");
                               }
                            }
                                out.print("</table>");
                            }}
                                catch(Exception e)
                                {
                                    out.print("Error"+e.getMessage());
                                }
                                
                                }
                        else if(am[1].equalsIgnoreCase("MBA"))
                                {
                                try
                    {
                       
                      String b2="Select * from emstudenttable1,branch,selectionresult,otherstudentinfo,mbastudentinfo where "
                                + "emstudenttable1.bid=branch.bid and course_name=? and branch_name=? and semester=? and "
                                + "selectionresult.email=emstudenttable1.email and otherstudentinfo.id=mbastudentinfo.id and otherstudentinfo.email=emstudenttable1.email and  selectionresult.seid=? limit " + offset + "," + record_per_page;
                        PreparedStatement mystatement2=myconnection.prepareStatement(b2);
                      mystatement2.setString(1,am[1]); 
                         mystatement2.setString(3,request.getParameter("sem"));
                           mystatement2.setString(2,request.getParameter("branch"));
                                     mystatement2.setString(4,request.getParameter("sele"));

                        ResultSet myresult1=mystatement2.executeQuery();
                        if(myresult1.next())
                        {
                              
                           out.print("<table class='table table-striped' width='100%' cellpadding='20px' border='0px'><thead><tr class='info'><th>Image</th><th>R.No.</th><th>Full_Name</th>"
                                   + "<th>Course</th><th>Branch</th><th>Sem</th><th>Gender</th><th>Father's_Name</th><th>Date_of_Birth</th><th>Email</th><th><h2 align='center'>Tenth</h2><br>Board_P.Year_Marks</th><th><h2 align='center'>Twelvth</h2><br>Board_P.Year_Marks</th><th><h2 align='center'>Diploma</h2><br>Board_P.Year_Marks</th><th><h2 align='center'>Graduation</h2><br>Name_College_Marks_Year</th><th>MBA Marks<th>Backlogs</th></tr>");
                           
                              String contenttt=session.getAttribute("course").toString()+"-"+session.getAttribute("branch").toString()+"-"+session.getAttribute("sem").toString()+"-Option-"+session.getAttribute("Sele").toString()+"-"+date2.getTime() +".xls";
                         String filename222= config.getServletContext().getRealPath("/") + "/excel/" +session.getAttribute("course").toString()+"-"+session.getAttribute("branch").toString()+"-"+session.getAttribute("sem").toString()+"-Option-"+session.getAttribute("Sele").toString()+"-"+date2.getTime() +".xls" ; 
  
                           HSSFWorkbook hwb = new HSSFWorkbook();
                                HSSFSheet sheet = hwb.createSheet("new sheet"); 

                                HSSFRow rowhead = sheet.createRow((short)2);
                               // for(int i=0;i<255;i++)
                              rowhead.createCell((short) 0).setCellValue("SNo.");
                                rowhead.createCell((short) 1).setCellValue("Roll No.");
                                rowhead.createCell((short) 2).setCellValue("Name");
                                rowhead.createCell((short) 3).setCellValue("Course Name");
                                rowhead.createCell((short) 4).setCellValue("Branch");
                                rowhead.createCell((short) 5).setCellValue("Semester");
                                rowhead.createCell((short) 6).setCellValue("Gender");
                                rowhead.createCell((short) 7).setCellValue("Email");
                                rowhead.createCell((short) 8).setCellValue("Address");
                                rowhead.createCell((short) 9).setCellValue("Contact");
                                rowhead.createCell((short) 10).setCellValue("Father Name");
                                rowhead.createCell((short) 11).setCellValue("Date of Birth");
                                rowhead.createCell((short) 12).setCellValue("10th Board");
                                rowhead.createCell((short) 13).setCellValue("10th Marks");
                                rowhead.createCell((short) 14).setCellValue("10th Passing Year");
                                rowhead.createCell((short) 15).setCellValue("12th Board");
                                rowhead.createCell((short) 16).setCellValue("12th Marks");
                                
                                rowhead.createCell((short) 17).setCellValue("12th Passing Year");
                                rowhead.createCell((short) 18).setCellValue("Diploma");
                                rowhead.createCell((short) 19).setCellValue("Diploma Marks");
                                rowhead.createCell((short) 20).setCellValue("Diploma Passing Year");
                                rowhead.createCell((short) 21).setCellValue("Graduation");
                                rowhead.createCell((short) 22).setCellValue("College");
                                rowhead.createCell((short) 23).setCellValue("Marks");
                                rowhead.createCell((short) 24).setCellValue("Year");
                                rowhead.createCell((short) 25).setCellValue("Degree Marks");
                                rowhead.createCell((short) 26).setCellValue("Backlogs");
                                rowhead.createCell((short) 27).setCellValue("Option");
                                rowhead.createCell((short) 28).setCellValue("Ans");
                                
                                

int index=3;
int sno=0;
String name=""; 
                           do
                            { 
                       out.print("<tbody><tr> <td>" +"<img src=studentimages/" + myresult1.getString("imagename") + " width='100px' height='100px'>"+"</td><td>" +myresult1.getString("rollno")+
                                             "</td><td>"+myresult1.getString("name")+"</td><td>"+myresult1.getString("course_name")+"</td><td>"+myresult1.getString("branch_name")+"</td><td>"+myresult1.getString("semester")+"</td>"+
                                        "<td>"+myresult1.getString("gender").charAt(0)+"</td><td>"+myresult1.getString("fname")+"</td><td>"+myresult1.getString("dateofbirth")+"</td><td>"+myresult1.getString("email")+
                                       "</td><td>"+myresult1.getString("tboard")+"-"+myresult1.getString("tyear")+"-"+myresult1.getString("tmarks")+"</td><td>"+myresult1.getString("twboard")+"-"+myresult1.getString("twyear")+"-"+myresult1.getString("twmarks")+"</td><td>"+myresult1.getString("dboard")+"-"+myresult1.getString("dyear")+"-"+myresult1.getString("dmarks")+"</td>"
                                               + "<td>"+myresult1.getString("gradname")+"_"+myresult1.getString("collegemba")+"_"+myresult1.getString("gmarks")+"_"+myresult1.getString("gradpy")+"</td><td>"+myresult1.getString("bmarks")+"</td><td>"+myresult1.getString("backlogs")+"</td>");
                      
                                


//     String b21="Select * from mbastudentinfo where "
//                                + "email=?";
//                               PreparedStatement mystatement21=myconnection.prepareStatement(b21);
//                      mystatement21.setString(1,myresult1.getString("email")); 
//                        ResultSet myresult11=mystatement21.executeQuery();
//                        if(myresult11.next())
//                        { 
                
sno++;
HSSFRow row = sheet.createRow((short)index);
row.createCell((short) 0).setCellValue(sno);
row.createCell((short) 1).setCellValue(myresult1.getString("rollno"));
row.createCell((short) 2).setCellValue(myresult1.getString("name"));
row.createCell((short) 3).setCellValue(myresult1.getString("course_name"));
row.createCell((short) 4).setCellValue(myresult1.getString("branch_name"));
row.createCell((short) 5).setCellValue(myresult1.getString("semester"));
row.createCell((short) 6).setCellValue(myresult1.getString("gender"));
row.createCell((short) 7).setCellValue(myresult1.getString("email"));
row.createCell((short) 8).setCellValue(myresult1.getString("address"));
row.createCell((short) 9).setCellValue(myresult1.getString("contact"));
row.createCell((short) 10).setCellValue(myresult1.getString("fname"));
row.createCell((short) 11).setCellValue(myresult1.getString("dateofbirth"));
row.createCell((short) 12).setCellValue(myresult1.getString("tboard"));
row.createCell((short) 13).setCellValue(myresult1.getString("tmarks"));
row.createCell((short) 14).setCellValue(myresult1.getString("tyear"));
row.createCell((short) 15).setCellValue(myresult1.getString("twboard"));
row.createCell((short) 16).setCellValue(myresult1.getString("twmarks"));
row.createCell((short) 17).setCellValue(myresult1.getString("twyear"));
row.createCell((short) 18).setCellValue(myresult1.getString("dboard"));
row.createCell((short) 19).setCellValue(myresult1.getString("dmarks"));
row.createCell((short) 20).setCellValue(myresult1.getString("dyear"));
row.createCell((short) 21).setCellValue(myresult1.getString("gradname"));
row.createCell((short) 22).setCellValue(myresult1.getString("collegemba"));
row.createCell((short) 23).setCellValue(myresult1.getString("gmarks"));
row.createCell((short) 24).setCellValue(myresult1.getString("gradpy"));
row.createCell((short) 25).setCellValue(myresult1.getString("bmarks"));
row.createCell((short) 26).setCellValue(myresult1.getString("backlogs"));
if(myresult1.getString("options").equals("0"))
{
    row.createCell((short) 27).setCellValue("Placements");
row.createCell((short) 28).setCellValue("");  
}
else
{
row.createCell((short) 27).setCellValue(myresult1.getString("options"));
row.createCell((short) 28).setCellValue(myresult1.getString("ans"));
}

index++;
} while(myresult1.next()); 
                        
FileOutputStream fileOut = new FileOutputStream(filename222); 
hwb.write(fileOut); 
fileOut.close();
out.println("<b>Your excel file has been generated.</b><a href='excel/"+contenttt+"'>Click Here to Download</a>");                            
                            
                        } 
                            out.print("</tbody></table>");
                           
                            
                            totalpages=Math.ceil(totalrecords/record_per_page);
                            if(totalpages>1)
                            {
                                out.print("<table width='20%' align='center' cellspacing='5px' cellpadding='5px'><tr>");
                                for(int i=1;i<=totalpages;i++)
                                {
                                if(i==pageno)
                                {
                                    out.print("<td><font color='black'>"+i+"</font></td>");
                                }
                                else
                                {
                                     out.print("<td><a href=viewstudents.jsp?pageno="+i+"&sele="+request.getParameter("sele")+"&course=4%2CMBA"+"&branch="+request.getParameter("branch")+"&sem="+request.getParameter("sem")+"&submita=Search>"+i+"</a></td>");
                               }
                            }
                                out.print("</table>");
                            }}
                                catch(Exception e)
                                {
                                    out.print("Error"+e.getMessage());
                                }
                                
                                }
                        else
                                                    {
                                                        out.print("<p class='alert agileits w3layouts alert-warning'>No records</p>");
                                                    }
                    }
                                    
                                 catch(Exception e)
                                                {
                                                     out.println("Error in Query 2m m" + e.getMessage());
                                                }
                                                
                                             }
  catch(Exception e)
                                                {
                                                    out.println("Error in Query 3" + e.getMessage());
                                                }
                    }%>
                    
             
   
                
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