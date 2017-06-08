<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Lab 3 template</title>

<link rel="stylesheet" type="text/css" href="css/structure.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
	


</head>

<body>
	
	

	<div id="navigation">
		
		<jsp:include page="ViewMenuNotLogged.jsp"/>
	</div>
	<div id="content">
		<jsp:include page="ViewLoginForm.jsp" />
	</div>

	<!-- Begin Footer -->
	<div id="footer">

		<jsp:include page="footer.jsp"/>
		<!--<p>Web Page made by: Alexis Ruiz, Jaume Pons, Roger Ventura</p>-->

	</div>
	<!-- End Footer -->


</body>
</html>