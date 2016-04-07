<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<div class="container-fluid">
<div class="row"><div id="col">
<div class="col-sm-2 col-md-2 sidebar">
	<ul class="nav nav-sidebar">
		<li class="active"><a href="/">MyProjects</a></li>
	    <li><a href="/regist">Regist</a></li>
	    <li><a href="/search">Search</a></li>
	    <li><a href="/list">Projects</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li><a href="/milestones/open">Milestones</a></li>
	    <li><a href="/issues/open">Issues</a></li>
	</ul>
	<ul class="nav nav-sidebar">
	    <li><a href="">Profile Settings</a></li>
	</ul>
</div></div>
<form:form class="form-horizontal" method="POST" action="/join" commandName="UserInfo">
  <fieldset style="width: 800px; margin: 0 auto;">
    <legend>Join Us</legend>
    <div class="form-group">
      <label for="inputEmail" class="col-lg-2 control-label">Email</label>
      <div class="col-lg-10">
        <input type="email" class="form-control" id="uemail" name="uemail" placeholder="Email">
	    <a href="#" onclick="checkId()" id="checkId" class="btn btn-primary">Check</a>
	    <span id="checkResult"></span>
      </div>
    </div>
    <div class="form-group">
      <label for="inputPassword" class="col-lg-2 control-label">Password</label>
      <div class="col-lg-10">
        <input type="password" class="form-control" id="upassword" name="upassword" placeholder="Password">
      </div>
    </div>
    <div class="form-group">
      <label for="inputEmail" class="col-lg-2 control-label">Name</label>
      <div class="col-lg-10">
        <input type="text" class="form-control" id="uname" name="uname" placeholder="Name">
      </div>
    </div>
    <div class="form-group">
      <label for="inputEmail" class="col-lg-2 control-label">Phone</label>
      <div class="col-lg-10">
        <input type="text" class="form-control" id="uphoneno" name="uphoneno" placeholder="Phone Number">
      </div>
    </div>
    <!-- <div class="form-group">
      <label class="col-lg-2 control-label">Radios</label>
      <div class="col-lg-10">
        <div class="radio">
          <label>
            <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
            Option one is this
          </label>
        </div>
        <div class="radio">
          <label>
            <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
            Option two can be something else
          </label>
        </div>
      </div>
    </div> -->
    <div class="form-group">
      <label for="select" class="col-lg-2 control-label">Department</label>
      <div class="col-lg-10">
        <select class="form-control" id="udepartment" name="udepartment">
          <option>--- 선택 ---</option>
          <option>1부서</option>
          <option>2부서</option>
          <option>3부서</option>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label for="select" class="col-lg-2 control-label">Position</label>
      <div class="col-lg-10">
        <select class="form-control" id="uposition" name="uposition">
          <option>--- 선택 ---</option>
          <option>대표이사</option>
          <option>이사/본부장</option>
          <option>부장/팀장</option>
          <option>차장</option>
          <option>과장</option>
          <option>대리</option>
          <option>사원</option>
          <option>수석연구원</option>
          <option>책임연구원</option>
          <option>연구원</option>
        </select>
      </div>
    </div>
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary" id="submit">Submit</button>
      </div>
    </div>
  </fieldset>
</form:form>
<script type="text/javascript">
	$("#submit").click(function() {
		if ($("#udepartment").val() == '--- 선택 ---') {
			alert("부서를 선택하세요.");
			$("#udepartment").focus();
			return;
		} else if ($("#uposition").val() == '--- 선택 ---') {
			alert("직책을 선택하세요.");
			$("#uposition").focus();
			return;
		}
	});
	
	function checkId() {
		if ($("#uemail").val() == '') {
			alert("이메일 형식을 확인하세요.");
		} else {
			$('#checkId').attr('disabled', 'disabled');
			$.ajax({
				type: "POST",
				url: "/checkId",
				data: {
					"uemail": $('#uemail').val()
				},
				success: function(data) {
					if ($.trim(data) == 'Y') {
						$("#checkResult").html("<b style='font-size: 18px; color: red;'>이미 사용중인 E-MAIL 입니다.</b>");
						$("#uemail").val("");
					} else if ($.trim(data) == 'N') {
						$("#checkResult").html("<b style='font-size: 18px; color: blue;'>사용 가능한 E-MAIL 입니다.</b>");
					} else if ($.trim(data) == 'N2') {
						$("#checkResult").html("<b style='font-size: 18px; color: red;'>E-MAIL 형식을 확인해주세요.</b>");
						$("#uemail").val("");
					}
					$('#checkId').attr("disabled", false);
				}
			});
		}
	}
</script>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>