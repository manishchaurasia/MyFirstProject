<html>
	<head>
		<title>Live Stock Table</title>
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
                  <a href="StockBuddy_products.jsp?username=<%=username%>&firstname=<%=firstname%>&lastname=<%=lastname%>" shape="rect">Products</a>
                </li>
                <li>
                  <a href="StockBuddy_myStock.jsp?username=<%=username%>&firstname=<%=firstname%>&lastname=<%=lastname%>" shape="rect">MyStock</a>
                </li>
                <li>
                  <a href="#" shape="rect">News</a>
                </li>
                <li>
                  <a href="StockBuddy_logout.jsp" shape="rect">Logout</a>
                </li>
              </ul> 
            </div> 
          </div> 
        </div> 
      </div>
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
	
<!-- Create a input table for Customised stock entry -->	
	
	
	<h1><font color="Blue"><b>Select your Customized Stock To Watch</font></b></h1>
			  <hr color="blue">
	
	<form action="StockBuddy_customisedStockData.jsp?username=<%=username%>&firstname=<%=firstname%>&lastname=<%=lastname%>" method="post"> 
	Select Stock : <input type="text" id="stock1" name="stock1" value="YHOO" style="text-transform:uppercase;" onfocus="value=''"><br>
	Select Stock : <input type="text" id="stock2" name="stock2" value="AAPL" style="text-transform:uppercase;" onfocus="value=''"><br>
	Select Stock : <input type="text" id="stock3" name="stock3" value="CME" style="text-transform:uppercase;" onfocus="value=''"><br>
	Select Stock : <input type="text" id="stock4" name="stock4" value="GOOG" style="text-transform:uppercase;" onfocus="value=''"><br>
	Select Stock : <input type="text" id="stock5" name="stock5" value="MSFT" style="text-transform:uppercase;" onfocus="value=''"/><br>
	<br>
	<input type="submit" value="Submit Your Selection" />
	<hr color="blue">
	</form>
	</body>
</html>