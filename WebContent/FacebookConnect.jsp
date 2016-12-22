<%@page import="java.sql.*,java.io.*,java.math.*,java.lang.*,java.io.FileInputStream"%>  
<%@page import=" java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet, java.sql.Statement"%> 
<%@page import="java.sql.*,java.io.*,java.math.*,java.lang.*,java.util.Properties,javax.mail.*,javax.mail.internet.*"%>
<%
   //String PassWord="";
   // String from="";
  String to="manishchourasia90@gmail.com";
 

Properties prop = new Properties();
//InputStream input = null;
String propFileName = "config.properties";
InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);
prop.load(inputStream);

//input = new FileInputStream("/config.properties");
//prop.load(input);
final String PassWord=prop.getProperty("PassWord");
		
final String from=prop.getProperty("from");

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
message.setSubject("Hello ");  
message.setText("You have Sell a stock");
System.out.println("You have sell a stock ");	
//send message  
Transport.send(message);  
} catch (MessagingException e) {throw new RuntimeException(e);} 

%>