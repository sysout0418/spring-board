<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <ul class="nav nav-tabs">
	<li class="<c:if test="${index == 0}">active</c:if>"><a href="#a" data-toggle="tab"
		aria-expanded="true">전체</a></li>
	<li class="<c:if test="${index == 1}">active</c:if>"><a href="#b" data-toggle="tab"
		aria-expanded="false">경영지원팀</a></li>
	<li class="<c:if test="${index == 2}">active</c:if>"><a href="#c" data-toggle="tab"
		aria-expanded="false">SCBS사업팀</a></li>
	<li class="<c:if test="${index == 3}">active</c:if>"><a href="#d" data-toggle="tab"
		aria-expanded="false">SCBS전략팀</a></li>
	<li class="<c:if test="${index == 4}">active</c:if>"><a href="#e" data-toggle="tab"
		aria-expanded="false">SCBS해외사업팀</a></li>
	<li class="<c:if test="${index == 5}">active</c:if>"><a href="#f" data-toggle="tab"
		aria-expanded="false">Hardware개발팀</a></li>
	<li class="<c:if test="${index == 6}">active</c:if>"><a href="#g" data-toggle="tab"
		aria-expanded="false">중국지사</a></li>
	<li class="<c:if test="${index == 7}">active</c:if>"><a href="#h" data-toggle="tab"
		aria-expanded="false">Software개발팀</a></li>
	<li class="<c:if test="${index == 8}">active</c:if>"><a href="#i" data-toggle="tab"
		aria-expanded="false">서비스기획팀</a></li>
	<li class="<c:if test="${index == 9}">active</c:if>"><a href="#j" data-toggle="tab"
		aria-expanded="false">UI/UX팀</a></li>
</ul> --%>

<c:set var="doneLoop" value="false"/>
<div class="tab-pane fade 
	<c:choose>
		<c:when test="${index == 0}">active in</c:when>
		<c:when test="${empty index}">active in</c:when>
	</c:choose>" id="a">
	<c:forEach var="user" items="${allUserList}">
		<div class="checkbox">
			<label> <input type="checkbox" name="userName"
				value="${user.uno}" alt="${user.uname}"
				<c:if test="${user.isChecked}">
					checked="checked"
				</c:if>
				>${user.uname}
			</label>
		</div>
	</c:forEach>
</div>
<div class="tab-pane fade <c:if test="${index == 1}">active in</c:if>" id="b">
	<c:forEach var="user" items="${allUserList}">
		<c:choose>
			<c:when test="${user.udepartment == 000}">
				<div class="checkbox">
					<label> <input type="checkbox" name="userName"
						value="${user.uno}" alt="${user.uname}"
						<c:if test="${user.isChecked}">
							checked="checked"
						</c:if>
						>${user.uname}
					</label>
				</div>
			</c:when>
		</c:choose>
	</c:forEach>
</div>
<div class="tab-pane fade <c:if test="${index == 2}">active in</c:if>" id="c">
	<c:forEach var="user" items="${allUserList}">
		<c:choose>
			<c:when test="${user.udepartment == 001}">
				<div class="checkbox">
					<label> <input type="checkbox" name="userName"
						value="${user.uno}" alt="${user.uname}"
						<c:if test="${user.isChecked}">
							checked="checked"
						</c:if>
						>${user.uname}
					</label>
				</div>
			</c:when>
		</c:choose>
	</c:forEach>
</div>
<div class="tab-pane fade <c:if test="${index == 3}">active in</c:if>" id="d">
	<c:forEach var="user" items="${allUserList}">
		<c:choose>
			<c:when test="${user.udepartment == 002}">
				<div class="checkbox">
					<label> <input type="checkbox" name="userName"
						value="${user.uno}" alt="${user.uname}"
						<c:if test="${user.isChecked}">
							checked="checked"
						</c:if>
						>${user.uname}
					</label>
				</div>
			</c:when>
		</c:choose>
	</c:forEach>
</div>
<div class="tab-pane fade <c:if test="${index == 4}">active in</c:if>" id="e">
	<c:forEach var="user" items="${allUserList}">
		<c:choose>
			<c:when test="${user.udepartment == 003}">
				<div class="checkbox">
					<label> <input type="checkbox" name="userName"
						value="${user.uno}" alt="${user.uname}"
						<c:if test="${user.isChecked}">
							checked="checked"
						</c:if>
						>${user.uname}
					</label>
				</div>
			</c:when>
		</c:choose>
	</c:forEach>
</div>
<div class="tab-pane fade <c:if test="${index == 5}">active in</c:if>" id="f">
	<c:forEach var="user" items="${allUserList}">
		<c:choose>
			<c:when test="${user.udepartment == 004}">
				<div class="checkbox">
					<label> <input type="checkbox" name="userName"
						value="${user.uno}" alt="${user.uname}"
						<c:if test="${user.isChecked}">
							checked="checked"
						</c:if>
						>${user.uname}
					</label>
				</div>
			</c:when>
		</c:choose>
	</c:forEach>
</div>
<div class="tab-pane fade <c:if test="${index == 6}">active in</c:if>" id="g">
	<c:forEach var="user" items="${allUserList}">
		<c:choose>
			<c:when test="${user.udepartment == 005}">
				<div class="checkbox">
					<label> <input type="checkbox" name="userName"
						value="${user.uno}" alt="${user.uname}"
						<c:if test="${user.isChecked}">
							checked="checked"
						</c:if>
						>${user.uname}
					</label>
				</div>
			</c:when>
		</c:choose>
	</c:forEach>
</div>
<div class="tab-pane fade <c:if test="${index == 7}">active in</c:if>" id="h">
	<c:forEach var="user" items="${allUserList}">
		<c:choose>
			<c:when test="${user.udepartment == 006}">
				<div class="checkbox">
					<label> <input type="checkbox" name="userName"
						value="${user.uno}" alt="${user.uname}"
						<c:if test="${user.isChecked}">
							checked="checked"
						</c:if>
						>${user.uname}
					</label>
				</div>
			</c:when>
		</c:choose>
	</c:forEach>
</div>
<div class="tab-pane fade <c:if test="${index == 8}">active in</c:if>" id="i">
	<c:forEach var="user" items="${allUserList}">
		<c:choose>
			<c:when test="${user.udepartment == 007}">
				<div class="checkbox">
					<label> <input type="checkbox" name="userName"
						value="${user.uno}" alt="${user.uname}"
						<c:if test="${user.isChecked}">
							checked="checked"
						</c:if>
						>${user.uname}
					</label>
				</div>
			</c:when>
		</c:choose>
	</c:forEach>
</div>
<div class="tab-pane fade <c:if test="${index == 9}">active in</c:if>" id="j">
	<c:forEach var="user" items="${allUserList}">
		<c:choose>
			<c:when test="${user.udepartment == 008}">
				<div class="checkbox">
					<label> <input type="checkbox" name="userName"
						value="${user.uno}" alt="${user.uname}"
						<c:if test="${user.isChecked}">
							checked="checked"
						</c:if>
						>${user.uname}
					</label>
				</div>
			</c:when>
		</c:choose>
	</c:forEach>
</div>