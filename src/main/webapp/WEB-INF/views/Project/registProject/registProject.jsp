<%@page import="com.nbreds.projectPlanning.HomeController"%>
<%@page import="com.nbreds.projectPlanning.Project.VO.User"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	List<User> userInfoList = HomeController.USER_INFO;
%>
<style type="text/css">
.custom-combobox {
	position: relative;
	display: inline-block;
}

.custom-combobox-toggle {
	position: absolute;
	top: 0;
	bottom: 0;
	margin-left: -1px;
	padding: 0;
}

.custom-combobox-input {
	margin: 0;
	padding: 5px 10px;
}
</style>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp" />
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-2 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><a href="/">MyProjects</a></li>
				<li class="active"><a href="/regist">Regist<span
						class="sr-only">(current)</span></a></li>
				<li><a href="/search">Search</a></li>
				<li><a href="/list">Projects</a></li>
			</ul>
			<ul class="nav nav-sidebar">
				<li><a href="/milestones/open">Milestones</a></li>
				<li><a href="/issues">Issues</a></li>
			</ul>
			<ul class="nav nav-sidebar">
				<li><a href="">Profile Settings</a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<!-- Begin page content -->
			<div style="width: 1200; margin: 0 auto; background-color: #fff">
				<h4 class="page-header">New Project</h4>
				<p>
					<strong>담당자 정보</strong>
				</p>
				<table class="table">
					<tr>
						<td style="width: 200px;" class="active">담당자명</td>
						<td style="width: 350px">${user.uname}</td>
						<td style="width: 200px;" class="active">부서 / 직책</td>
						<td>${user.udepartment}/${user.uposition}</td>
					</tr>
					<tr>
						<td class="active">담당자 연락처</td>
						<td>${user.uphoneno}</td>
						<td class="active">담당자 이메일</td>
						<td>${user.uemail}</td>
					</tr>
					<tr>
						<td colspan="4"></td>
					</tr>
				</table>

				<p>
					<strong>프로젝트 키워드</strong>
				</p>
				<form:form method="POST" action="regist" commandName="project">
					<input type="hidden" id="pmember" name="pmember" value="">
					<table class="table">
						<tr>
							<td colspan="2" style="width: 500px; vertical-align: middle; text-align: center;" class="active">프로젝트 명</td>
							<td style="width: 300px" colspan="2"><form:input
									path="pname" class="form-control" /></td>
						</tr>
						<tr>
							<td rowspan="3" style="width: 100px; vertical-align: middle; text-align: center;" class="active">기본분야</td>
							<td style="width: 200px; vertical-align: middle; text-align: center;" class="active">개발</td>
							<td colspan="2"><form:checkboxes path="pdevelopment"
									items="${development}" itemValue="CODE" itemLabel="CODE_NAME" /></td>
						</tr>
						<tr>
							<td class="active" style="vertical-align: middle; text-align: center;">디자인/퍼블리싱</td>
							<td colspan="2"><form:checkboxes path="pdesign"
									items="${design}" itemValue="CODE" itemLabel="CODE_NAME" /></td>
						</tr>
						<tr>
							<td class="active" style="vertical-align: middle; text-align: center;">기획/컨설턴트</td>
							<td colspan="2"><form:checkboxes path="pplanning"
									items="${planning}" itemValue="CODE" itemLabel="CODE_NAME" /></td>
						</tr>
						<tr>
							<td colspan="2" class="active" style="vertical-align: middle; text-align: center;">전문분야/특별경험</td>
							<td colspan="2"><form:checkboxes path="pexperience"
									items="${experience}" itemValue="CODE" itemLabel="CODE_NAME" /></td>
						</tr>
						<tr>
							<td colspan="2" class="active" style="vertical-align: middle; text-align: center;">상세내용</td>
							<td colspan="2"><form:textarea path="pdetail"
									cssClass="form-control" cssStyle="height:400px" /></td>
						</tr>
						<tr>
							<td colspan="2" class="active" style="vertical-align: middle; text-align: center;">등급</td>
							<td><form:select path="plevel" items="${level}"
									itemValue="CODE" itemLabel="CODE_NAME" /></td>
						</tr>
						<tr>
							<td colspan="2" class="active" style="vertical-align: middle; text-align: center;">모집마감일자</td>
							<td><form:input path="pduedate" id="datepicker"/></td>
						</tr>
						<tr>
							<td colspan="2" class="active" style="vertical-align: middle; text-align: center;">프로젝트 요청</td>
							<!-- <td><form:input path="pmember" id="autocomplete" type="text" cssClass="form-control"/></td>  -->
							<td><textarea id="textarea" class="example" rows="1"></textarea></td>
						</tr>
						<tr>
							<td colspan="3"></td>
						</tr>
					</table>
					<input class="btn btn-success" type="submit" id="submit" value="Create Project">
					<!-- 테스트용 버튼 지워도 됨 -->
					<!-- <div align="center">
						<input class="btn btn-primary btn-lg" type="button" id="test"
							value="테스트">
					</div> -->
				</form:form>
			</div>
			<script type="text/javascript">
			$(function() {
			  $( "#datepicker" ).datepicker({
				 altFormat : "mm/dd/yy"
			  });
			});
			$('#textarea')
		       .textext({
		           plugins : 'autocomplete filter tags ajax',
		           ajax : {
		               url : '/nameList',
		               dataType : 'json',
		               cacheResults : true
		           }
		       });
		   
		   $(function () {
			  $('#submit').click(handler);
			});
		   
		   $(function () {
			   $(".text-remove").click(handler); 
		   });
		   
		   function handler() {
			   var uno = "";
			   $(".text-button > .text-label").each(function() {
					var userName = $(this).text();
					if (userName != null && userName != "") {
						<% for (int i = 0; i < userInfoList.size(); i++) { %>
								if (userName == "<%= userInfoList.get(i).getUname() %>") {								
									uno += "<%= userInfoList.get(i).getUno() + "," %>";
								}
						<% } %>
					}
				});
			   $("#pmember").val(uno);
		   }
			</script>
			<jsp:include
				page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />