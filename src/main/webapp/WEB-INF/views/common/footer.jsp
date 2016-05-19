<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--footer start-->
<footer class="site-footer">
    <div class="text-center">
        2016 BIDDING
        <a href="#" class="go-top">
            <i class="fa fa-angle-up"></i>
        </a>
    </div>
</footer>
<!--footer end-->
</section>
<!-- jquery -->
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/jquery/jquery-1.12.1.min.js" />"></script>

<!-- validation -->
<script type="text/javascript" src="<c:url value="/resources/javascript/form-validation/additional-methods.min.js" />"></script>
<script src="<c:url value="/resources/javascript/form-validation/jquery.validate.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/form-validation/messages_ko.min.js" />"></script>

<!-- js placed at the end of the document so the pages load faster -->
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap/bootstrap.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/select/select2.full.js" />"></script>
<!-- select2 -->
  <script>
    $(document).ready(function() {
      $(".select2_single").select2({
        placeholder: "Select a state",
        allowClear: true
      });
      $(".select2_group").select2({});
      $(".select2_multiple").select2({
        maximumSelectionLength: 4,
        placeholder: "With Max Selection limit 4",
        allowClear: true
      });
    });
  </script>
  <!-- /select2 -->
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/zabuto_calendar.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery-ui-1.9.2.custom.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/jquery.ui.touch-punch.min.js" />"></script>

    
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/gritter/js/jquery.gritter.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/gritter-conf.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/bootstrap-theme-dashgum/common-scripts.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/javascript/colorpicker/jquery.minicolors.min.js" />"></script>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
</body>
</html>