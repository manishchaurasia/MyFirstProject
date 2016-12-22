<%@page import="java.sql.*,java.io.*,java.math.*,java.lang.*"%>  
<%@page import=" java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet, java.sql.Statement"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


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
  String firstname=request.getParameter("firstname");
  String lastname=request.getParameter("lastname");
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
	<h1 align="center"><font color="Blue"><b>Account Information</font></b></h1>
	<hr color="blue"> 
	
	
	<%
try {  
	
    DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");
    Statement statement = connection.createStatement();  
    ResultSet resultset = statement.executeQuery("select * from accounts where username='"+username+"'");
	
    while(resultset.next())
 	{
    
    	
    %>
<form name="AccountInfo" action="StockBuddy_portfolioUpdate.jsp?username=<%=username%>" method="post" >   	
 <table align="center" border="1" width="500">
	   <tr>
       <td width="130" ><label for="firstname"><b>First Name<font color="Red">*</font></b></label>&nbsp;</td>
       <td width="400"><input type="text" id="firstname" name="firstname" value="<%=resultset.getString("firstname")%>" size="49" ></td>
       </tr>
	   
	   <tr>
       <td width="130" ><label for="lastname"><b>Last Name<font color="Red">*</font></b></label>&nbsp;</td>
       <td width="400"><input type="text" id="lastname" name="lastname" value="<%=resultset.getString("lastname")%>" size="49" ></td>
       </tr>
	   
	   <tr>
       <td width="130" ><label for="email"><b>Email Id<font color="Red">*</font></b></label>&nbsp;</td>
       <td width="400"><input type="text" id="email" name="email" value="<%=resultset.getString("email")%>" size="49" ></td>
       </tr>
	   <tr>
       <td width="130" ><label for="password"><b>Password<font color="Red">*</font></b></label>&nbsp;</td>
       <td width="400"><input type="password" id="password" name="password" value="<%=resultset.getString("password")%>" size="49" ></td>
       </tr>
	   
    </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit" value="Update Account">
</form> 

<input type="button" value="Delete your account" onclick="return validatepass();">	
<script>
function validatepass(){
alert("Are you sure you wanted to delete your account");
window.location.href = "StockBuddy_portfoliodelete.jsp?username=<%=username%>";
return true;
}
</script>
   
    <%
 	}
    statement.close();  
    connection.close();  
} 
catch (Exception e) 
{  
    //System.out.println("The exception raised is:" + e);  
}  
%>

	<hr color="blue"> 
	</body>
</html>	
