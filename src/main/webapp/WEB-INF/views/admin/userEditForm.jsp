<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header_dash.jsp" />
<!-- Begin page content -->
<div style="width: 1200; margin: 0 auto; background-color: #fff">
	<form class="form-horizontal">
		<fieldset>
			<legend>User Edit</legend>
			<div class="form-group">
				<label for="inputName" class="col-lg-2 control-label">이름</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="uname" readonly="readonly">
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="uphoneno" readonly="readonly">
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="uemail" readonly="readonly">
				</div>
			</div>
			
			<div class="form-group">
				<label for="select" class="col-lg-2 control-label">부서</label>
				<div class="col-lg-10">
					<select class="form-control" id="select">
						<option>1</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label for="select" class="col-lg-2 control-label">권한</label>
				<div class="col-lg-10">
					<select class="form-control" id="select">
						<option>1</option>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">가입 승인 상태</label>
				<div class="col-lg-10">
					<a href="#" class="btn btn-success btn-xs">승인</a>
					<a href="#" class="btn btn-warning btn-xs">미승인</a>
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">탈퇴 여부</label>
				<div class="col-lg-10">
					<a href="#" class="btn btn-info btn-xs">Y</a>
					<a href="#" class="btn btn-danger btn-xs">N</a>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<button type="reset" class="btn btn-default">Cancel</button>
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</div>
		</fieldset>
	</form>
</div>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />