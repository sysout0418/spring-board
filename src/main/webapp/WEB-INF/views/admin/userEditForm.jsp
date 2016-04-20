<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header_dash.jsp" />
<!-- Begin page content -->
<div style="width: 1200; margin: 0 auto; background-color: #fff">
	<form class="form-horizontal" name="frm" id="frm" method="post">
		<fieldset>
			<legend>User Edit</legend>
			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">이메일(ID)</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="uemail" readonly="readonly" value="${userInfo.uemail}">
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputName" class="col-lg-2 control-label">이름</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="uname" value="${userInfo.uname}">
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="uphoneno" value="${userInfo.uphoneno}">
				</div>
			</div>
			
			<div class="form-group">
				<label for="select" class="col-lg-2 control-label">부서</label>
				<div class="col-lg-10">
					<select class="form-control" id="select">
						<c:forEach var="depart" items="${departmentList}">
							<option <c:if test="${userInfo.udepartmentName == depart.CODE_NAME}">selected="selected"</c:if>>${depart.CODE_NAME}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label for="select" class="col-lg-2 control-label">권한</label>
				<div class="col-lg-10">
					<select class="form-control" id="select">
						<c:forEach var="authority" items="${authorityList}">
							<c:choose>
								<c:when test="${authority.authority == 'ROLE_USER'}">
									<option <c:if test="${userInfo.authority == authority.authority}">selected="selected"</c:if>>일반 회원</option>
								</c:when>
								<c:when test="${authority.authority == 'ROLE_MANAGER'}">
									<option <c:if test="${userInfo.authority == authority.authority}">selected="selected"</c:if>>프로젝트 매니저</option>
								</c:when>
								<c:otherwise>
									<option <c:if test="${userInfo.authority == authority.authority}">selected="selected"</c:if>>관리자</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">가입 승인 상태</label>
				<div class="col-lg-10">
					<c:choose>
						<c:when test="${userInfo.enabled == 1}">
							<a href="#" id="admit" class="btn btn-success btn-xs" alt="${userInfo.uno}">승인</a>
						</c:when>
						<c:otherwise>
							<a href="#" id="deny" class="btn btn-warning btn-xs" alt="${userInfo.uno}">미승인</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">탈퇴 여부</label>
				<div class="col-lg-10">
					<c:choose>
						<c:when test="${userInfo.expired == 'Y'}">
							<a href="#" id="reco" class="btn btn-info btn-xs" alt="${userInfo.uno}">Y</a>
						</c:when>
						<c:otherwise>
							<a href="#" id="del" class="btn btn-danger btn-xs" alt="${userInfo.uno}">N</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<button type="reset" class="btn btn-default" onclick="history.back(-1)">Cancel</button>
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div>
		</fieldset>
	</form>
</div>
<script type="text/javascript">

</script>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />