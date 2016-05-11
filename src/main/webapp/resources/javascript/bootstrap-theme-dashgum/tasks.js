var TaskList = function () {
	console.log("호출됨");
    return {

        initTaskWidget: function () {
			$('input.list-child').change(function() {
				if ($(this).is(':checked')) { 
					$(this).parents('li').addClass("task-done"); 
				} else { 
					$(this).parents('li').removeClass("task-done"); 
				}
			}); 
        }

    };

}();