<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.io.*,java.math.*,java.lang.*"%>  
<%@page import=" java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet, java.sql.Statement"%> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
    <title>StockBuddy</title>
    <link id="theme" rel="stylesheet" type="text/css" href="style.css" title="theme" />
	<script type="text/javascript" language="javascript" src="js/addon.js"></script>
	<script type="text/javascript" language="javascript" src="js/custom.js"></script>
  </head>
  <body> 
  
  <%
  String username=request.getParameter("username");
  String fn=request.getParameter("firstname");
  String firstname = Character.toUpperCase(fn.charAt(0)) + fn.substring(1);
  String ln=request.getParameter("lastname");
  String lastname = Character.toUpperCase(ln.charAt(0)) + ln.substring(1);
  String userbalance="";
  
  try {  
         
      DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
      Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");
      Statement statement = connection.createStatement();  
			
		// to validate the authentic recharge
			
		ResultSet resultset = statement.executeQuery("select userbalance from user_balance where username='"+username+"'");
      
      while(resultset.next()){
    	  userbalance=resultset.getString(1);
      
      }
      
  }
  
  catch (Exception e) {  
      out.println("The exception raised is:" + e);  
  }

  
  
  
  %> 
  
  
    <!-- top wrapper -->  
    <div id="topWrapper"> 
      <div id="topBannerWrapper"> 
        <div id="topBanner"> 
          <div id="hmenuWrapper"> 
            <div id="hmenu"> 
              <ul>
                <li id="current" style="border:none">
                  <a href="StockBuddy_home.jsp?username=<%=username%>&firstname=<%=firstname%>&lastname=<%=lastname%>" shape="rect">Home</a>
                </li>
                <li>
                  <a href="StockBuddy_products.jsp?username=<%=username%>&firstname=<%=firstname%>&lastname=<%=lastname%>" shape="rect">Portfolio</a>
                </li>
                <li>
                  <a href="StockBuddy_myStock.jsp?username=<%=username%>&firstname=<%=firstname%>&lastname=<%=lastname%>" shape="rect">MyStock</a>
                </li>
                <li>
                <a href="StockBuddy_portfolio.jsp?username=<%=username%>&firstname=<%=firstname%>&lastname=<%=lastname%>" shape="rect"><%=username%></a>
                </li>
                <li>
                  <a href="StockBuddy_logout.jsp" shape="rect">Logout</a>
                </li>
              </ul> 
            </div> 
          </div> 
        </div> 
      </div>  
      </div>
<!-- Upper Part -->

<!-- Slider photo just below the stock buddy menu bar -->

<div id="topSlideshowWrapper"> 
        <div id="sliderContainer"> 
          <!-- YOUR SLIDESHOW IMAGES HERE (recommended size 920x300) -->  
          <div id="slider1"> 
            <ul id="slider1Content">
              <li class="slider1Image"> 
                <img src="images\banner.jpg" />  
                  <span class="bottom" style="display: inline;"> </span>
              </li>
              <li class="slider1Image" style="clear:both"></li>
            </ul>  
            <div id="sliderLeftMask"></div>  
            <div id="sliderRightMask"></div> 
          </div> 
        </div> 
</div>  
    <!-- end top wrapper -->
	
<div id="wrapper"> 
      <div id="container"> 
        <!--  content -->  
        <div id="content"> 
          <div style="margin-top:20px;"> 
            <div id="main"> 
              <h1><font color="Blue" size="6">Welcome <%=firstname%> <%=lastname%>..!!!</font></h1>
              <h2><font color="Red" size="4">Your Current Account Balance is :$ <%=userbalance%> </font></h2>  
              <p> 
                <p><font size="4">Stock buddy is a web based application for real time stock trading in which
					you can maintain your stock portfolio. Please <b>recharge</b> your account before using this application.You can sell/buy the stocks from <b>Portfolio</b> tab. Also you can contact us in case of any issues. Have a nice trading experience..!!! </font></p> 
					
					<br>
                
              <h1><font color="Blue" size="6">About Us</font></h1>  
              <p> 
                <p><font size="4">We are the leading Stock Management Company in the United States. We offer diversified range of services from viewing the stocks,Purchasing the stocks, selling the stocks etc</font></p> 
              
            </div>  
            <div id="sidebar"> 
              <div class="bloc rounded" style="margin-top:20px;"> 
                <h3><font color="Red">Recharge your Account</font></h3>  
                
<script>
function validate(){
var Amount=document.getElementById("amount").value;
var Code=document.getElementById("code").value;

if(Amount==""){
 alert("Enter Correct Amount!");
  return false;
} 
if(Code==""){
 alert("Enter Correct Code!");
  return false;
}
return true;
}
</script>				

				
<form name="login" action="StockBuddy_Recharge.jsp?username=<%=username%>&firstname=<%=firstname%>&lastname=<%=lastname%>" method="post" >  
    <table>
       <tr>
       <td width="100" ><label for="username"><b>Username:</b></label>&nbsp;</td>
       <td width="100"><input type="text" name="username" id="username" value="<%=username%>"></td>
       </tr>
	  
	   <tr>
       <td width="100"><label for="amount"><b>Amount :</b></label>&nbsp;</td>
       <td width="100"><input type="amount" name="amount" id="amount" value="" ></td>
	   </tr>
	   
	   <tr>
       <td width="100"><label for="code"><b>Code :</b></label>&nbsp;</td>
       <td width="100"><input type="password" name="code" id="code" value="" ></td>
	   </tr>
    </table> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" value="Recharge Now" onclick="return validate();" >   
</form>	



				
              </div>
<br>			  
              <div class="bloc rounded" style="margin-top:20px;"> 
                <h3>Contact Us</h3>  
                <p>Software Engineering Class : Group 8 <br>University of Illinois at Chicago<br> Chicago IL-60612</p> 
              </div> 
            </div> 
          </div>  
          

  </body>
</html>