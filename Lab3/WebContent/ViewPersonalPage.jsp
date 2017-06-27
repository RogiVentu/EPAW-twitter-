<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session = "true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/structure.css" />

<title>Insert title here</title>

<c:if test="${not empty mypage}">
	<p><b>If you want personal page, please sign up and get
		registered !</b></p><br><br>
</c:if>
<c:if test="${empty mypage}">
	<c:set var="userP" value="${userProfile}" />
	<div style="display: flex;">
		<div class="pers_img"></div>
		<div>
			<div class="pers_text">${userP.name}</div>
			<div class="pers_text">${userP.surnames}</div>
			<div class="pers_text">${userP.gender}</div>
			<div class="pers_text">${userP.datebirth}</div>
			<div class="pers_text">${userP.user}</div>
			<div class="pers_text">${userP.mail}</div>
		</div>

	</div>
	<br><br>

	<c:forEach  var="bt" items="${alltweets}">
    	<div><b><u>${bt.title}</u></b> - at ${bt.time}<br><br>${bt.text}<br><br>By: ${bt.user}</div><br><br><br><br/>
  	</c:forEach>
</c:if>

