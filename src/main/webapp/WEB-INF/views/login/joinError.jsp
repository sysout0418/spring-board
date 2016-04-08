<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
	<c:when test="${errMsg != null}">
		<p>${errMsg}</p>
		<p>${auth}</p>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("이미 가입된 아이디 입니다.");
			history.back();
		</script>
	</c:otherwise>
</c:choose>