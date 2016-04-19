<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header_dash.jsp"/>
<jsp:useBean id="pageBean" class="com.nbreds.projectPlanning.common.util.PageBean" scope="request" />
<!-- Begin page content -->
<div style="width:1200; margin:0 auto; background-color: #fff">
<h4>Projects</h4>
총 프로젝트 수 ${countProjects}개<br>
<form name="frm" id="frm" method="post">
<div class="form-inline">
	<select class="form-control" id="group" name="key" >
		<option value="all" <%=pageBean.getKey("all")%>>모두</option>
		<option value="pname" <%=pageBean.getKey("pname")%>>프로젝트명</option>
		<option value="uname" <%=pageBean.getKey("uname")%>>담당자</option>
	</select>
	<input type="text" class="form-control" placeholder="Search" name="word" id="word" value="${pageBean.word}">
	<button type="button" class="btn btn-primary" onclick="javascript:pagelist(1)">검색</button>
</div>
<input type="hidden" name="pageNo" id="pageNo" value="${pageBean.pageNo}" />
<table class="table">
<tr class="active">
	<td><input type="checkbox" id="allCheck"></td>
	<td>프로젝트명</td>
	<td>등록일</td>
	<td>만기일</td>
	<td>담당자</td>
	<td>관리</td>
</tr>
<c:forEach items="${project}" var="project">
<tr>
	<td><input type="checkbox" value="${project.pno}" id="pno" name="pno"></td>
	<td><a href="/${project.uno}/${project.pno}">${project.pname}</a></td>
	<td>${project.pregdate}</td>
	<td>${project.pduedate}</td>
	<td>${project.uname}</td>
	<td><a href="/update?pno=${project.pno}">수정</a></td>
</tr>
</c:forEach>
</table>
<button class="btn btn-primary" onclick="delList()">선택삭제</button>
<!-- 페이징 -->
<div align="center">
	${pageBean.pagelink}
</div>
</form>
</div>
<script type="text/javascript">
	function pagelist(page) {
		$("#pageNo").val(page);
		$("#frm").get(0).action = "/admin/projects";
		$("#frm").get(0).submit();
	}

	$(function(){
		$("#allCheck").click(function(){
			if($("#allCheck").prop("checked")) {
				$("input[type=checkbox]").prop("checked",true);
			} else {
				$("input[type=checkbox]").prop("checked",false);
			}
		})
	})
	
	function delList() {
	var f = document.frm;
	var items = "";

	if (!f.pno)
		return false;

	if (typeof (f.pno.length) == "undefined") {
		if (f.pno.checked)
			items = f.pno.value;
	} else {
		for (var i = 0; i < f.pno.length; i++) {
			if (f.pno[i].checked) {
				items += ((items) ? "," : "") + f.pno[i].value;
			}
		}
	}

	if (items == "") {
		alert("삭제 할 프로젝트를 선택하세요.");
		return false;
	}

	if (confirm("정말로 해당 프로젝트를 삭제 하시겠습니까?")) {
		f.action = "/admin/projects/delete";
		f.submit();
	}
}
</script>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>