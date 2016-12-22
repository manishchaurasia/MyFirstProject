<%@page import="java.sql.*,java.io.*,java.math.*,java.lang.*"%>  
<%@page import=" java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet, java.sql.Statement"%> 
<%
String Amount= request.getParameter("amount");
String Code= request.getParameter("code");
String username=request.getParameter("username");
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String userbalance ="";

try {  
        	       	            
        DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");
        Statement statement = connection.createStatement();  
		ResultSet resultset = statement.executeQuery("select code,amount from Recharge where CODE='"+Code+"' and Amount='"+Amount+"'");
        int count=0;
        while(resultset.next()){
        Code=resultset.getString(1);
        Amount=resultset.getString(2);
        count++;
        }
        if(count==1)
		{
        	ResultSet resultset1 = statement.executeQuery("select userbalance from user_balance where username='"+username+"'");
			int count1=0;
            while(resultset1.next()){
            userbalance=resultset1.getString(1);
            count1++;
                    
			}
				if(count1==1)
				{
				double userbalance_value= Double.parseDouble(userbalance);
				double amount_value= Double.parseDouble(Amount);
				double effective_balance=userbalance_value+amount_value;
				String effective_string = Double.toString(effective_balance);
	            ResultSet resultset3 = statement.executeQuery("update user_balance set userbalance='"+effective_string+"' where username='"+username+"'" );
				
				}
				else{
			ResultSet resultset4 = statement.executeQuery("insert into user_balance (username,userbalance)values ('"+username+"', '"+Amount+"')");
                } 
		}		
            response.sendRedirect("StockBuddy_products.jsp?username="+username+"&firstname="+firstname+"&lastname="+lastname+"");
            statement.close();  
            connection.close();
           
			
        } catch (Exception e) {  
            out.println("The exception raised is:" + e);  
        }

%>