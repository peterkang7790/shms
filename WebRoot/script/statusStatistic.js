$(document).ready(function(){

	var stat_type = $('#stat_type').val(); // ����, �б⺰, ������
	var stat_status_dt_year_search = $('#stat_status_dt_year_search').val(); // �⵵
	var stat_status_dt_month_search = $('#stat_status_dt_month_search').val(); // ��
	
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
