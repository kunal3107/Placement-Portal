<%
    session.invalidate();
    Cookie mycookie1=new Cookie("adminname","0");
    mycookie1.setMaxAge(0);
     Cookie mycookie2=new Cookie("studentname","0");
     mycookie2.setMaxAge(0);
      Cookie mycookie3=new Cookie("studentmail","0");
      mycookie3.setMaxAge(0); 
      Cookie mycookie4=new Cookie("tname","0");
            mycookie4.setMaxAge(0); 

        Cookie mycookie5=new Cookie("tid","0");
              mycookie5.setMaxAge(0); 

                      Cookie mycookie6=new Cookie("eid","0");
              mycookie6.setMaxAge(0); 
        Cookie mycookie7=new Cookie("ename","0");
              mycookie7.setMaxAge(0); 

              
        response.addCookie(mycookie1);
        response.addCookie(mycookie2);
        response.addCookie(mycookie3);
        response.addCookie(mycookie4);
        response.addCookie(mycookie5);
         response.addCookie(mycookie6); response.addCookie(mycookie7);
         
response.sendRedirect("/");
%>