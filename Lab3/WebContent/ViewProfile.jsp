<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<div>
	<c:if test="${not empty isGuest}">
		<p><b>If you want to have profile page you need to sign up and get
			logged !</b></p>
	</c:if>
	<c:if test="${empty isGuest}">
		<c:set var="userP" value="${userProfile}" />
		<div>${userP.name}</div><br><br>
		<div>${userP.surnames}</div><br><br>
		<div>${userP.gender}</div><br><br>
		<div>${userP.datebirth}</div><br><br>
		<div>${userP.user}</div><br><br>
		<div>${userP.mail}</div><br><br>
	</c:if>
</div>