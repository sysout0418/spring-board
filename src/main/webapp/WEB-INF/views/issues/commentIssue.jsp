<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table id="commentTable" class="table table-condensed">
	<c:forEach var="comment" items="${commentList}">
		<tr id="r1" name="commentParentCode">
			<td colspan=2>
				<input type="hidden" name="cno" id="cno" value="${comment.cno}">
				<strong>${comment.uname}</strong><br>
				${comment.regDate}&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${user_no == comment.uno}">
					<a style="cursor: pointer;" name="pEdit">수정</a> | 
					<a style="cursor: pointer;" name="pDel">삭제</a>
				</c:if>
			<p>${comment.content }</p>
			</td>
		</tr>
	</c:forEach>
</table>