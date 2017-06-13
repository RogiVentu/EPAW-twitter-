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

<!--<script type="text/javascript">
	var text = "";
	var i;
	for(i=0; i<10 ; i++){
		text += "<p><b><u>${title}</u></b> - at ${time}<br><br>${text}<br><br>By: ${usertweet}</p><br><br><br>";
	}
	
	document.getElementById("showtw").innerHTML = text;
</script>-->



<p id="log_done" style="color: black">Login for user ${user} done!</p>

<div id="show_tweets">
	<p id="showtw"><b><u>${title0}</u></b> - at ${time0}<br><br>${text0}<br><br>By: ${usertweet0}</p><br><br><br>
	<p id="showtw"><b><u>${title1}</u></b> - at ${time1}<br><br>${text1}<br><br>By: ${usertweet1}</p><br><br><br>
	<!-- <p id="showtw"></p>-->
</div>
