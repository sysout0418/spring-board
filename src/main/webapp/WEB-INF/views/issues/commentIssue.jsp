<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
<table id="commentTable" class="table table-condensed">
	<c:forEach var="comment" items="${commentList}">
		<tr id="r1" name="commentParentCode">
			<td colspan=2><input type="hidden" name="cno" id="cno"
				value="${comment.cno}"> <strong>${comment.uname}</strong><br>
				${comment.regDate}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <c:if
					test="${user_no == comment.uno}">
					<a style="cursor: pointer;" name="pEdit">수정</a> | 
					<a style="cursor: pointer;" name="pDel">삭제</a>
				</c:if>
				<p>${comment.content }</p></td>
		</tr>
	</c:forEach>
</table>
--%>
<c:forEach var="comment" items="${commentList}">
<div class="panel panel-white post">
<div class="post-heading" id="commentTable">
	<div class="pull-left image">
		<img src="http://bootdey.com/img/Content/user_1.jpg"
			class="img-circle avatar" alt="user profile image">
	</div>
	<div class="pull-left meta">
		<div class="title h5">
			<a href="#"><b>${comment.uname}</b></a> made a comment.
		</div>
		<h6 class="text-muted time">${comment.regDate}</h6>
	</div>
</div>
<div class="post-description">
	<p><span id="content" name="content">${comment.content}</span></p>
	<c:if test="${user_no == comment.uno}">
	<div class="stats" id="stat">
        <a class="btn btn-warning btn-xs" role="button" name="pEdit"><i class="fa fa-pencil"></i> Update</a>
        <a class="btn btn-theme04 btn-xs" role="button" name="pDel"><i class="fa fa-trash-o "></i> Delete</a>
        <input type="hidden" name="cno" id="cno" value="${comment.cno}">
	</div>
	</c:if>
</div>
</div>
</c:forEach>