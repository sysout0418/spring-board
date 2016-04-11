<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header_dash.jsp"/>
<jsp:useBean id="pageBean" class="com.nbreds.projectPlanning.common.util.PageBean" scope="request" />
<!-- Begin page content -->
<form name="search" id="search" method="POST">
	<div style="width:1200; height:1200; margin:0 auto; background-color: #fff">
	<div id="search" style="float: left">
		<input type="hidden" name="pageNo" id="pageNo" value="${pageBean.pageNo}" />
		<input type="hidden" name="pdata" id="pdata" value="" />
		<h4>Search</h4>
		<table class="table">
		<tr>
			<td style="width:230px; text-align: center; vertical-align: middle;" class="active">개발분야</td>
			<td colspan="3"><%-- <form:checkboxes path="pdevelopment" items="${development}" itemValue="CODE" itemLabel="CODE_NAME" cssStyle="margin-left : 2px"/> --%>
				<c:forEach var="dev" items="${development}">
			           <input type="checkbox" value="${dev.CODE_TYPE}${dev.CODE}" name="checked" style="margin-left : 2px">${dev.CODE_NAME}
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td style="width:230px; text-align: center; vertical-align: middle;"  class="active">디자인/퍼블리싱 분야</td>
			<td colspan="3"><%-- <form:checkboxes path="pdesign" items="${design}" itemValue="CODE" itemLabel="CODE_NAME" cssStyle="margin : 2px"/> --%>
				<c:forEach var="des" items="${design}">
			           <input type="checkbox" value="${des.CODE_TYPE}${des.CODE}" name="checked" style="margin-left : 2px">${des.CODE_NAME}
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td style="width:230px; text-align: center; vertical-align: middle;"  class="active">기획/컨설턴트 분야</td>
			<td colspan="3"><%-- <form:checkboxes path="pplanning" items="${planning}" itemValue="CODE" itemLabel="CODE_NAME" cssStyle="margin : 2px"/> --%>
				<c:forEach var="plan" items="${planning}">
			           <input type="checkbox" value="${plan.CODE_TYPE}${plan.CODE}" name="checked" style="margin-left : 2px">${plan.CODE_NAME}
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td style="width:230px; text-align: center; vertical-align: middle;"  class="active">전문분야/특별경험</td>
			<td colspan="3"><%-- <form:checkboxes path="pexperience" items="${experience}" itemValue="CODE" itemLabel="CODE_NAME" cssStyle="margin : 2px"/> --%>
				<c:forEach var="exp" items="${experience}">
			           <input type="checkbox" value="${exp.CODE_TYPE}${exp.CODE}" name="checked" style="margin-left : 2px">${exp.CODE_NAME}
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td style="width:230px; text-align: center; vertical-align: middle;"  class="active">등급</td>
			<td style="width:300px"><%-- <form:checkboxes path="plevel" items="${level}" itemValue="CODE" itemLabel="CODE_NAME" cssStyle="margin : 2px"/> --%>
				<c:forEach var="lev" items="${level}">
			           <input type="checkbox" value="${lev.CODE_TYPE}${lev.CODE}" name="checked" style="margin-left : 2px">${lev.CODE_NAME}
				</c:forEach>
			</td>
			<td></td>
			<td></td>
		</tr>
		<tr><td colspan="4"></td></tr>
		</table>
		<div align="center">
			<!-- <input type="submit" class="btn btn-success" value="Search"> -->
			<a href="javascript:pagelist(1)" class="btn btn-success">Search</a>
			<a href="#" onclick="selectDelRow()" class="btn btn-success">Test</a>
		</div>
	</div>
	<div id="searchResult">
		<table class="table">
		<tr class="active">
			<td style="width:500px; text-align: center;">프로젝트</td>
		   	<td>등급</td>
		   	<td>모집분야</td>
		   	<td>마감일</td>
		   	<td>담당자</td>
		</tr>
	   	<c:forEach var="project" items="${list}">
	    <tr>
		    <td>
			    <a href="/DetailProject/${project.pno}">${project.pname}</a><br>
				<c:choose>
					<c:when test="${fn:length(project.pdetail) > 20}">
						<c:out value="${fn:substring(project.pdetail,0,20)}"/>....
					</c:when>
					<c:otherwise>
						<c:out value="${project.pdetail}"/>
					</c:otherwise>
				</c:choose>
		  	</td>
  			<td>${project.plevel["0"]}</td>
  			<td>${project.pskill}</td>
  			<td>${project.pduedate}</td>
  			<td>${project.uname}</td>
  		</tr>
	  	</c:forEach>
		<tr><td colspan="5"></td></tr>
	</table>
	
	<!-- 페이징 -->
	<div align="center">
		${pageBean.pagelink}
		<%-- <ul class="pagination">
	  		<li><a href="search?pageNo=1">처음</a></li>
	  		<c:if test="${groupNo >1 }">
	    	<li><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
	   		</c:if>
		    <c:forEach var="i" begin="${startPageNo}" end = "${endPageNo}">
		    <li <c:if test="${pageNo ==i}">class="active"</c:if>><a href="search?pageNo=${i}">${i}</a></li>
		    </c:forEach>
	    	<c:if test="${groupNo < totalGroupNo }">
	    	<li><a href="search?pageNo=${endPageNo+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
	    	</c:if>
	    	<li><a href="?pageNo=${totalPageNo}">맨끝</a></li>
	  	</ul> --%>
	</div>
</div>
</div>
</div>
</form>
<script type="text/javascript">
function pagelist(page) {
	$("#pageNo").val(page);
	selectDelRow();
	$("#search").get(0).action = "/search";
	$("#search").get(0).submit();
}

function selectDelRow() {
	var chk = document.getElementsByName("checked"); // 체크박스객체를 담는다
	var len = chk.length;	// 체크박스의 전체 개수
	var checkRow = '';		// 체크된 체크박스의 value를 담기위한 변수
	var checkCnt = 0;		// 체크된 체크박스의 개수
	var checkLast = '';		// 체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
	var rowid = '';			// 체크된 체크박스의 모든 value 값을 담는다
	var cnt = 0;                 

	for(var i=0; i<len; i++) {
		if(chk[i].checked == true) {
			checkCnt++;        //체크된 체크박스의 개수
			checkLast = i;     //체크된 체크박스의 인덱스
		}
	} 

	for(var i=0; i<len; i++) {
		if(chk[i].checked == true) {			//체크가 되어있는 값 구분
			checkRow = chk[i].value;
			if (checkCnt == 1) {				//체크된 체크박스의 개수가 한 개 일때,
				rowid += checkRow;				// value의 형태 (뒤에 ,(콤마)가 붙지않게)
			} else if(i == checkLast) {			//체크된 체크박스 중 마지막 체크박스일 때,
				rowid += checkRow;  			//value의 형태 (뒤에 ,(콤마)가 붙지않게)
			} else {
				rowid += checkRow + ",";		//value,의 형태 (뒤에 ,(콤마)가 붙게)
			}
		}
		cnt++;
		checkRow = '';	//checkRow초기화.
	}
	
	$('#pdata').val(rowid);
	//alert(rowid);	//value1, value2, value3 의 형태로 출력된다.
	
}
</script>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>