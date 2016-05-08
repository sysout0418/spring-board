<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="tab-pane fade active in" id="a">
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
<div class="tab-pane fade" id="b">
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
<div class="tab-pane fade" id="c">
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
<div class="tab-pane fade" id="d">
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
<div class="tab-pane fade" id="e">
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
<div class="tab-pane fade" id="f">
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
<div class="tab-pane fade" id="g">
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
<div class="tab-pane fade" id="h">
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
<div class="tab-pane fade" id="i">
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
<div class="tab-pane fade" id="j">
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