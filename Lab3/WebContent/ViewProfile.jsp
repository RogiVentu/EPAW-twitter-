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
</div>
<div>
	<c:if test="${empty isGuest}">
		<c:set var="userP" value="${userProfile}" />
		<div id="hide">Name : ${userP.name}<input id="ch"type="submit"class ="change" value="Change Name"/><br><br></div>
		<div id="show">Name : <input id="${userP.user}"name="name"type="text" value="${userP.name}"/><input id="name"type="submit"class ="change" value="Submit" onclick="change(this)"/><br><br></div>
		
		<div id="hide1">Surname : ${userP.surnames}<input id="ch1"type="submit"class ="change" value="Change Surname"/><br><br></div>
		<div id="show1">Surname : <input id="${userP.user}"name="surnames"type="text" value="${userP.surnames}"/><input id="surnames"type="submit"class ="change" value=" Submit" onclick="change(this)"/><br><br></div>
		
		<div id="hide2">Gender : ${userP.gender}<input id="ch2"type="submit"class ="change" value="Change Gender" /><br><br></div>
		<div id="show2">Gender : <input id="${userP.user}"name="gender" type="text" value="${userP.gender}"/><input id="gender"type="submit"class ="change" value=" Submit" onclick="change(this)"/><br><br></div>
		
		<div id="hide3">Date of birth : ${userP.datebirth}<input id="ch3"type="submit"class ="change" value="Change Date of birth" /><br><br></div>
		<div id="show3">Date of birth : <input id="${userP.user}"name="datebirth" type="text" value="${userP.datebirth}"/><input id="datebirth"type="submit"class ="change" value=" Submit" onclick="change(this)"/><br><br></div>
		
		<div id="hide5">Password : <input id="ch5" type="submit"class ="change" value="Change Password" /><br><br></div>
		<div id="show5">Password : <input id="${userP.user}"name="password"type="text" /><input id="pass"type="submit"class ="change" value=" Submit" onclick="change(this)"/><br><br></div>
		
		<div id="hide6">Mail : ${userP.mail}<input id="ch6"type="submit"class ="change" value="Change Mail" /><br><br></div>
		<div id="show6">Mail : <input id="${userP.user}"name="email"type="text" value="${userP.mail}"/><input id="mail"type="submit"class ="change" value=" Submit" onclick="change(this)"/><br><br></div>
	</c:if>
</div>

<script type="text/javascript">
$(document).ready(function(){
	 $("#show").hide();  $("#show1").hide();  $("#show2").hide();  $("#show3").hide();  $("#show5").hide();  $("#show6").hide();
    	//name
	 $("#ch").click(function(){
        $("#hide").hide();
    });
    $("#ch").click(function(){
        $("#show").show();
    });
    //surname
    $("#ch1").click(function(){
        $("#hide1").hide();
    });
    $("#ch1").click(function(){
        $("#show1").show();
    });
    //gender
    $("#ch2").click(function(){
        $("#hide2").hide();
    });
    $("#ch2").click(function(){
        $("#show2").show();
    });
    //datebirth
    $("#ch3").click(function(){
        $("#hide3").hide();
    });
    $("#ch3").click(function(){
        $("#show3").show();
    });

    //pass
    $("#ch5").click(function(){
        $("#hide5").hide();
    });
    $("#ch5").click(function(){
        $("#show5").show();
    });
    //mail
    $("#ch6").click(function(){
        $("#hide6").hide();
    });
    $("#ch6").click(function(){
        $("#show6").show();
    });
    

    
});
function change(that){
	var siblings = that.parentNode.children,
	sibling_id = siblings[0].id, sibling_value = siblings[0].value , sibling_name =siblings[0].name;	  
		$.ajax({ 
	        type: "POST",
	        url: 'ChangeProfileController',
	        data: {change_value: sibling_value , change_what: sibling_name , change_who : sibling_id},
	        success: successFunc,
	        error: errorFunc
	    });
		function successFunc(data, status) {
		    	$(document).ready(function() {
		            $('#content').load('ProfileController');   
		    	});
		    	console.log("Correct delete execution");
		    }
	
		    function errorFunc() {
		    	console.log("Bad delete execution");
		    }	
		    console.log(that.value);
	    }
	  
	
</script>