<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header_project.jsp"/>
<!-- Begin page content -->
<div style="width:1200; margin:0 auto; background-color: #fff">
   <h4>Edit Label</h4>  	
<form:form method="post" action="/label/edit" commandName="label">
<table class="table">
	<tr>
		<td>Title</td>
		<td><form:input path="ltitle" cssClass="form-control" required="required"/></td>
	</tr>
	<tr>
		<td>Description</td>
		<td><form:textarea path="ldescription" cssClass="form-control"/></td>
	</tr>
	<tr>
		<td style="border-color: #fff">Background Color</td>
		<td style="border-color: #fff">
			<div id="red"></div>
			<div id="green"></div>
			<div id="blue"></div>
			 
			<div id="swatch" class="ui-widget-content ui-corner-all"></div>
			<form:hidden path="lbgcolor" id="lbgcolor"/>
		</td>
	</tr>
	<tr>
		<td colspan="4"><input class="btn btn-success" type="submit" value="SAVE"></td>
		<input type="hidden" value="${uno}" name="uno"/><input type="hidden" value="${pno}" name="pno"/>
		<form:hidden path="lno"/>
	</tr>
</table>
</form:form>
</div>
<style>
#red, #green, #blue {
  float: left;
  clear: left;
  width: 620px;
  margin: 7px;
  margin-left: 70px;
}
#swatch {
  width: 65px;
  height: 65px;
  margin-top: 8px;
  background-image: none;
}
#red .ui-slider-range { background: #ef2929; }
#red .ui-slider-handle { border-color: #ef2929; }
#green .ui-slider-range { background: #8ae234; }
#green .ui-slider-handle { border-color: #8ae234; }
#blue .ui-slider-range { background: #729fcf; }
#blue .ui-slider-handle { border-color: #729fcf; }
</style>
<script>
 function hexFromRGB(r, g, b) {
   var hex = [
     r.toString( 16 ),
     g.toString( 16 ),
     b.toString( 16 )
   ];
   $.each( hex, function( nr, val ) {
     if ( val.length === 1 ) {
       hex[ nr ] = "0" + val;
     }
   });
   return hex.join( "" ).toUpperCase();
 }
 function RGBFromhex(hex) {
    var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? {
        r: parseInt(result[1], 16),
        g: parseInt(result[2], 16),
        b: parseInt(result[3], 16)
    } : null;
}
 function refreshSwatch() {
   var red = $( "#red" ).slider( "value" ),
     green = $( "#green" ).slider( "value" ),
     blue = $( "#blue" ).slider( "value" ),
     hex = hexFromRGB( red, green, blue );
   $( "#swatch" ).css( "background-color", "#" + hex );
   $("#lbgcolor").val("#"+hex);
 }
 $(function() {
   $( "#red, #green, #blue" ).slider({
     orientation: "horizontal",
     range: "min",
     max: 255,
     value: 127,
     slide: refreshSwatch,
     change: refreshSwatch
   });
   var hex = $("#lbgcolor").val();
   
   $( "#red" ).slider( "value", RGBFromhex(hex).r );
   $( "#green" ).slider( "value", RGBFromhex(hex).g );
   $( "#blue" ).slider( "value", RGBFromhex(hex).b );
 });
 </script>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>