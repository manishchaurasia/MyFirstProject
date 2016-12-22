<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="java.io.*" %>

<%@ page import = "java.util.Date,java.text.*,java.text.ParseException"%>
<%@page import="java.lang.*" %>
<%@page import ="java.util.*" %>
<%@page import="java.sql.*,java.*,java.math.*,java.lang.*"%>  
<%@page import=" java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet, java.sql.Statement"%>

 


<%

try{
	String username=request.getParameter("username");
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = wb.createSheet();
	HSSFRow rowhead=   sheet.createRow((short)0);
	
	   rowhead.createCell((short) 0).setCellValue("STOCKNAME");
	   rowhead.createCell((short) 1).setCellValue("STOCKSYMBOL");
	   rowhead.createCell((short) 2).setCellValue("STOCKPRICE");
	   rowhead.createCell((short) 3).setCellValue("QUANTITY");
	 
    DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
    Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "system");
    Statement statement = connection.createStatement();  
    ResultSet rs = statement.executeQuery("select * from user_account where username='"+username+"'");			 
	
       int j=1;
	    while(rs.next())
	    {
	    HSSFRow row=   sheet.createRow((short)j);

	   row.createCell((short) 0).setCellValue(rs.getString("stockname"));
	   row.createCell((short) 1).setCellValue(rs.getString("stocksymbol"));
	   row.createCell((short) 2).setCellValue(rs.getString("stockprice"));
	   row.createCell((short) 3).setCellValue(rs.getString("quantity"));
	   	   
	    j++;
	    }
	
	// write it as an excel attachment
	ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
	wb.write(outByteStream);
	byte [] outArray = outByteStream.toByteArray();
	response.setContentType("application/ms-excel");
	response.setContentLength(outArray.length);
	response.setHeader("Expires:", "0"); // eliminates browser caching
	response.setHeader("Content-Disposition", "attachment; filename=Stock_Portfolio.xls");
	OutputStream outStream = response.getOutputStream();
	outStream.write(outArray);
	outStream.flush();      
        }
		catch( Exception ex )
        {    
			ex.printStackTrace();
        }     
%>












