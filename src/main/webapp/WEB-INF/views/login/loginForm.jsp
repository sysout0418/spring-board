<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header1_import.jsp" />
<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->

<div id="login-page">
	<div class="container">
	<c:url value="/login" var="login" />
    <form:form cssClass="form-login" action="${login}" method="post">
    	<c:if test="${param.error != null}">
    		<script type="text/javascript">
	    		alert("아이디 또는 비밀번호가 틀렸습니다.");
    		</script>
    	</c:if>
       <h2 class="form-login-heading">sign in now</h2>
       <div class="login-wrap">
           <input type="text" id="uemail" name="uemail" class="form-control" placeholder="Email Address" required autofocus>
           <br>
           <input type="password" id="upassword" name="upassword" class="form-control" placeholder="Password">
           <label class="checkbox">

               <span class="pull-right">
                   <a data-toggle="modal" href="login.html#myModal"> Forgot Password?</a>
               </span>
           </label>
           <button class="btn btn-theme btn-block" type="submit"><i class="fa fa-lock"></i> SIGN IN</button>
           <hr>
           
           <div class="login-social-link centered">
           <p>or you can sign in via your social network</p>
               <button class="btn btn-facebook" type="submit"><i class="fa fa-facebook"></i> Facebook</button>
               <button class="btn btn-twitter" type="submit"><i class="fa fa-twitter"></i> Twitter</button>
           </div>
           <div class="registration">
               Don't have an account yet?<br/>
               <a class="" href="/join">
                   Create an account
               </a>
           </div>

       </div>

         <!-- Modal -->
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
             <div class="modal-dialog">
                 <div class="modal-content">
                     <div class="modal-header">
                         <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                         <h4 class="modal-title">Forgot Password ?</h4>
                     </div>
                     <div class="modal-body">
                         <p>Enter your e-mail address below to reset your password.</p>
                         <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">

                     </div>
                     <div class="modal-footer">
                         <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                         <button class="btn btn-theme" type="button">Submit</button>
                     </div>
                 </div>
             </div>
         </div>
         <!-- modal -->

     </form:form>	  	
	
	</div>
</div>

 <!-- js placed at the end of the document so the pages load faster -->
 <script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery.js" />"></script>
 <script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap/bootstrap.min.js" />"></script>

 <!--BACKSTRETCH-->
 <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
 <script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery.backstretch.min.js" />"></script>
 <script>
     $.backstretch("<c:url value="/resources/img/login-bg.jpg" />", {speed: 500});
 </script>


  </body>
</html>