<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header_dash.jsp" />
<!-- Begin page content -->
<div style="width: 1200; margin: 0 auto; background-color: #fff">
	<h4>Users</h4>
	<form name="frm" id="frm" method="post">
	<input type="hidden" name="isCheckCbListAll" value="F">
	<table class="table table-striped table-hover ">
		<thead>
			<tr>
				<th><div class="checkboxAll">
						<label> 
							<input type="checkbox" name="cbListAll" onclick="checkCbListAll()">
						</label>
					</div></th>
				<th>name</th>
				<th>phone number</th>
				<th>department</th>
				<th>email</th>
				<th>registered date</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${allUserList}">
				<tr>
					<td><div class="checkbox">
							<label> 
								<input type="checkbox" name="cbList" value="${user.uno}">
							</label>
						</div></td>
					<td><a href="회원정보 수정 URL">${user.uname}</a></td>
					<td>${user.uphoneno}</td>
					<td>${user.udepartmentName}</td>
					<td>${user.uemail}</td>
					<td>${user.uregdate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</form>
	<a href="#" class="btn btn-danger">회원 강제탈퇴</a>
</div>
<script type="text/javascript">
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
		alert("삭제 선택");
		return false;
	}

	if (confirm("삭제?")) {
		f.action = "URL";
		f.submit();
	}
}
</script>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />