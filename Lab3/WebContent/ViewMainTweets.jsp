<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session = "true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<c:if test="${not empty isGuest}">
	<p><b>If you want to tweet, please sign up and get
		logged !</b></p><br><br>
</c:if>
<c:if test="${empty isGuest}">
	<div style="border-style: groove; border-radius: 5px; margin-bottom:2%;">
		<form id = "tweet_pl">
	  		<input style="margin-left: 1%; margin-top: 2%; margin-right: 30%; width: 97%;" type="text" name="title" placeholder="What happens?">
	  		<br><br>
	  		<textarea style="resize:none; margin-left: 1%; margin-right: 2%; width: 97%;" rows="5" cols="70" name="text" placeholder="Explain it plz..."></textarea>
	  		<br><br>
	  		<input type="submit" value="Submit">
		</form> 
	</div>
</c:if>


 
<div id="show_alltw">

	<c:forEach  var="bt" items="${alltweets}">
    	<div><b><u>${bt.title}</u></b> - at ${bt.time}<br><br>${bt.text}<br><br>By: ${bt.user}</div><br><br><br><br/>
  	</c:forEach>
	
</div>

<script>
	$(document).ready(
			function() {
				$("#tweet_pl").validate(
						{
							submitHandler : function(form) {
								$('#content').load('PublishTweetController',
										$("#tweet_pl").serialize());
							}
						});
			});
</script>