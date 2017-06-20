<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" import="models.BeanUser"%>
	
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	

<p id="log_done" style="color: black">Login for user ${user} done!</p>

<script type="text/javascript">


	$(document).ready(function() {
		$.ajaxSetup({
			cache : false
		}); // Avoids Internet Explorer caching!
		$('#navigation').load('MenuController');

		document.body.style.background = "#DCDCDC";
	});
</script>

<script>
	setTimeout(function() {
		$('#content').load('TweetsController')
	}, 2000);
</script>
