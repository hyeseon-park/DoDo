$(function(){
	$(".project_form").on("submit", function(){
		var project_title = $(".project_title").val();
		var project_start_date = $(".project_start_date").val();
		var project_end_date = $(".project_end_date").val();
		
        var start_date_array = project_start_date.split('-');
        var end_date_array = project_end_date.split('-');  
        
        var start_date_val = new Date(start_date_array[0], start_date_array[1], start_date_array[2]);
        var end_date_val = new Date(end_date_array[0], end_date_array[1], end_date_array[2]);

		var result = start_date_val<end_date_val;

		if(project_title == "" || start_date_val > end_date_val){

			if(project_title == "" ){
				$(".pTitle_check_sentence").show();
			}else{
				$(".pTitle_check_sentence").hide();
			}
			
			if(start_date_val > end_date_val){
				$(".pPeriod_check_sentence").show();
			}else{
				$(".pPeriod_check_sentence").hide();
			}
			
			return false;
		}
	});
	
	$(".project_title").on("keyup", function() {
		if($(this).val().length > 30) {
			alert("글자수는 15자 이내로 제한됩니다.");
			$(this).val($(this).val().substring(0, 30));
		}
	});

	$("project_description").on("keyup", function() {
		if($(this).val().length > 30) {
			alert("글자수는 15자 이내로 제한됩니다.");
			$(this).val($(this).val().substring(0, 30));
		}
	});
	
	
    $( ".datepicker" ).datepicker({
    	dateFormat: 'yy-mm-dd',
        changeMonth: true,
        changeYear: true
    });
});

