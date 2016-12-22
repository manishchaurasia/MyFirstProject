<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
    <title>StockBuddy</title>
    <link id="theme" rel="stylesheet" type="text/css" href="style.css" title="theme" />
	<script type="text/javascript" language="javascript" src="js/addon.js"></script>
	<script type="text/javascript" language="javascript" src="js/custom.js"></script>
	
	
	
	
	<script type='text/javascript'>
	
      function stock_quotes(o){
      var quotes = o.query.results.quote;
      var output = '';
      var no_quotes=quotes.length;
      for(var i=0;i<1;i++){
        var currentprice = quotes[i].LastTradePriceOnly;
        //output += "<h3>"+currentprice+"</h3>";
		output = currentprice;
		}
      
      document.getElementById('currentprice').value = output;  
    }
    </script>
	
	
  </head>
  <body> 
  
  <%
  String username=request.getParameter("username");
  String firstname=request.getParameter("firstname");
  String lastname=request.getParameter("lastname");
  %> 
  
  
  <%
         String stockname= request.getParameter("stockname");
         String quantity= request.getParameter("quantity");
  %>
  
    
<!-- Upper Part -->


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
	  
	 

<!-- Slider photo just below the stock buddy menu bar -->

<div id="topSlideshowWrapper"> 
        <div id="sliderContainer"> 
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
              <h1><font color="Blue"><b>Please enter the stock and quantity</font></b></h1>
			  <hr color="blue"> 
              
  <!--  login here------------------------------- -->


  
<form name="login" action="StockBuddy_calculateCurrentPrice.jsp?username=<%=username%>&firstname=<%=firstname%>&lastname=<%=lastname%>" method="post" >  
    <table>
       <tr>
       <td width="100" ><label for="stockname"><b>Stockname:</b></label>&nbsp;</td>
       <td width="500"><input type="text" name="stockname" id="stockname" value="<%=stockname%>" required></td>
       </tr>
	  
	   <tr>
       <td width="100"><label for="quantity"><b>Quantity :</b></label>&nbsp;</td>
       <td width="500"><input type="text" name="quantity" id="quantity" onkeypress="return isNumber(event)" value="<%=quantity%>" required></td>
	   
	   
	   <tr>
		<td width="100"><label for="currentprice"><b></b></label>&nbsp;</td>
        <td width="500"><input type="hidden" name="currentprice" id="currentprice" placeholder="currentprice" ></td>
       </tr>
	   
    </table>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        <input type="submit" value="Click here to buy...!! " > 
</form>  
		<hr color="blue">
		<h4><font color="Red"><b>Are you sure you wanted to purchase this stock?Click buy again to confirm it</b></font></h4>
		
		
		<script src='https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quote%20where%20symbol%20in%20(%22<%=stockname%>%22%2C%22AAPL%22%2C%22GOOG%22%2C%22MSFT%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=stock_quotes'>
		</script>
		
	
  </body>
</html>