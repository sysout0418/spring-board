<%@page import="com.nbreds.projectPlanning.Project.VO.ProjectMemberStat"%>
<%@page import="com.nbreds.projectPlanning.HomeController"%>
<%@page import="com.nbreds.projectPlanning.common.VO.User"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	List<User> userInfoList = HomeController.USER_INFO;
	List<ProjectMemberStat> participatedUserList = (List<ProjectMemberStat>) request
			.getAttribute("participatedUserList");
%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_dash.jsp" />
<style>
.layer {
	display: none;
	position: fixed;
	_position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 100;
}

.layer .bg {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: .5;
	filter: alpha(opacity = 50);
}

.layer .pop-layer {
	display: block;
}

.pop-layer {
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 410px;
	height: auto;
	background-color: #fff;
	border: 5px solid #3571B5;
	z-index: 10;
}

.pop-layer .pop-container {
	padding: 20px 25px;
}

.pop-layer p.ctxt {
	color: #666;
	line-height: 25px;
}

.pop-layer .btn-r {
	width: 100%;
	margin: 10px 0 20px;
	padding-top: 10px;
	border-top: 1px solid #DDD;
	text-align: right;
}

a.cbtn {
	display: inline-block;
	height: 25px;
	padding: 0 14px 0;
	border: 1px solid #304a8a;
	background-color: #3f5a9d;
	font-size: 13px;
	color: #fff;
	line-height: 25px;
}

a.cbtn:hover {
	border: 1px solid #091940;
	background-color: #1f326a;
	color: #fff;
}
</style>
<!-- Begin page content -->
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3>
			<i class="fa fa-angle-right"></i> Edit Project
		</h3>
		<div class="col-lg-12">
    			<div class="row">
            		<div class="col-md-12">
                		<div class="content-panel">
		<p>
			<strong>담당자 정보</strong>
		</p>
		<table class="table">
			<tr>
				<td style="width: 200px;">담당자명</td>
				<td style="width: 350px">${user.uname}</td>
				<td style="width: 200px;">부서</td>
				<td>${user.udepartment}</td>
			</tr>
			<tr>
				<td>담당자 연락처</td>
				<td>${user.uphoneno}</td>
				<td>담당자 이메일</td>
				<td>${user.uemail}</td>
			</tr>
			<tr>
				<td colspan="4"></td>
			</tr>
		</table>

		<p>
			<strong>프로젝트 키워드</strong>
		</p>
		<form:form method="POST" action="update" commandName="project">
			<%-- <input type="hidden" id="pmember" name="pmember" value="${project.pmember }"> --%>
			<input type="hidden" id="requestUserNoList" name="requestUserNoList"
				value="">
			<input type="hidden" id="requestUserNameList"
				name="requestUserNameList" value="">
			<table class="table">
				<tr>
					<td colspan="2" style="width: 500px">프로젝트 명</td>
					<td style="width: 300px" colspan="2"><form:input path="pname"
							class="form-control" required="required" /></td>
				</tr>
				<tr>
					<td rowspan="3" style="width: 100px">기본분야</td>
					<td style="width: 200px">개발</td>
					<td colspan="2"><form:checkboxes path="pdevelopment"
							items="${development}" itemValue="CODE" itemLabel="CODE_NAME" />
					</td>
				</tr>
				<tr>
					<td>디자인/퍼블리싱</td>
					<td colspan="2"><form:checkboxes path="pdesign"
							items="${design}" itemValue="CODE" itemLabel="CODE_NAME" /></td>
				</tr>
				<tr>
					<td>기획/컨설턴트</td>
					<td colspan="2"><form:checkboxes path="pplanning"
							items="${planning}" itemValue="CODE" itemLabel="CODE_NAME" /></td>
				</tr>
				<%-- <tr>
				<td colspan="2">전문분야/특별경험</td>
				<td colspan="2"><form:checkboxes path="pexperience"
						items="${experience}" itemValue="CODE" itemLabel="CODE_NAME" />
				</td>
			</tr> --%>
				<tr>
					<td colspan="2">상세내용</td>
					<td colspan="2"><form:textarea path="pdetail"
							cssClass="form-control" cssStyle="height:400px"
							required="required" /></td>
				</tr>
				<%-- <tr>
				<td colspan="2">등급</td>
				<td><form:select path="plevel" items="${level}"
						itemValue="CODE" itemLabel="CODE_NAME" required="required"/></td>
			</tr> --%>
				<tr>
					<td colspan="2">모집마감일자</td>
					<td><form:input path="pduedate" id="datepicker"
							required="required" /></td>
				</tr>
				<tr>
					<td colspan="2">프로젝트 요청</td>
					<td>
						<div>
							<a href="#" class="btn btn-primary btn-xs"
								onclick="layer_open('layer2');return false;">변경</a>
							<div class="selectedUserList">
								<c:forEach var="participate" items="${participatedUserList}">
									<span class="btn btn-warning btn-xs">${participate.uname}</span>&nbsp;
							</c:forEach>
							</div>
						</div>
						<div class="layer">
							<div class="bg"></div>
							<div id="layer2" class="pop-layer">
								<div class="pop-container">
									<div class="pop-conts">
										<!--content //-->
										<c:forEach var="users" items="${allUserList}">
											<div class="checkbox">
												<label> <input type="checkbox" name="userName"
													value="${users.uno}" alt="${users.uname}">${users.uname}
												</label>
											</div>
										</c:forEach>
										<a href="#" class="btn btn-success" id="okBtn">OK</a> <a
											href="#" class="btn btn-warning" id="closeBtn">Close</a>
										<!--// content-->
									</div>
								</div>
							</div>
						</div> <!-- <textarea id="textarea" class="example" rows="3"></textarea> -->
					</td>
				</tr>
				<tr>
					<td colspan="3"><input type="hidden" id="pno" name="pno"
						value="${project.pno}" /> <input type="hidden" id="pprogress"
						name="pprogress" value="${project.pprogress}" /></td>
				</tr>
			</table>
			<input class="btn btn-success" type="submit" id="submit"
				value="Save Changes">
			<!-- 테스트용 버튼 (지워도 됨) -->
			<!-- <div align="center">
			<input class="btn btn-primary btn-lg" type="button" id="test" value="테스트">
		</div> -->
		</form:form>
		</div>
		</div>
		</div>
		</div>
	</section>
