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
    <!-- top wrapper -->  
    <div id="topWrapper"> 
      <div id="topBannerWrapper"> 
        <div id="topBanner"> 
          <div id="hmenuWrapper"> 
            
          </div> 
        </div> 
      </div>  
<!-- Upper Part -->

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
              <h1><font color="Blue"><b>Enter Your Login Credentials</font></b></h1>
			  <hr color="blue"> 
			  <font size="3" color="red">Invalid username or password.  Please login again.</font>
              
  <!--  login here------------------------------- -->


<script>
function validate(){
var username=document.getElementById("username").value;
var password=document.getElementById("password").value;

if(username==""){
 alert("Enter Username!");
  return false;
} 
if(password==""){
 alert("Enter Password!");
  return false;
}
return true;
}
</script>


  
<form name="login" action="StockBuddy_logincheck.jsp" method="post" >  
    <table>
       <tr>
       <td width="100" ><label for="username"><b>UserName:</b></label>&nbsp;</td>
       <td width="500"><input type="text" name="username" placeholder="username" required></td>
       </tr>
	  
	   <tr>
       <td width="100"><label for="password"><b>Password :</b></label>&nbsp;</td>
       <td width="500"><input type="password" name="password" placeholder="password" required></td>
	   </tr>
    </table>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <input type="submit" value="Login" onclick="javascript:return validate();"> <a href="StockBuddy_newAccount.jsp"><font color="Blue">NewUser</font></a>  
</form>  
		<hr color="blue">

  </body>
</html>