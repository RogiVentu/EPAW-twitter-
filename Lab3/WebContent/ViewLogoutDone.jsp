<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>


<p style="color: black">Logout DONE !!!</p>

<li><a class="menu" id="MainController" href="MainController"> Back </a></li>

<script type="text/javascript">
$(document).ready(function() {
	    $.ajaxSetup({ cache: false }); //Avoids Internet Explorer caching!
        $('#navigation').load('MenuController');   
	    
        
});
</script>
