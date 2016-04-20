<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header_dash.jsp" />
<jsp:useBean id="pageBean" class="com.nbreds.projectPlanning.common.util.PageBean" scope="request" />
<!-- Begin page content -->
<div style="width: 1200; margin: 0 auto; background-color: #fff">
	<h4>Users</h4>
	<form name="frm" id="frm" method="post">
	<div class="form-inline">
		<select class="form-control" id="group" name="key" >
			<option value="all" <%=pageBean.getKey("all")%>>모두</option>
			<option value="name" <%=pageBean.getKey("name")%>>이름</option>
			<option value="phoneNumber" <%=pageBean.getKey("phoneNumber")%>>휴대폰 번호</option>
			<option value="email" <%=pageBean.getKey("email")%>>이메일</option>
		</select>
		<input type="text" class="form-control" placeholder="Search" name="word" id="word" value="${pageBean.word}">
		<button type="button" class="btn btn-primary" onclick="javascript:pagelist(1)">검색</button>
	</div>
	
	<input type="hidden" name="isCheckCbListAll" value="F">
	<input type="hidden" name="pageNo" id="pageNo" value="${pageBean.pageNo}" />
	<input type="hidden" name="uno" id="uno" value="" />
	<table class="table table-striped table-hover ">
		<thead>
			<tr>
				<th><div class="checkboxAll">
						<label> 
							<input type="checkbox" name="cbListAll" onclick="checkCbListAll()">
						</label>
					</div></th>
				<th>이름</th>
				<th>휴대폰 번호</th>
				<th>부서</th>
				<th>이메일</th>
				<th>가입 신청일</th>
				<th>가입 승인 여부</th>
				<th>탈퇴 여부</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${allUserList}">
				<c:choose>
					<c:when test="${user.enabled == 0}">
						<tr class="danger">
					</c:when>
					<c:when test="${user.expired eq 'Y'}">
						<tr class="danger">
					</c:when>
					<c:otherwise>
						<tr>
					</c:otherwise>
				</c:choose>
					<td><div class="checkbox">
							<label> 
								<input type="checkbox" name="cbList" value="${user.uno}">
							</label>
						</div></td>
					<td><a href="/admin/users/detail/${user.uno}">${user.uname}</a></td>
					<td>${user.uphoneno}</td>
					<td>${user.udepartmentName}</td>
					<td>${user.uemail}</td>
					<td>${user.uregdate}</td>
					<c:choose>
						<c:when test="${user.enabled == 0}">
							<td class="admit"><a class="label label-warning" alt="${user.uno}">승인안됨</a></td>
						</c:when>
						<c:otherwise>
							<td class="deny"><a class="label label-success" alt="${user.uno}">승인</a></td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${user.expired eq 'Y'}">
							<td class="reco"><a class="label label-info" alt="${user.uno}">Y</a></td>
						</c:when>
						<c:otherwise>
							<td class="del"><a class="label label-danger" alt="${user.uno}">N</a></td>
						</c:otherwise>
					</c:choose>
					<td><a href="/admin/users/editForm/${user.uno}">수정</a>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div style="margin-bottom: 10px; float: right;">
		<button class="btn btn-primary" onclick="delList()">선택 회원<br>탈퇴 처리</button>
		<button class="btn btn-primary" onclick="recoverList()">선택 회원<br>복구 처리</button>
	</div>
	<div style="float: left;">
		<button class="btn btn-success" onclick="admitList()">선택 회원<br>가입 승인</button>
		<button class="btn btn-success" onclick="denyList()">선택 회원<br>가입 거절</button>
	</div>
	
	<!-- 페이징 -->
	<div align="center">
		${pageBean.pagelink}
	</div>
	
	</form>
</div>
<script type="text/javascript">
function pagelist(page) {
	$("#pageNo").val(page);
	$("#frm").get(0).action = "/admin/users";
	$("#frm").get(0).submit();
}

//문자열 공백제거 함수
String.prototype.stripspace = function() {
	return this.replace(/ /g, "");
}

//체크박스 전체선택
function checkCbAll(cbList, isChecked) {
	if (cbList) {
		if (typeof (cbList.length) == "undefined") {
			if (!cbList.disabled)
				cbList.checked = isChecked;
		} else {
			for (var i = 0; i < cbList.length; i++) {
				if (cbList[i].type.toUpperCase() == 'CHECKBOX') {
					if (cbList[i].value.stripspace() != ""
							&& !cbList[i].disabled) {
						cbList[i].checked = isChecked;
					}
				}
			}
		}
	}
}

function checkCbListAll() {
	var f = document.frm;

	if (f.isCheckCbListAll.value != "T") {
		checkCbAll(f.cbList, true);
		f.cbListAll.checked = true;
		f.isCheckCbListAll.value = "T";
	} else {
		checkCbAll(f.cbList, false);
		f.cbListAll.checked = false;
		f.isCheckCbListAll.value = "F";
	}
}

