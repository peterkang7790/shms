$(document).ready(function(){

	var stat_type = $('#stat_type').val(); // 월별, 분기별, 연도별
	var stat_dt_search = $('#stat_dt_search').val(); // 년도
	var stat_dt_sdt_search = $('#stat_dt_sdt_search').val(); // 연도별에서 검색 시작 년도
	var stat_dt_edt_search = $('#stat_dt_edt_search').val(); // 연도별에서 검색 마지막 년도
	
	var defalutChart = $('#chartUrl').val()+".do" 
		+"?com_id="+$('.chartList').eq(0).attr('id')
		+"&chart_sub_name="+$('.chartList').eq(0).text()
		+"&stat_type="+stat_type
		+"&stat_dt_search="+stat_dt_search
		+"&stat_dt_sdt_search="+stat_dt_sdt_search
		+"&stat_dt_edt_search="+stat_dt_edt_search
	
	$('#chart').attr('src', defalutChart);
	
	$('.chartList').each(function(index){
		$(this).click(function(){
			var com_id = $(this).attr('id'); // 차트 unique ID
			
			var chart = ""+$('#chartUrl').val()+".do" 
				+"?com_id="+com_id
				+"&stat_type="+stat_type
				+"&stat_dt_search="+stat_dt_search
				+"&stat_dt_sdt_search="+stat_dt_sdt_search
				+"&stat_dt_edt_search="+stat_dt_edt_search;
			
			$('#chart').attr('src', chart);
		});
	});
	
	statTypeChange($("#stat_type > option:selected").val());
});


function statTypeChange(val){
	if(val == "month"){
		$('#monthOr3month').show();
		$('#year').hide();
	}
	else if(val == "3month"){
		$('#monthOr3month').show();
		$('#year').hide();
	}
	else if(val == "year"){
		$('#monthOr3month').hide();
		$('#year').show();
	}
}