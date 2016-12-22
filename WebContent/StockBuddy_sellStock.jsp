<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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


<script>
var stockname = document.getElementById('stockname').value;

function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}


function validate(){
var stockname=document.getElementById("stockname").value;
var quantity=document.getElementById("quantity").value;

if(stockname==""){
 alert("Enter the Stockname, you wanted to Sell!!");
  return false;
} 
if(quantity==""){
 alert("Enter the quantity!");
  return false;
}
return true;
}
</script>


  
<form name="login" action="StockBuddy_sellStockConfirm.jsp?username=<%=username%>&firstname=<%=firstname%>&lastname=<%=lastname%>" method="post" >  
    <table>
       <tr>
       <td width="100" ><label for="stockname"><b>Stockname:</b></label>&nbsp;</td>
       <td width="500"><input type="text" name="stockname" id="stockname" placeholder="stockname" required></td>
       </tr>
	  
	   <tr>
       <td width="100"><label for="quantity"><b>Quantity :</b></label>&nbsp;</td>
       <td width="500"><input type="text" name="quantity" id="quantity" onkeypress="return isNumber(event)" placeholder="quantity" required></td>
	   
		
       </tr>
	   
    </table>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        <input type="submit" value="Click here to Sell...!! " onclick="return validate();"> 
</form>  
		<hr color="blue">
	
  </body>
</html>