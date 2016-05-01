<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--footer start-->
<footer class="site-footer">
    <div class="text-center">
        2014 - Alvarez.is
        <a href="#" class="go-top">
            <i class="fa fa-angle-up"></i>
        </a>
    </div>
</footer>
<!--footer end-->
</section>

<!-- js placed at the end of the document so the pages load faster -->
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/jquery/jquery-1.12.1.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap/bootstrap.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/zabuto_calendar.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery-ui-1.9.2.custom.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery.ui.touch-punch.min.js" />"></script>

    
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/gritter/js/jquery.gritter.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/gritter-conf.js" />"></script>

<script type="text/javascript">
	var canvas = document.getElementById("cv");	//canvas의 DOM 객체를 얻는다
	var context = canvas.getContext("2d"); //DOM 객체로부터 2D 컨텍스트를 얻는다
	context.beginPath(); //패스 그리기 시작    
	context.arc(30, 30, 30, 0, 2*Math.PI, true); //원 그리기  
	context.fillStyle = "${profileBgColor}";
	context.fill();
	
	var canvas2 = document.getElementById("cv2");	//canvas의 DOM 객체를 얻는다
	var context2 = canvas2.getContext("2d"); //DOM 객체로부터 2D 컨텍스트를 얻는다
	var msg = "${theFirstLetterOfEmail}"; // 텍스트
	context2.font = "15px sans-serif"; // 폰트 크기 및 글자체
	context2.textAlign = "center";
	context2.textBaseline = "middle";
	//context2.strokeStyle = "white";
	//context2.strokeText(msg, 12, 45); // 텍스트 윤곽만 그리기
	context2.fillStyle = "WHITE";
	context2.fillText(msg, canvas2.width/2, canvas2.height/2); // 텍스트 채우기
</script>
</body>
</html>