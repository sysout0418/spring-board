<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link href="<c:url value="/resources/css/select.min.css" />"
	rel="stylesheet" type="text/css" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header2_header.jsp" />
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header3_menu_dash.jsp" />
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->
<section id="main-content">
	<section class="wrapper site-min-height">
		<h3>
			<i class="fa fa-angle-right"></i> New Project
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
								<td style="width: 200px;" class="active">담당자명</td>
								<td style="width: 350px">${user.uname}</td>
								<td style="width: 200px;" class="active">부서</td>
								<td>${user.CODE_NAME}</td>
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
						<form:form method="POST" action="regist" id="regist"
							commandName="project">
							<input type="hidden" id="requestUserNoList"
								name="requestUserNoList" value="">
							<input type="hidden" id="requestUserNameList"
								name="requestUserNameList" value="">
							<form:input type="hidden" path="pamount" class="form-control" id="pamount"
								name="pamount" value="0" />
							<form:input type="hidden" path="lno" id="lno" class="form-control"
								name="lno" value="2" />
							<table class="table">
								<tr>
									<td colspan="2"
										style="width: 500px; vertical-align: middle; text-align: center;"
										class="active">프로젝트 명</td>
									<td style="width: 300px" colspan="2"><form:input
											path="pname" class="form-control" name="projectName"
											required="required" maxlength="100" /></td>
								</tr>
								<tr>
									<td rowspan="3"
										style="width: 100px; vertical-align: middle; text-align: center;"
										class="active">기본분야</td>
									<td
										style="width: 200px; vertical-align: middle; text-align: center;"
										class="active">개발</td>
									<td colspan="2"><form:checkboxes path="pdevelopment"
											items="${development}" itemValue="CODE" itemLabel="CODE_NAME" /></td>
								</tr>
								<tr>
									<td class="active"
										style="vertical-align: middle; text-align: center;">디자인/퍼블리싱</td>
									<td colspan="2"><form:checkboxes path="pdesign"
											items="${design}" itemValue="CODE" itemLabel="CODE_NAME" /></td>
								</tr>
								<tr>
									<td class="active"
										style="vertical-align: middle; text-align: center;">기획/컨설턴트</td>
									<td colspan="2"><form:checkboxes path="pplanning"
											items="${planning}" itemValue="CODE" itemLabel="CODE_NAME" /></td>
								</tr>
								<tr>
									<td colspan="2" class="active"
										style="vertical-align: middle; text-align: center;">상세내용</td>
									<td colspan="2"><form:textarea path="pdetail"
											cssClass="form-control" cssStyle="height:400px"
											name="projectContent" required="required" /></td>
								</tr>
								<tr>
									<td colspan="2" class="active"
										style="vertical-align: middle; text-align: center;">수주 금액</td>
									<td>
										<div>
											<div class="radio">
												<span>단위&nbsp;&nbsp;&nbsp;</span> <label> <input
													type="radio" name="optionsRadios" id="radio1" value="원"
													checked=""> <span>없음&nbsp;&nbsp;&nbsp;</span>
												</label> <label> <input type="radio" name="optionsRadios"
													id="radio2" value="만"> <span>만&nbsp;&nbsp;&nbsp;</span>
												</label> <label> <input type="radio" name="optionsRadios"
													id="radio3" value="억"> <span>억&nbsp;&nbsp;&nbsp;</span>
												</label>

											</div>
										</div>
										<div>
											<input type="text" id="pAmount2" name="pAmount2" value=""
												onkeyup="separator()" maxlength="19" required="required">
											<span id="unit">원</span>&nbsp;&nbsp;&nbsp;
											<button type="button" id="10" class="btn btn-default btn-xs">+10</button>
											&nbsp;
											<button type="button" id="50" class="btn btn-default btn-xs">+50</button>
											&nbsp;
											<button type="button" id="100" class="btn btn-default btn-xs">+100</button>
											&nbsp;
											<button type="button" id="500" class="btn btn-default btn-xs">+500</button>
											&nbsp;
											<button type="button" id="1000"
												class="btn btn-default btn-xs">+1000</button>
											&nbsp;
											<button type="button" id="eraser"
												class="btn btn-default btn-xs">초기화</button>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="active"
										style="vertical-align: middle; text-align: center;">라벨</td>
									<td>
										<div class="btn-group">
											<a class="btn btn-default btn-width"
												style="text-align: left;"><span id="selectedLabel">Select
													Weight</span></a> <a class="btn btn-default dropdown-toggle"
												data-toggle="dropdown"><span class="caret"
												style="height: 10px; margin-top: 10px;"></span></a>
											<ul class="dropdown-menu">
												<c:forEach var="labels" items="${labels}" varStatus="status">
													<li class="labelNo"><a alt="${labels.lno}">${labels.ltitle}</a></li>
												</c:forEach>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="active"
										style="vertical-align: middle; text-align: center;">모집마감일자</td>
									<td><form:input path="pduedate" id="datepicker"
											name="datepicker" required="required" /></td>
								</tr>
								<tr>
									<td colspan="2" class="active"
										style="vertical-align: middle; text-align: center;">프로젝트
										요청 멤버</td>
									<td><form:select cssClass="select2_multiple form-control"
											path="requestMember" items="${allUserList}" itemLabel="uname"
											itemValue="uno"></form:select></td>
								</tr>
							</table>
							<input class="btn btn-warning" type="submit" id="submit"
								value="Create Project">
							<!-- <input class="btn btn-warning" type="button" id="test"
								value="test"> -->
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />
<script>
	jQuery.fn.center = function () {
	    this.css("position","absolute");
	    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 3) + $(window).scrollTop()) + "px");
	    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
	    this.css("z-index", "9001");
	    return this;
	}

	$(function() {
		$("#datepicker").datepicker({
			altFormat : "mm/dd/yy",
			minDate : 0
		});
	});

	function separator() {
		var amount = $('#pAmount2').val();
		amount.replaceAll(",", "");
		$('#pAmount2').val(Number(amount.replaceAll(",", "")).toLocaleString());
	}

	// replaceAll prototype 선언
	String.prototype.replaceAll = function(org, dest) {
		return this.split(org).join(dest);
	}

	$(document).ready(
			function() {
				$('#radio1').click(function() {
					$('#pAmount2').val('');
					var val = $(this).val();
					$('#unit').text(val);
				});

				$('#radio2').click(function() {
					$('#pAmount2').val('');
					var val = $(this).val();
					$('#unit').text(val);
				});

				$('#radio3').click(function() {
					$('#pAmount2').val('');
					var val = $(this).val();
					$('#unit').text(val);
				});

				$('#10').click(
						function() {
							var ten = 10;
							if ($('#pAmount2').val() == '') {
								$('#pAmount2').val(ten);
								separator();
							} else if ($('#pAmount2').val() != '') {
								var nowVal = $('#pAmount2').val();
								$('#pAmount2').val('');
								var calculateVal = Number(nowVal.replaceAll(
										",", ""))
										+ ten;
								console.log(calculateVal);
								$('#pAmount2').val(calculateVal);
								separator();
							}
						});

				$('#50').click(
						function() {
							var fifty = 50;
							if ($('#pAmount2').val() == '') {
								$('#pAmount2').val(fifty);
								separator();
							} else if ($('#pAmount2').val() != '') {
								var nowVal = $('#pAmount2').val();
								$('#pAmount2').val('');
								var calculateVal = Number(nowVal.replaceAll(
										",", ""))
										+ fifty;
								console.log(calculateVal);
								$('#pAmount2').val(calculateVal);
								separator();
							}
						});

				$('#100').click(
						function() {
							var hundred = 100;
							if ($('#pAmount2').val() == '') {
								$('#pAmount2').val(hundred);
								separator();
							} else if ($('#pAmount2').val() != '') {
								var nowVal = $('#pAmount2').val();
								$('#pAmount2').val('');
								var calculateVal = Number(nowVal.replaceAll(
										",", ""))
										+ hundred;
								console.log(calculateVal);
								$('#pAmount2').val(calculateVal);
								separator();
							}
						});

				$('#500').click(
						function() {
							var fiveHundred = 500;
							if ($('#pAmount2').val() == '') {
								$('#pAmount2').val(fiveHundred);
								separator();
							} else if ($('#pAmount2').val() != '') {
								var nowVal = $('#pAmount2').val();
								$('#pAmount2').val('');
								var calculateVal = Number(nowVal.replaceAll(
										",", ""))
										+ fiveHundred;
								console.log(calculateVal);
								$('#pAmount2').val(calculateVal);
								separator();
							}
						});

				$('#1000').click(
						function() {
							var thousand = 1000;
							if ($('#pAmount2').val() == '') {
								$('#pAmount2').val(thousand);
								separator();
							} else if ($('#pAmount2').val() != '') {
								var nowVal = $('#pAmount2').val();
								$('#pAmount2').val('');
								var calculateVal = Number(nowVal.replaceAll(
										",", ""))
										+ thousand;
								console.log(calculateVal);
								$('#pAmount2').val(calculateVal);
								separator();
							}
						});

				$('#eraser').click(function() {
					$('#pAmount2').val('');
				});

				$('#submit').click(function() {
					
					var status = $('#unit').text();
					var amount = $('#pAmount2').val();
					var realAmount = '';
					console.log(status);
					console.log(amount);
					if (status == '원') {
						realAmount = amount.replaceAll(",", "");
					} else if (status == '만') {
						realAmount = amount.replaceAll(",", "") + "0000";
					} else if (status == '억') {
						realAmount = amount.replaceAll(",", "") + "00000000";
					}
					console.log(Number(realAmount));
					console.log(Number(realAmount).toLocaleString());

					$('#pamount').val(Number(realAmount).toLocaleString());
					
					$('html').append('<div id="mask" style="position: absolute; left:0; top:0; z-index:9000; background-color:#000; display:none;"></div>');
					$('body').after('<div id="progressBar" data-loader="timer" style="display: none;"></div>');
					
					showProgressBar();
					wrapWindowByMask();
					
				});

				$('.dropdown-menu > .labelNo > a').bind('click', function() {
					var lTitle = $(this).text();
					var lno = $(this).attr("alt");
					console.log(lno);
					$("#lno").val(lno);
					$("#selectedLabel").text(lTitle);
				});
				
			});
	
	
	function wrapWindowByMask() {
		//화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();  
		var maskWidth = $(window).width();  

		//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$('#mask').css({'width': maskWidth, 'height': maskHeight});  

		//애니메이션 효과
		$('#mask').fadeIn(100);      
		$('#mask').fadeTo("slow", 0.8);    
	}
	
	function showProgressBar() {
		$("#progressBar").show();
		$("#progressBar").center();
	}
</script>