<%@page import="com.nbreds.projectPlanning.HomeController"%>
<%@page import="com.nbreds.projectPlanning.common.VO.User"%>
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

.layer {display:none; position:fixed; _position:absolute; top:0; left:0; width:100%; height:100%; z-index:100;}
.layer .bg {position:absolute; top:0; left:0; width:100%; height:100%; background:#000; opacity:.5; filter:alpha(opacity=50);}
.layer .pop-layer {display:block;}

.pop-layer {display:none; position: absolute; top: 50%; left: 50%; width: 410px; height:auto;  background-color:#fff; border: 5px solid #3571B5; z-index: 10;}	
.pop-layer .pop-container {padding: 20px 25px;}
.pop-layer p.ctxt {color: #666; line-height: 25px;}
.pop-layer .btn-r {width: 100%; margin:10px 0 20px; padding-top: 10px; border-top: 1px solid #DDD; text-align:right;}

a.cbtn {display:inline-block; height:25px; padding:0 14px 0; border:1px solid #304a8a; background-color:#3f5a9d; font-size:13px; color:#fff; line-height:25px;}	
a.cbtn:hover {border: 1px solid #091940; background-color:#1f326a; color:#fff;}
</style>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header_dash.jsp" />
<!-- Begin page content -->
<div style="width: 1200; margin: 0 auto; background-color: #fff">
	<h4>New Project</h4>
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
	<form:form method="POST" action="regist" id="regist" commandName="project">
		<input type="hidden" id="requestUserNoList" name="requestUserNoList" value="">
		<input type="hidden" id="requestUserNameList" name="requestUserNameList" value="">
		<table class="table">
			<tr>
				<td colspan="2" style="width: 500px; vertical-align: middle; text-align: center;" class="active">프로젝트 명</td>
				<td style="width: 300px" colspan="2"><form:input
						path="pname" class="form-control" name="projectName" required="required" maxlength="20"/></td>
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
				<td colspan="2" class="active" style="vertical-align: middle; text-align: center;">상세내용</td>
				<td colspan="2"><form:textarea path="pdetail"
						cssClass="form-control" cssStyle="height:400px" name="projectContent" required="required"/></td>
			</tr>
			<tr>
				<td colspan="2" class="active" style="vertical-align: middle; text-align: center;">모집마감일자</td>
				<td><form:input path="pduedate" id="datepicker" name="datepicker" required="required"/></td>
			</tr>
			<tr>
				<td colspan="2" class="active" style="vertical-align: middle; text-align: center;">프로젝트 요청</td>
				<!-- <td><textarea id="textarea" class="example" rows="1"></textarea></td> -->
				<td>
					<div>
						<a href="#" class="btn btn-primary btn-xs" onclick="layer_open('layer2');return false;">추가</a>
						<div class="selectedUserList">
						</div>
					</div>
					<div class="layer">
						<div class="bg"></div>
						<div id="layer2" class="pop-layer">
							<div class="pop-container">
								<div class="pop-conts">
									<!--content //-->
									<c:forEach var="user" items="${allUserList}">
										<div class="checkbox">
								        	<label>
								        		<input type="checkbox" name="userName" value="${user.uno}" alt="${user.uname}">${user.uname}
								        	</label>
							        	</div>
									</c:forEach>
									<a href="#" class="btn btn-success" id="okBtn">OK</a>
									<a href="#" class="btn btn-warning" id="closeBtn">Close</a>
									<!--// content-->
								</div>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3"></td>
			</tr>
		</table>
		<input class="btn btn-success" type="submit" id="submit" value="Create Project">
	</form:form>
</div>
<script type="text/javascript">
$(function() {
	$( "#datepicker" ).datepicker({
		altFormat : "mm/dd/yy",
		minDate: 0
	});
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

<%--
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
	$("form").validate();
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
		$("#pmember").val(uno);
	});
}
--%>
</script>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />