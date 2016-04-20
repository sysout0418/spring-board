<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<script type="text/javascript">
function checkId() {
	// email 정규표현식
	var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
	if ($("#uemail").val() == '') {
		$("#checkResult").html("<p style='color: red;'>E-MAIL 형식을 확인해주세요.</p>");
		$("#uemail").focus();
		return;
	} else if(!checkEmail.test($('#uemail').val())) {
		$("#checkResult").html("<p style='color: red;'>E-MAIL 형식을 확인해주세요.</p>");
		$("#uemail").val("");
		$("#uemail").focus();
		return;
	} else {
		$.ajax({
			type: "POST",
			url: "/checkId",
			data: {
				"uemail": $('#uemail').val()
			},
			success: function(data) {
				if ($.trim(data) == 'Y') {
					$("#checkResult").html("<p style='color: red;'>이미 사용중인 E-MAIL 입니다.</p>");
					$("#uemail").val("");
					$("#uemail").focus();
					return;
				} else if ($.trim(data) == 'N2') {
					$("#checkResult").html("<p style='color: red;'>E-MAIL 형식을 확인해주세요.</p>");
					$("#uemail").val("");
					$("#uemail").focus();
					return;
				} else if ($.trim(data) == 'N') {
					$("#checkResult").html("<p style='color: blue;'>사용 가능한 E-MAIL 입니다.</p>");
				} 
			}
		});
	}
}
</script>
<div id="login-page">
	<div class="container">
    <form:form cssClass="form-login" method="post" action="/join" commandName="UserInfo">
       <h2 class="form-login-heading">sign up</h2>
       <div class="login-wrap">
           <input type="email" id="uemail" name="uemail" class="form-control" placeholder="Email" onblur="checkId()" maxlength="20" required autofocus>
           <span id="checkResult"></span>
           <input type="text" class="form-control" id="uname" name="uname" placeholder="Name" maxlength="20" required>
           <input type="text" class="form-control" id="uphoneno" name="uphoneno" placeholder="Phone Number" maxlength="20" required>
           <input type="password" id="upassword" name="upassword" class="form-control" placeholder="Password" maxlength="20" required>
           <br>
           <button class="btn btn-theme btn-block" type="submit"><i class="fa fa-lock"></i> SIGN UP</button>
       </div>
     </form:form>	  	
	
	</div>
</div>

 <!-- js placed at the end of the document so the pages load faster -->
 <script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery.js" />"></script>
 <script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap/bootstrap.min.js" />"></script>

 <!--BACKSTRETCH-->
 <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
 <script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery.backstretch.min.js" />"></script>
 <script>
     $.backstretch("<c:url value="/resources/img/login-bg.jpg" />", {speed: 500});
 </script>


  </body>
</html>