<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" import="models.BeanUser"%>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajaxSetup({
			cache : false
		}); // Avoids Internet Explorer caching!
		$('#navigation').load('MenuController');

		document.body.style.background = "#DCDCDC";
		$('#show_tweets').hide();
	});
</script>

<script>
	setTimeout(function() {
		$('#log_done').hide();
		$('#show_tweets').show();
	}, 2000);
</script>



<p id="log_done" style="color: black">Login for user ${user} done!</p>

<div id="show_tweets">
	<p><b><u>${title}</u></b><br><br>${text}</p>
</div>
