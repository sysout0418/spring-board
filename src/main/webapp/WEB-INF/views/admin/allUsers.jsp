<%@page import="com.nbreds.projectPlanning.common.VO.User"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header_dash.jsp" />
<jsp:useBean id="pageBean" class="com.nbreds.projectPlanning.common.util.PageBean" scope="request" />
<% List<User> allUserList2 = (List<User>) request.getAttribute("allUserList2"); %>
<style>
.layer {display:none; position:fixed; _position:absolute; top:0; left:0; width:100%; height:100%; z-index:100;}
.layer .bg {position:absolute; top:0; left:0; width:100%; height:100%; background:#000; opacity:.5; filter:alpha(opacity=50);}
.layer .pop-layer {display:block;}

.pop-layer {display:none; position: absolute; top: 50%; left: 50%; width: 400px; height: auto;  background-color:#fff; border: 5px solid #3571B5; z-index: 10;}	
.pop-layer .pop-container {padding: 20px 25px;}
.pop-layer p.ctxt {color: #666; line-height: 25px;}
.pop-layer .btn-r {width: 100%; margin:10px 0 20px; padding-top: 10px; border-top: 1px solid #DDD; text-align:right;}

a.cbtn {display:inline-block; height:25px; padding:0 14px 0; border:1px solid #304a8a; background-color:#3f5a9d; font-size:13px; color:#fff; line-height:25px;}	
a.cbtn:hover {border: 1px solid #091940; background-color:#1f326a; color:#fff;}
</style>
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
					<td class="getUserName"><a href="#" onclick="layer_open('layer2');return false;" alt="${user.uno}">${user.uname}</a></td>
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
					<td class="getUserNo">
					<a href="#" class="btn btn-round btn-info btn-xs" alt="${user.uno}">수정</a></td>
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
	
	<div class="layer">
		<div class="bg"></div>
		<div id="layer2" class="pop-layer">
			<div class="pop-container">
				<div class="pop-conts">
					<!--content //-->
					<div class="sp-title">
						<h3></h3>
					</div>
					<p class="uphoneno"><i class="fa fa-user"></i></p>
					<p class="udepartment"><i class="fa fa-user"></i></p>
					<p class="uemail"><i class="fa fa-user"></i></p>
					<p class="uregdate"><i class="fa fa-user"></i></p>
					<p class="isAdmit"><i class="fa fa-user"></i></p>
					<p class="isDel"><i class="fa fa-user"></i></p>
						
					<a href="#" class="btn btn-warning" id="closeBtn">Close</a>
					<!--// content-->
				</div>
			</div>
		</div>
	</div>
	
	<!-- <div class="showback">
	<button class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">
		</button>
						
		Modal
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel"></h4>
					</div>
					<div class="modal-body">
						<div class="col-lg-4 col-md-4 col-sm-4 mb">
							<div class="content-panel pn">
								<div id="spotify">
									<div class="col-xs-4 col-xs-offset-8">
										<button class="btn btn-sm btn-clear-g">FOLLOW</button>
									</div>
									<div class="sp-title">
										<h3></h3>
									</div>
									<div class="play">
										<i class="fa fa-play-circle"></i>
									</div>
								</div>
								<p class="uphoneno"><i class="fa fa-user"></i>폰번호<br> 부서</p>
								<p class="udepartment"><i class="fa fa-user"></i>부서</p>
								<p class="uemail"><i class="fa fa-user"></i>메일</p>
								<p class="uregdate"><i class="fa fa-user"></i>가입신청일</p>
								<p class="isAdmit"><i class="fa fa-user"></i>가입승인여부</p>
								<p class="isDel"><i class="fa fa-user"></i>탈퇴여부</p>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save changes</button>
					</div>
				</div>
			</div>
		</div>      				
	</div> --><!-- /showback -->
      				
</div>
<script type="text/javascript">
function pagelist(page) {
	$("#pageNo").val(page);
	$("#frm").get(0).action = "/admin/users";
	$("#frm").get(0).submit();
}

function layer_open(el){

	var temp = $('#' + el);
	var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

	if(bg){
		$('.layer').fadeIn();	//'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
	}else{
		temp.fadeIn();
	}

	// 화면의 중앙에 레이어를 띄운다.
	if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
	else temp.css('top', '0px');
	if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
	else temp.css('left', '0px');

	temp.find('#closeBtn').click(function(e){
		if(bg){
			$('.layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
		}else{
			temp.fadeOut();
		}
		e.preventDefault();
	});
	
	$('.layer .bg').click(function(e){	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
		$('.layer').fadeOut();
		e.preventDefault();
	});

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
	
	$('.getUserName > a').bind('click', function() {
		console.log($(this).text());
		var uno = $(this).attr("alt");
		//$('#myModalLabel').text($(this).text() + " 님 회원정보");
		<% for (int i = 0; i < allUserList2.size(); i++) { %>
				if (uno == '<%= allUserList2.get(i).getUno() %>') {
					$('.pop-conts > .sp-title > h3').text("<%= allUserList2.get(i).getUname() %>" + " 님의 회원정보");
					$('.pop-conts > .uphoneno > i').text("휴대폰 번호 : " + "<%= allUserList2.get(i).getUphoneno() %>");
					$('.pop-conts > .udepartment > i').text("부서명 : " + "<%= allUserList2.get(i).getUdepartmentName() %>");
					$('.pop-conts > .uemail > i').text("메일 주소 : " + "<%= allUserList2.get(i).getUemail() %>");
					$('.pop-conts > .uregdate > i').text("가입 신청일 : " + "<%= allUserList2.get(i).getUregdate() %>");
					if ("<%= allUserList2.get(i).getEnabled() %>" == 1) {
						$('.pop-conts > .isAdmit > i').text("가입 승인 여부 : 승인");
					} else {
						$('.pop-conts > .isAdmit > i').text("가입 승인 여부 : 승인 안됨");
					}
					if ("<%= allUserList2.get(i).getExpired() %>" == "Y") {
						$('.pop-conts > .isDel > i').text("탈퇴 여부 : 탈퇴함");
					} else {
						$('.pop-conts > .isDel > i').text("탈퇴 여부 : 탈퇴 안함");
					}
				}
		<% } %>
		
	});
	
	$('.getUserNo > a').bind('click', function() {
		var uno = $(this).attr("alt");
		console.log(uno);
		f.action = "/admin/users/editForm/" + uno;
		f.submit();
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