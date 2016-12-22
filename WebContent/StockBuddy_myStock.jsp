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
	<h1 align="center"><font color="Blue"><b>List of Stocks you are having</font></b></h1>
	<hr color="blue"> 
	
	<table align="center" border="1" width="500">
			<tr><th width="250">STOCKNAME</th><th width="250">STOCKPRICE</th><th width="250">QUANTITY</th>
   </table>

	<%
try {  
	
    DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");
    Statement statement = connection.createStatement();  
    ResultSet resultset = statement.executeQuery("select * from user_account where username='"+username+"'");
	
    while(resultset.next())
 	{
    
    	
    %>
    	
 <table align="center" border="1" width="500">
			 <tr>
			 <td width="250"><%=resultset.getString("stockname")%></td>  <td width="250"><%=resultset.getString("stockprice")%> </td>
			 <td width="250"><%=resultset.getString("quantity")%>     </td>  
			 </tr>
</table>			  	
   
    <%
 	}
    statement.close();  
    connection.close();  
} 
catch (Exception e) 
{  
    System.out.println("The exception raised is:" + e);  
}  
%>

<script>
function exportToExcel()
{

	window.location.href="StockBuddy_sellStock.jsp?username="+username+"";
	
}

</script>

&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<button onclick="document.location.href='StockBuddy_sellStock.jsp?username=<%=username%>&firstname=<%=firstname%>&lastname=<%=lastname%>';">Sell Stock</button>
<button onclick="document.location.href='StockBuddy_export.jsp?username=<%=username%>';">Export To Excel</button>

	<hr color="blue"> 
	</body>
</html>	
