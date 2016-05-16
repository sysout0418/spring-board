<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="comment" items="${commentList}">
	<div class="panel panel-white post">
		<div class="post-heading" id="commentTable">
			<div class="pull-left image" style="text-align: center">
				<div class="img-circle" style="background-color: ${comment.profileBgColor}; width:60px; height:60px; line-height:60px;">
					<span style="font-size: 15px; color: #E8E8E8;">${comment.theFirstLetterOfEmail}</span>
				</div>
			</div>
			<div class="pull-left meta" style="padding-left: 7px">
				<div class="title h5">
					<a href="#"><b>${comment.uname}</b></a> made a comment.
				</div>
				<h6 class="text-muted time">${comment.regDate}</h6>
			</div>
		</div>
		<div class="post-description">
			<span id="content3" name="content3">${comment.content}</span>
			<c:if test="${user_no == comment.uno}">
				<div class="stats" id="stat">
					<a class="btn btn-warning btn-xs" role="button" name="pEdit"><i
						class="fa fa-pencil"></i> Update</a> <a class="btn btn-theme04 btn-xs"
						role="button" name="pDel" data-toggle="modal" data-target="#myModal4"><i class="fa fa-trash-o"></i>
						Delete</a> <input type="hidden" name="cno" id="cno"
						value="${comment.cno}">
				</div>
			</c:if>
		</div>
	</div>
</c:forEach>