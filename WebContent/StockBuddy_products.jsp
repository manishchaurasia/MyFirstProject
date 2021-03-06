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
	<h1 align="center"><font color="Blue"><b>Current Stock Prices</font></b></h1>
			  <hr color="blue"> 
	<script type='text/javascript' >
			function stock_quotes(o){
			var quotes = o.query.results.quote;
			var no_quotes=quotes.length;
			document.write('<table id="stock_table" border="1" cellpadding="5" align="center" class="stock_table">')
			document.write('<tr>')
			document.write('<th bgcolor="#013ADF"> Name </th><th bgcolor="#013ADF">Symbol </th><th bgcolor="#013ADF">Current Price</th><th bgcolor="#013ADF">Days Low</th><th bgcolor="#013ADF">Days High</th><th bgcolor="#013ADF">Years Low</th><th bgcolor="#013ADF">Years High</th><th bgcolor="#013ADF">Volume</th><th bgcolor="#013ADF">Market Cap</th>')
			document.write('</tr>')
			for(var i=0;i<no_quotes;i++){
			var name = quotes[i].Name;
			var symbol = quotes[i].symbol;
			var current_price = quotes[i].LastTradePriceOnly;
			var days_low = quotes[i].DaysLow;
			var days_high = quotes[i].DaysHigh;
			var year_low = quotes[i].YearLow;
			var year_high = quotes[i].YearHigh;
			var volume = quotes[i].Volume;
			var market_cap = quotes[i].MarketCapitalization;
			document.write('<tr>')
			document.write('<td>' + name + '</td><td> ' +symbol + '</td><td> '+current_price+'</td><td> '+days_low+'</td><td> '+days_high+'</td><td> '+year_low+'</td><td> '+year_high+'</td><td> '+volume+'</td><td> '+market_cap+'</td>')
			document.write('</tr>')
				}
			document.write('</table>')
			
			}
			
		</script>
	<script src='https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quote%20where%20symbol%20in%20(%22YHOO%22%2C%22AAPL%22%2C%22CME%22%2C%22GOOG%22%2C%22MSFT%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=stock_quotes'>
	</script> 
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	<button onclick="document.location.href='StockBuddy_buyStock.jsp?username=<%=username%>&firstname=<%=firstname%>&lastname=<%=lastname%>';">Buy Stock</button><button onclick="reloadPage()">Reload page</button> <button onclick="document.location.href='StockBuddy_customisedStockEntry.jsp?username=<%=username%>&firstname=<%=firstname%>&lastname=<%=lastname%>';">Customised Stock</button>
	<hr color="blue"> 
	</body>
</html>	