$(function() {
	var f = document.frm;
	
	$('.del > a').bind('click', function() {
		console.log($(this).attr('alt'));
		$('#uno').val($(this).attr('alt'));
		if (confirm("정말로 해당 회원을 탈퇴 처리 하시겠습니까?")) {
			f.action = "/admin/users/delete";
			f.submit();
		}
	});
	
	$('.admit > a').bind('click', function() {
		console.log($(this).attr('alt'));
		$('#uno').val($(this).attr('alt'));
		if (confirm("해당 회원을 가입 승인 처리 하시겠습니까?")) {
			f.action = "/admin/users/admit";
			f.submit();
		}
	});
	
	$('.deny > a').bind('click', function() {
		console.log($(this).attr('alt'));
		$('#uno').val($(this).attr('alt'));
		if (confirm("해당 회원을 가입 거절 처리 하시겠습니까?")) {
			f.action = "/admin/users/deny";
			f.submit();
		}
	});
	
	$('.reco > a').bind('click', function() {
		console.log($(this).attr('alt'));
		$('#uno').val($(this).attr('alt'));
		if (confirm("정말로 해당 회원을 복구 처리 하시겠습니까?")) {
			f.action = "/admin/users/recover";
			f.submit();
		}
	});
	
});

/* function delUser() {
	var f = document.frm;
	$('.del > a').bind('click', function() {
		console.log($('.del > a').attr('alt'));
	});
}

function admitUser() {
	var f = document.frm;
	$('.admit > a').bind('click', function() {
		console.log($('.admit > a').attr('alt'));
	});
}

function denyUser() {
	var f = document.frm;
	$('.deny > a').bind('click', function() {
		console.log($('.deny > a').attr('alt'));
	});
}

function recoverUser() {
	var f = document.frm;
	$('.reco > a').bind('click', function() {
		console.log($('.reco > a').attr('alt'));
	});
} */

function delList() {
	var f = document.frm;
	var items = "";

	if (!f.cbList)
		return false;

	if (typeof (f.cbList.length) == "undefined") {
		if (f.cbList.checked)
			items = f.cbList.value;
	} else {
		for (var i = 0; i < f.cbList.length; i++) {
			if (f.cbList[i].checked) {
				items += ((items) ? "," : "") + f.cbList[i].value;
			}
		}
	}

	if (items == "") {
		alert("탈퇴 처리 할 유저를 선택하세요.");
		return false;
	}

	if (confirm("정말로 해당 회원을 탈퇴 처리 하시겠습니까?")) {
		f.action = "/admin/users/delete";
		f.submit();
	}
}

function admitList() {
	var f = document.frm;
	var items = "";

	if (!f.cbList)
		return false;

	if (typeof (f.cbList.length) == "undefined") {
		if (f.cbList.checked)
			items = f.cbList.value;
	} else {
		for (var i = 0; i < f.cbList.length; i++) {
			if (f.cbList[i].checked) {
				items += ((items) ? "," : "") + f.cbList[i].value;
			}
		}
	}

	if (items == "") {
		alert("가입 승인 처리 할 유저를 선택하세요.");
		return false;
	}

	if (confirm("해당 회원을 가입 승인 처리 하시겠습니까?")) {
		f.action = "/admin/users/admit";
		f.submit();
	}
}

function denyList() {
	var f = document.frm;
	var items = "";

	if (!f.cbList)
		return false;

	if (typeof (f.cbList.length) == "undefined") {
		if (f.cbList.checked)
			items = f.cbList.value;
	} else {
		for (var i = 0; i < f.cbList.length; i++) {
			if (f.cbList[i].checked) {
				items += ((items) ? "," : "") + f.cbList[i].value;
			}
		}
	}

	if (items == "") {
		alert("가입 거절 처리 할 유저를 선택하세요.");
		return false;
	}

	if (confirm("해당 회원을 가입 거절 처리 하시겠습니까?")) {
		f.action = "/admin/users/deny";
		f.submit();
	}
}

function recoverList() {
	var f = document.frm;
	var items = "";

	if (!f.cbList)
		return false;

	if (typeof (f.cbList.length) == "undefined") {
		if (f.cbList.checked)
			items = f.cbList.value;
	} else {
		for (var i = 0; i < f.cbList.length; i++) {
			if (f.cbList[i].checked) {
				items += ((items) ? "," : "") + f.cbList[i].value;
			}
		}
	}

	if (items == "") {
		alert("탈퇴 복구할 유저를 선택하세요.");
		return false;
	}

	if (confirm("해당 회원을 탈퇴 복구 하시겠습니까?")) {
		f.action = "/admin/users/recover";
		f.submit();
	}
}
</script>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />