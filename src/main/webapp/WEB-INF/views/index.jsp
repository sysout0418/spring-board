<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header_dash.jsp"/>
<!-- Begin page content -->
<div style="width:1200; margin:0 auto; background-color: #fff">
<h4>MyProjects</h4>
<form class="form-inline">
	<input type="text" class="form-control" id="search" name="search" placeholder="Filter by name" style="width:1050px;" onkeyup="filter();">
	<a href="/regist" class="btn btn-success" style="width:120px"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;New Project</a>
</form>
<div id="result">
	<table class="table" style="font-size: 1.0em">
		<c:forEach var="project" items="${list}">
		<tr><td><a href="/${project.uno}/${project.pno}" style="color: #223"><b>${project.uname} / ${project.pname}</b></a><br>
		<c:choose>
			<c:when test="${fn:length(project.pdetail) > 20}">
				<c:out value="${fn:substring(project.pdetail,0,20)}"/>....
			</c:when>
			<c:otherwise>
				<c:out value="${project.pdetail}"/>
			</c:otherwise>
		</c:choose>
		</td><td></td></tr>
		</c:forEach>
	<tr><td></td><td></td></tr>
	</table>
</div>
</div>
<script type="text/javascript">
function filter(){
	var item = $("#search").val();
	$.ajax({      
        type:"POST",  
        url:'/',      
        data:{"item" : item},
        dataType:"json",
        success: function(result){
        	var size = result.length;
       		var content = "<table class='table' style='font-size: 1.0em'>";
        		for(i = 0; i < size; i++){
        			console.log("for문도나?");
        			content += "<tr>";
        			content += "<td><a href='" + result[i].uno + "/" + result[i].pno +"' style='color:#223'><b>" + result[i].uname + "/" + result[i].pname+"</b></a><br>";
        			content += result[i].pdetail;
        			content += "</td><td></td></tr>";
       		}
       		content+="<tr><td></td><td></td></tr></table>";
       		$("#result").html(content);
        }
    });  
}
</script>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>