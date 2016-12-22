<%@page import="java.sql.*,java.io.*,java.math.*,java.lang.*,java.util.Properties,javax.mail.*,javax.mail.internet.*"%>  
<%@page import=" java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet, java.sql.Statement"%> 
<%@page import="java.sql.*,java.io.*,java.math.*,java.lang.*,java.io.FileInputStream"%> 
<%
        try {  
        	
        	String username=request.getParameter("username");
			String password=request.getParameter("password");
        	String firstname=request.getParameter("firstname");
        	String lastname=request.getParameter("lastname");
        	String email=request.getParameter("email");
			Properties prop = new Properties();

			String propFileName = "config.properties";
			InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);
			prop.load(inputStream);
			final String PassWord=prop.getProperty("PassWord");
			final String from=prop.getProperty("from");
            
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");
            Statement statement = connection.createStatement();  
            ResultSet resultset = statement.executeQuery("insert into accounts values ('"+username+"', '"+password+"', '"+firstname+"', '"+lastname+"','"+email+"')");
            
			ResultSet resultset1 = statement.executeQuery("insert into user_balance values ('"+username+"', '1000')");
            
			//Mail Code
			
			String to=email;//change accordingly
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
			//compose message  
			try {  
			MimeMessage message = new MimeMessage(session1);  
			message.setFrom(new InternetAddress(to));//change accordingly  
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
			message.setSubject("Hello "+firstname+" "+lastname+"..!!Welcome to StockBuddy Application");  
			message.setText("Please go and try the application. Your username is : "+username);  
			//send message  
			Transport.send(message);  
			//System.out.println("Please go and try the application. Your username is :"+username); 		   
		   
			} catch (MessagingException e) {throw new RuntimeException(e);}  
		
			statement.close();  
			connection.close(); 		
			
			response.sendRedirect("StockBuddy_home.jsp?username="+username+"&firstname="+firstname+"&lastname="+lastname+"");			
		
        } catch (Exception e) {  
            out.println("The exception raised is:" + e);  
        }  
      
%>