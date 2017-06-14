<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session = "true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<script type="text/javascript">
	var num = ${numtweets};
	var text = "";
	var i;
	for(i=0; i<=num-1; i++){
		if(i == 0)
			text += "<p><b><u>${title0}</u></b> - at ${time0}<br><br>${text0}<br><br>By: ${usertweet0}</p><br><br><br>";
		if(i == 1)
			text += "<p><b><u>${title1}</u></b> - at ${time1}<br><br>${text1}<br><br>By: ${usertweet1}</p><br><br><br>";
		if(i == 2)
			text += "<p><b><u>${title2}</u></b> - at ${time2}<br><br>${text2}<br><br>By: ${usertweet2}</p><br><br><br>";
		if(i == 3)
			text += "<p><b><u>${title3}</u></b> - at ${time3}<br><br>${text3}<br><br>By: ${usertweet3}</p><br><br><br>";
		if(i == 4)
			text += "<p><b><u>${title4}</u></b> - at ${time4}<br><br>${text4}<br><br>By: ${usertweet4}</p><br><br><br>";
		if(i == 5)
			text += "<p><b><u>${title5}</u></b> - at ${time5}<br><br>${text5}<br><br>By: ${usertweet5}</p><br><br><br>";
		if(i == 6)
			text += "<p><b><u>${title6}</u></b> - at ${time6}<br><br>${text6}<br><br>By: ${usertweet6}</p><br><br><br>";
		if(i == 7)
			text += "<p><b><u>${title7}</u></b> - at ${time7}<br><br>${text7}<br><br>By: ${usertweet7}</p><br><br><br>";
		if(i == 8)
			text += "<p><b><u>${title8}</u></b> - at ${time8}<br><br>${text8}<br><br>By: ${usertweet8}</p><br><br><br>";
		if(i == 9)
			text += "<p><b><u>${title9}</u></b> - at ${time9}<br><br>${text9}<br><br>By: ${usertweet9}</p><br><br><br>";
	}
	
	document.getElementById("showtw").innerHTML = text;
</script>

<div id="show_tweets">
	<!--<p id="showtw"><b><u>${title0}</u></b> - at ${time0}<br><br>${text0}<br><br>By: ${usertweet0}</p><br><br><br>
	<p id="showtw"><b><u>${title1}</u></b> - at ${time1}<br><br>${text1}<br><br>By: ${usertweet1}</p><br><br><br>-->
	<p id="showtw"></p>
</div>