<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
$(document).ready(function() {
    $(".menu").click(function(event) {
        $('html').load('ContentController',{content: $(this).attr('id')});
        });
});
</script>

<link rel="stylesheet" type="text/css" href="css/structure.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
</head>

<body>



	<div id="nav">
		<br>
		<div id="nav_wrapper">
			<br> <br> <img class="imglogomenu"
				src="css/images/logoinv.png">
			<ul>
				<li><a href="#">Main Page</a></li>
				<li><a href="#">Your Tweets</a></li>
				<li><a href="#">New Songs</a></li>
				<li><a href="#">Next Shows</a></li>
				<li><a href="#">About Us</a></li>
				<li><a href="#">Logged as ${user}</a></li>
				<li><a href=# class="menu" id="LogoutController">Logout</a></li>
			</ul>
		</div>
	</div>

	<div id="content">

		<jsp:include page="ViewLoginDone.jsp" />

	</div>

</body>
</html>
