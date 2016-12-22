<%@page import="java.sql.*,java.io.*,java.math.*,java.lang.*,java.util.Properties,javax.mail.*,javax.mail.internet.*"%>  
<%@page import=" java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet, java.sql.Statement"%> 
<%@page import="java.sql.*,java.io.*,java.math.*,java.lang.*,java.io.FileInputStream"%>  
<%
String stockname= request.getParameter("stockname");
String quantity= request.getParameter("quantity");
String currentprice= request.getParameter("currentprice");
String username=request.getParameter("username");
String stock_CompanyName="";
String userbalance="";
String previous_quantity="";
String to="";
Properties prop = new Properties();
String propFileName = "config.properties";
InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);
prop.load(inputStream);
final String PassWord=prop.getProperty("PassWord");
final String from=prop.getProperty("from");
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");

try {  
        	       	            
        DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
        Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");
        Statement statement = connection.createStatement();
		ResultSet resultset = statement.executeQuery("select stock_name from stock_table where username='"+username+"' and stock_symbol='"+stockname+"'");
			while(resultset.next()){
			stock_CompanyName=resultset.getString(1);
			}	
		ResultSet resultset1 = statement.executeQuery("select userbalance from user_balance where username='"+username+"'");
			while(resultset1.next()){
			userbalance=resultset1.getString(1);
			}
			double userbalance_value= Double.parseDouble(userbalance);
			double quantity_value= Double.parseDouble(quantity);
			double currentprice_value= Double.parseDouble(currentprice);
			double effective_transation=(quantity_value*currentprice_value); 
			
if (userbalance_value!=0 & (effective_transation<userbalance_value))
	{
		ResultSet resultset8 = statement.executeQuery("select email from accounts where username='"+username+"'");
		while(resultset8.next()){
            	 to=resultset8.getString(1);
				}
		ResultSet resultset4 = statement.executeQuery("select stocksymbol,quantity from user_account where stocksymbol='"+stockname+"' and username='"+username+"'");
			int count1=0;
            while(resultset4.next()){
            	stockname=resultset4.getString(1);
				previous_quantity=resultset4.getString(2);
				count1++;	}
				if(count1==1)
				{
				double previous_quantity_value= Double.parseDouble(previous_quantity);
				double effective_quantity_value=previous_quantity_value+quantity_value;
				String effective_quantity_value_string = Double.toString(effective_quantity_value);
				ResultSet resultset5 = statement.executeQuery("update user_account set quantity='"+effective_quantity_value_string+"' where username='"+username+"' and stocksymbol='"+stockname+"'" );
				//Mail Code
			
				Properties props = new Properties();  
				props.put("mail.smtp.host", "smtp.gmail.com");  
				props.put("mail.smtp.socketFactory.port", "465");  
				props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
				props.put("mail.smtp.auth", "true");  
				props.put("mail.smtp.port", "465");  
   				Session session1 = Session.getInstance(props,  
				new javax.mail.Authenticator() {  
				protected PasswordAuthentication getPasswordAuthentication() {  
				return new PasswordAuthentication(from,PassWord);//change accordingly  
				}  
				});  
				//code to compose message  
				try {  
				MimeMessage message = new MimeMessage(session1);  
				message.setFrom(new InternetAddress(to));//change accordingly  
				message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
				message.setSubject("Hello "+firstname+" "+lastname+"..!!You have just buy a stock");  
				message.setText("You have purchased a stock "+stockname+" and Quantity :"+quantity);
					
				//code to send message  
				Transport.send(message);
				System.out.println("You have purchased a stock "+stockname+" and Quantity :"+quantity);
				} catch (MessagingException e) {throw new RuntimeException(e);} 
				
				}
			else
			{
			ResultSet resultset2 = statement.executeQuery("insert into user_account (username,stockname,stocksymbol,stockprice,quantity)values ('"+username+"', '"+stock_CompanyName+"', '"+stockname+"','"+currentprice+"','"+quantity+"')");		
			
				Properties props = new Properties();  
				props.put("mail.smtp.host", "smtp.gmail.com");  
				props.put("mail.smtp.socketFactory.port", "465");  
				props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
				props.put("mail.smtp.auth", "true");  
				props.put("mail.smtp.port", "465");  

				Session session1 = Session.getInstance(props,  
				new javax.mail.Authenticator() {  
				protected PasswordAuthentication getPasswordAuthentication() {  
				return new PasswordAuthentication(from,PassWord);  
				}  
				});  
				//compose message  
				try {  
				MimeMessage message = new MimeMessage(session1);  
				message.setFrom(new InternetAddress(to));//change accordingly  
				message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
				message.setSubject("Hello "+firstname+" "+lastname+"..!!You have just buy a stock");  
				message.setText("You have purchased a stock "+stockname+" and Quantity :"+quantity);  
				//send message  
				Transport.send(message);  
				System.out.println("You have purchased a stock "+stockname+" and Quantity :"+quantity);
				} catch (MessagingException e) {throw new RuntimeException(e);} 
			
			}

			userbalance_value=userbalance_value-effective_transation;
			userbalance=Double.toString(userbalance_value);
			ResultSet resultset3 = statement.executeQuery("update user_balance set userbalance='"+userbalance+"' where username='"+username+"'" );		
			statement.close();  
            connection.close();  
            response.sendRedirect("StockBuddy_products.jsp?username="+username+"&firstname="+firstname+"&lastname="+lastname+"");
			}
			else
				{
				response.sendRedirect("StockBuddy_home.jsp?username="+username+"&firstname="+firstname+"&lastname="+lastname+"");
				}
	
        } catch (Exception e) {  
            out.println("The exception raised is:" + e);  
        }

%>
