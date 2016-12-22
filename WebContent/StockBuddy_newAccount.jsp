<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
    <title>StockBuddy</title>
    <link id="theme" rel="stylesheet" type="text/css" href="style.css" title="theme" />
<script type="text/javascript" language="javascript" src="js/addon.js"></script>
<script type="text/javascript" language="javascript" src="js/custom.js"></script>
  </head>
  <body> 
    <!-- top wrapper -->  
    <div id="topWrapper"> 
      <div id="topBannerWrapper"> 
        <div id="topBanner"> 
          <div id="hmenuWrapper"> 
            
          </div> 
        </div> 
      </div>  
<!-- Upper Part -->

<%
  String username=request.getParameter("username");
  String firstname=request.getParameter("firstname");
  String lastname=request.getParameter("lastname");
%>

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
              <h1><font color="Blue"><b>New User : Create your Account</font></b></h1>
			  <hr color="blue">
              
  <!--  New account form here------------------------------- -->
  
  
  
<form name="newaccount" action="StockBuddy_newAccountCreation.jsp" method="post" >  
    <table>
       <tr>
       <td width="130" ><label for="username"><b>Username<font color="Red">*</font></b></label>&nbsp;</td>
       <td width="500"><input type="text" id="username" name="username" size="49" ></td>
       </tr>
	  
	   <tr>
       <td width="130"><label for="password"><b>Password<font color="Red">*</font></b></label>&nbsp;</td>
       <td width="500"><input type="password" name="password" id="password" size="49"/></td>
	   </tr>
	   
	   <tr>
       <td width="130" ><label for="password2"><b>Repeat Password<font color="Red">*</font></b></label>&nbsp;</td>
       <td width="500"><input type="password" id="password2" name="password2" size="49" ></td>
       </tr>
	   
	   <tr>
       <td width="130" ><label for="firstname"><b>First Name<font color="Red">*</font></b></label>&nbsp;</td>
       <td width="500"><input type="text" id="firstname" name="firstname" size="49" style="text-transform: capitalize;"></td>
       </tr>
	   
	   <tr>
       <td width="130" ><label for="lastname"><b>Last Name<font color="Red">*</font></b></label>&nbsp;</td>
       <td width="500"><input type="text" id="lastname" name="lastname" size="49" style="text-transform: capitalize;"></td>
       </tr>
	   
	   <tr>
       <td width="130" ><label for="email"><b>Email Id<font color="Red">*</font></b></label>&nbsp;</td>
       <td width="500"><input type="text" id="email" name="email" size="49" ></td>
       </tr>
    </table><font color="Red"><b>*</b></font>Required
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
        <input type="submit" value="Create Account" onclick="return validatepass();">  

</form>

<hr color="blue">

<script>
function validatepass(){


var username=document.getElementById("username").value;
var password=document.getElementById("password").value;
var password2=document.getElementById("password2").value;
var firstname=document.getElementById("firstname").value;
var lastname=document.getElementById("lastname").value;
var email=document.getElementById("email").value;
var atpos = email.indexOf("@");
var dotpos = email.lastIndexOf(".");



if(username==""){
 alert("Enter Username!");
  return false;
} 
if(password==""){
 alert("Enter Password!");
  return false;
}
if(password!=password2){
 alert("Passwords do not match!");
  return false;
}
if(firstname==""){
 alert("Enter Firstname!");
  return false;
}
if(lastname==""){
 alert("Enter Lastname!");
  return false;
}
if(email==""){
 alert("Enter Email!");
 return false;
 }
    if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=email.length) {
        alert("Not a valid e-mail address");
        return false;
  
}

return true;
}
</script>

</body>
</html>