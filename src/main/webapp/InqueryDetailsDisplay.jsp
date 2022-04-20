<%@ page import="com.INQUERY_MANAGEMNT_ELECTRICAL_GRID_SYSTEM.Inquery_Deails_Display"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	//Insert Inquries 	
	if (request.getParameter("inqueryCode") != null)
	{
		Inquery_Deails_Display inqueryObj = new Inquery_Deails_Display();

		String stsMsg = inqueryObj.insertInquery(request.getParameter("inqueryCode"), 
					request.getParameter("inqueryCaption"), 
					request.getParameter("inqueryPerson"), 
					request.getParameter("inqueryDescription"));

		session.setAttribute("statusMsg", stsMsg);
	}

	//Delete Inquries 
	if (request.getParameter("inqueryId") != null)
	{
		Inquery_Deails_Display inqueryObj = new Inquery_Deails_Display();
		String stsMsg = inqueryObj.deleteInquries(request.getParameter("inqueryId")); 
		session.setAttribute("statusMsg", stsMsg);
	}
%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inquiry Management</title>
</head>
<body>

	<h1>Inquiry Management</h1>
	<form method="post" action="InqueryDetailsDisplay.jsp">
		Inquiry Code: <input name="inqueryCode" type="text"><br> 
		Inquiry Caption: <input name="inqueryCaption" type="text"><br> 
		Inquiry Person: <input name="inqueryPerson" type="text"><br> 
		Inquiry Description: <input name="inqueryDescription" type="text"><br> 
		<input name="btnSubmit" type="submit" value="Submit">
	</form>
	
	<%
		out.print(session.getAttribute("statusMsg"));
	%>
	<br>
	<%
		//Read Inquries
		Inquery_Deails_Display inqueryObj = new Inquery_Deails_Display(); 
		out.print(inqueryObj.readInqueries());
	%>
</body>
</html>
