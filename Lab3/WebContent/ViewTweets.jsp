<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	var num = ${numtweets};
	var text = "";
	var i;
	for (i = 0; i <= num-1; i++) {
		if (i == 0)
			text += "<p><b><u>${title0}</u></b> - at ${time0}<br><br>${text0}<br><br>By: ${usertweet0}</p><br><br><br>";
		if (i == 1)
			text += "<p><b><u>${title1}</u></b> - at ${time1}<br><br>${text1}<br><br>By: ${usertweet1}</p><br><br><br>";
		if (i == 2)
			text += "<p><b><u>${title2}</u></b> - at ${time2}<br><br>${text2}<br><br>By: ${usertweet2}</p><br><br><br>";
			

	}

	document.getElementById("showtw").innerHTML = text;
</script>

<div id="show_tweets">
	<!--<p id="showtw"><b><u>${title0}</u></b> - at ${time0}<br><br>${text0}<br><br>By: ${usertweet0}</p><br><br><br>
	<p id="showtw"><b><u>${title1}</u></b> - at ${time1}<br><br>${text1}<br><br>By: ${usertweet1}</p><br><br><br>-->
	<c:if test="${not empty isGuest}">
		<p>If you want to create your own tweets, please sign up and get
			logged !</p>
	</c:if>
	<c:if test="${empty isGuest}">
		<p id="showtw"></p>
	</c:if>
</div>