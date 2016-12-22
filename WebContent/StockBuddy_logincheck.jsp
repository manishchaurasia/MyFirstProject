<%@page import="java.sql.*,java.io.*,java.math.*,java.lang.*"%>  
<%@page import=" java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet, java.sql.Statement"%>  
<%   
        try {  
            
        	String username=request.getParameter("username");
        	String password=request.getParameter("password");
        	String firstname="";
        	String lastname="";
        	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");
            Statement statement = connection.createStatement();  
            ResultSet resultset = statement.executeQuery("select firstname,lastname from accounts where username='"+username+"' and password='"+password+"'");
            int count=0;
            while(resultset.next()){
            	firstname=resultset.getString(1);
            	lastname=resultset.getString(2);
            count++;
           }
           if(count==1){
        	    //session.setAttribute("username",username);
              	response.sendRedirect("StockBuddy_home.jsp?username="+username+"&firstname="+firstname+"&lastname="+lastname+"");
        	    //response.sendRedirect("StockBuddy_home.jsp?firstname="+firstname+"&lastname="+lastname+"");
           }
           else{
        	   //out.println("bad login");
            response.sendRedirect("StockBuddy_badLogin.jsp?firstname="+firstname+"&lastname="+lastname+"");
           }
           statement.close();  
           connection.close();
        }
         
     catch (Exception e) {  
            out.println("The exception raised is:" + e);  
        }  
 
%>