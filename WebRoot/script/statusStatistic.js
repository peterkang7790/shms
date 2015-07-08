$(document).ready(function(){

	var stat_type = $('#stat_type').val(); // 월별, 분기별, 연도별
	var stat_status_dt_year_search = $('#stat_status_dt_year_search').val(); // 년도
	var stat_status_dt_month_search = $('#stat_status_dt_month_search').val(); // 월
	
	var defalutChart = $('#chartUrl').val()+".do" 
		+"?stat_status_dt_year_search="+stat_status_dt_year_search
		+"&stat_status_dt_month_search="+stat_status_dt_month_search;
	
	$('#chart').attr("src", defalutChart);
	
	$('.chartList').each(function(index){
		$(this).click(function(){
			var chart = $('#chartUrl').val()+".do" 
				+"?stat_status_dt_year_search="+stat_status_dt_year_search
				+"&stat_status_dt_month_search="+stat_status_dt_month_search;
			
			$('#chart').attr("src", chart);
		});
	});
	
	statTypeChange($("#stat_type > option:selected").val());
});
