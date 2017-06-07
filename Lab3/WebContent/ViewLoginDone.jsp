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
function myFunction() {
    document.body.style.background = "#f3f3f3 url('images/tupac_bck.jpg') no-repeat";
}
</script>



<p style="color: #ffffff">Login for user ${user} done!</p>