</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript">
$(function() {
	$( "#datepicker" ).datepicker({
		altField: "#datepicker",
		minDate: 0,
		onSelect: function(date){
			$('#date').val(date);
		}
	});
	
	var chk = document.getElementsByName("userName"); // 체크박스 객체
	for (var i = 0; i < chk.length; i++) {
		<%if (participatedUserList != null) {
				for (int j = 0; j < participatedUserList.size(); j++) {%>
				if ('<%=participatedUserList.get(j).getUname()%>' == chk[i].alt) {
					chk[i].checked = true;
				}
			<%}
			}%>
	}
	
});

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

$('#okBtn').click(function(e){
	$('.layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
	console.log("안녕?");
	selectChkRow();
	if ($('#requestUserList').val() != '' && $('#requestUserNameList').val() != '') {
		$('.selectedUserList').empty();
		var userName = $('#requestUserNameList').val().split(",");
		for (var i = 0; i < userName.length; i++) {
			$('.selectedUserList').append('<span class="btn btn-warning btn-xs">'+ userName[i] +'</span>&nbsp;');
		}
	} else {
		$('.selectedUserList').empty();
	}
	e.preventDefault();
});

function selectChkRow() {
	var chk = document.getElementsByName("userName"); // 체크박스객체를 담는다
	var len = chk.length;	// 체크박스의 전체 개수
	var checkRow = '';		// 체크된 체크박스의 value를 담기위한 변수
	var checkText = '';		// 체크된 체크박스의 text를 담기위한 변수
	var checkCnt = 0;		// 체크된 체크박스의 개수
	var checkLast = '';		// 체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
	var rowid = '';			// 체크된 체크박스의 모든 value 값을 담는다
	var rowName = '';		// 체크된 체크박스의 모든 text 값을 담는다
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
			checkText = chk[i].alt;
			if (checkCnt == 1) {				//체크된 체크박스의 개수가 한 개 일때,
				rowid += checkRow;				// value의 형태 (뒤에 ,(콤마)가 붙지않게)
				rowName += checkText;
			} else if(i == checkLast) {			//체크된 체크박스 중 마지막 체크박스일 때,
				rowid += checkRow;  			//value의 형태 (뒤에 ,(콤마)가 붙지않게)
				rowName += checkText;
			} else {
				rowid += checkRow + ",";		//value,의 형태 (뒤에 ,(콤마)가 붙게)
				rowName += checkText + ",";
			}
		}
		cnt++;
		checkRow = '';	// checkRow초기화.
		checkText = '';	// checkText초기화.
	}
	$('#requestUserNoList').val(rowid);
	$('#requestUserNameList').val(rowName);
	//alert(rowName);
	//alert(rowid);
}

<%-- $(function () {
	var pmember = $("#pmember").val().substring(0, $("#pmember").val().length - 1).split(",");
	var userNames = "";
	var splitedUserNames = {};
	if (pmember.length > 0)	{
	<% for (int i = 0; i < userInfoList.size(); i++) { %>
		for (var j = 0; j < pmember.length; j++) {
			if (pmember[j] != null) {
				if (pmember[j] == <%= userInfoList.get(i).getUno() %>) {								
					userNames += "<%= userInfoList.get(i).getUname() + "," %>"
				}
			}
		}
	<% } %>
	}
	splitedUserNames = userNames.substring(0, userNames.length - 1).split(",");
	console.log(pmember);
	console.log(userNames);
	console.log(splitedUserNames);
	$(".text-tags").empty();
	if (!userNames == "") {
		for (var i = 0; i < splitedUserNames.length; i++) {
			$(".text-tags").append('<div class="text-tag"><div class="text-button"><span class="text-label">' 
					+ splitedUserNames[i] + '</span><a class="text-remove"></a><br><br><br><br><br></div></div>');
		}
	}
}); --%>

/* $('#textarea')
      .textext({
          plugins : 'autocomplete filter tags ajax',
          ajax : {
              url : '/nameList',
              dataType : 'json',
              cacheResults : true
          }
      }); */
  
/* $(function () {
	$('#submit').click(handler);
	$("form").validate();
}); */
  
/* $(function () {
	$(".text-remove").click(handler);
}); */
  
<%-- function handler() {
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
}	 --%>
</script>