<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<ul class="task-list">
	<c:forEach var="label" items="${labelList}">
		<li class="">
			<div class="task-checkbox">
				<input type="checkbox" class="list-child" value="${label.lno}"
					name="checkList">
			</div>
			<div class="task-title">
				<span class="label color-label has_tooltip task-title-sp"
					style="background-color: ${label.lbgcolor}; color: #FFFFFF"
					title="" data-container="body" data-original-title=""
					alt="${label.lbgcolor}${label.ltitle}">${label.ltitle}</span>
				<div class="pull-right">
					<button class="btn btn-primary btn-xs"
						alt="${label.lno},${label.ltitle},${label.lbgcolor}"
						id="editLabelBtn2" data-toggle="modal" data-target="#myModal2">
						<i class="fa fa-pencil"></i>
					</button>
					<button class="btn btn-danger btn-xs" alt="${label.lno}"
						id="deleteLabelBtn2" data-toggle="modal" data-target="#myModal5">
						<i class="fa fa-trash-o "></i>
					</button>
				</div>
			</div>
		</li>
	</c:forEach>
</ul>