<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					title="" data-container="body" data-original-title="" alt="${label.lbgcolor}${label.ltitle}">${label.ltitle}</span>
				<div class="pull-right">
					<button class="btn btn-primary btn-xs">
						<i class="fa fa-pencil"></i>
					</button>
					<button class="btn btn-danger btn-xs">
						<i class="fa fa-trash-o "></i>
					</button>
				</div>
			</div>
		</li>
	</c:forEach>
	<li id="newLabelForm" style="display: none;">
		<div class="form-inline">
			<div class="form-group">
				<label class="sr-only" for="labelTitle">Label Title</label> 
				<input type="text" class="form-control" id="labelTitle"
					placeholder="Label Title" maxlength="15">
			</div>
			&nbsp;&nbsp;&nbsp;
			<div class="form-group">
				<label class="sr-only" for="labelColor">Label Color</label>
				<input type="text" class="form-control" id="labelColor"
					placeholder="Label Color" maxlength="7">
			</div>
		</div>
	</li>
</ul>