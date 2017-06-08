<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import= "models.BeanUser"%>
<script type="text/javascript">
$(document).ready(function() {
	    $.ajaxSetup({ cache: false }); // Avoids Internet Explorer caching!
	    $('#navigation').load('MenuController');
	    
	    document.body.style.background = "#DCDCDC";
});
</script>

<script>

</script>



<p style="color: black">Login for user ${user} done!</p>
