// 이용약관 링크 id에따라 iframe에 출력한다.
$(document).ready(function(){
	// 화면이 로딩될때 이용약관 첫 화면을 load한다.
	$('#agreeView').load($('.agreeUrl').eq(0).attr("id"),function(){
		AgreementView();
	});
	
	// 화면이 로딩될때  text비교보기 기본값으로 이용약관의 첫번째 id를 셋팅한다.
	$('#textDiffPop').attr('url','diffTextView.do?mon_agr_id='+$('.mon_agr_id').eq(0).val()+'&old_mon_agr_id='+$('.old_mon_agr_id').eq(0).val());
	// 화면이 로딩될때 약관변경확인 기본값으로 이용약관의 첫번째 id를 셋팅한다.
	$('#editViewAgreeStateChange').attr('url','editViewAgreeStateChange.do?mon_agr_id='+$('.mon_agr_id').eq(0).val()+'&mon_id='+$('#mon_id').val());
	// 화면이 로딩될때 약관원본팝업 기본값으로 이용약관의 첫번째 id를 셋팅한다.
	$('#originalMhtPop').attr('url','detailMhtViewMonAgreeGatherData.do?mon_agr_id='+$('.mon_agr_id').eq(0).val());
	// 화면이 로딩될때 약관원본비교화면팝업 기본값으로 이용약관의 첫번째 id를 셋팅한다.
	$('#originalMhtComparePop').attr('url','beforeAfterMhtView.do?mon_agr_id='+$('.mon_agr_id').eq(0).val()+'&old_mon_agr_id='+$('.old_mon_agr_id').eq(0).val());
	// 첫탭메뉴에 current를 addClass한다.
	$('.agreeTabs').eq(0).addClass('current');
	
	if($('.mon_agr_sta').eq(0).val() == 'fail'){
		$('#textView').attr("disabled", "disabled");
		$('#originalView').attr("disabled", "disabled");
	}
	
	// 탭메뉴
	$('.agreeUrl').each(function(index){
		// 이용약관을 클릭시
		$(this).click(function(){
			var $this = $(this);

			// 이용약관 버튼을 클릭하였을때 약관변경확인 버튼, 약관원본 팝업보기, 약관원본비교 팝업보기의 주소값을 변경해준다.
			mon_agr_id = $('.mon_agr_id').eq(index).val();
			old_mon_agr_id = $('.old_mon_agr_id').eq(index).val();
			// text비교보기버튼
			$('#textDiffPop').attr('url','diffTextView.do?mon_agr_id='+mon_agr_id+"&old_mon_agr_id="+old_mon_agr_id);			
			// 변경확인버튼
			$('#editViewAgreeStateChange').attr('url','editViewAgreeStateChange.do?mon_agr_id='+mon_agr_id+'&mon_id='+$('#mon_id').val());
			// 약관원본팝업보기 버튼
			$('#originalMhtPop').attr('url','detailMhtViewMonAgreeGatherData.do?mon_agr_id='+mon_agr_id);
			// 약관원본비교화면보기 버튼
			$('#originalMhtComparePop').attr('url','beforeAfterMhtView.do?mon_agr_id='+mon_agr_id+"&old_mon_agr_id="+old_mon_agr_id);
			
			$('.agreeTabs').removeClass('current');
			$('.agreeTabs').eq(index).addClass('current');
			
			// 이용약관을 클릭할때 이용약관의 id에 있는 값으로 이용약관 페이지를 load한다.		
			$('#agreeView').load($this.attr("id"),function(){
				// text보기, 약관원본 보기, 자동준수평가 결과조회 보기
				AgreementView();
			});
			
			if($('.mon_agr_sta').eq(index).val() == 'fail'){
				$('#textView').attr("disabled", "disabled");
				$('#originalView').attr("disabled", "disabled");
			}
			else{
				$('#textView').attr("disabled", "");
				$('#originalView').attr("disabled", "");
			}
		});
	});
	
	// 이용약관 하단의 라디오 박스를 클릭하면 
	$('.radiobox').click(function(){
		// text보기, 약관원본 보기, 자동준수평가 결과조회 보기
		AgreementView();
	});
	
	// 2차모니터링 결과 준수평가를 출력해준다.
	ObserValuation();
    $('select').change(function(){ 
    	ObserValuation();
    });
    
	// 약관변경확인을 클릭하면 editViewAgreeStateChange의 href속성에 저장되어있는 url로 팝업을 띄운다.
	$('#editViewAgreeStateChange').click(function(){
		MM_openBrWindow($(this).attr('url'),'','width=480,height=200');
	});
	
	// 약관원본팝업보기 버튼을 클릭하면 originalMhtPop의 href속성에 저장되어있는 url로 팝업을 띄운다.
	$('#originalMhtPop').click(function(){
		MM_openBrWindow($(this).attr('url'),'','width=1024,height=800,resizable=yes,scrollbars=yes');
	});
	
	// 약관원본비교화면보기 버튼을 클릭하면 originalMhtComparePop의 href속성에 저장되어있는 url로 팝업을 띄운다.
	$('#originalMhtComparePop').click(function(){
		MM_openBrWindow($(this).attr('url'),'','width=1024,height=800,resizable=yes,scrollbars=yes');
	});

	// text비교보기 버튼을 클릭하면 약관비교text화면 팝업을 띄운다.
	$('#textDiffPop').click(function(){
		MM_openBrWindow($(this).attr('url'),'','width=1024,height=800,resizable=yes,scrollbars=yes');
	});
	
    $("#item_select").change(function(){
    	// 지침준수항목 하이라이팅
    	RuleItemHilighting();
    }); 
    
    var submitCount = 0;
    // 저장버튼
    $('#doing').click(function(){
    	$('#mon_sta').val('doing');
    	
    	$('#mon_conclusion').val(xed.getCurrentContent(true));      // 에디터 내용 입력 	

    	if($('#mon_conclusion').val() == ''){
    		alert("모니터링 결론을 입력해 주세요.");
    		$('#mon_conclusion').focus();
    		return false;
    	}
    	
    	var confirm_opinion_length_chk = "false";
    	var ref_agr_length_chk = "false";
    	
    	$('.confirm_opinion').each(function(index){
    		if($('.confirm_opinion').eq(index).val().length > 1300){
    			confirm_opinion_length_chk = "true";
    		}
    		
    		if($('.ref_agr').eq(index).val().length > 1300){
    			ref_agr_length_chk = "true";
    		}
    	});
    	
    	if(confirm_opinion_length_chk == "true"){
    		alert("검토의견 입력 허용범위를 넘었습니다.");
    		return false;
    	}

    	if(ref_agr_length_chk == "true"){
    		alert("관련약관 규정 입력 허용범위를 넘었습니다.")
    		return false;
    	}
    	
    	RuleItemName();
    	
		if(submitCount > 0){
			return false;
		}
		else{
		  submitCount++;
		}
    	
	    $('form').submit();
    });
    
    // 확인버튼
    $('#done').click(function(){
    	$('#mon_sta').val('done');
    	
		$('#mon_conclusion').val(xed.getCurrentContent(true));      // 에디터 내용 입력
    	
    	if($('#mon_conclusion').val() == ''){
    		alert("모니터링 결론을 입력해 주세요.");
    		$('#mon_conclusion').focus();
    		return false;
    	}

    	RuleItemName();
    	
		if(submitCount > 0){
			return false;
		}
		else{
		  submitCount++;
		}
		
    	$('form').submit();    	
    });    

});

// 지침준수항목 하이라이팅
function RuleItemHilighting(){
	var message_index = $("#item_select").val();
	
	if(message_index == 'keywordAll'){
		//지침준수항목 전체 하이라이팅
		RuleItemHilightingAll();
	}
//	else if(message_index == 'clear'){ 
//		$('.bgKeyword').removeClass('bgKeyword'); 
//		$('.bgRedKeyword').removeClass('bgRedKeyword');
//		$('.bgGreenKeyword').removeClass('bgGreenKeyword'); 
//	} 
	else{ 
		$('.bgKeyword').removeClass('bgKeyword'); 
		$('.bgRedKeyword').removeClass('bgRedKeyword'); 
		$('.bgGreenKeyword').removeClass('bgGreenKeyword'); 
	
		var itemId = message_index.split('^')[0]; 
		var className = message_index.split('^')[1]; 
		$('.' + itemId).addClass(className); 
	} 
}

//지침준수항목 전체 하이라이팅
function RuleItemHilightingAll(){
	$('.bgKeyword').removeClass('bgKeyword'); 
	$('.bgRedKeyword').removeClass('bgRedKeyword');
	$('.bgGreenKeyword').removeClass('bgGreenKeyword'); 
	
	$('.keyword_0000000001').addClass('bgKeyword');
	$('.keyword_0000000002').addClass('bgKeyword');
	$('.keyword_0000000003').addClass('bgKeyword');
	$('.keyword_0000000004').addClass('bgKeyword');

	$('.keyword_0000000005').addClass('bgKeyword');
	$('.keyword_0000000006').addClass('bgKeyword');
	$('.keyword_0000000007').addClass('bgKeyword');

	$('.keyword_0000000008').addClass('bgKeyword');
	$('.keyword_0000000009').addClass('bgKeyword');
	$('.keyword_0000000010').addClass('bgKeyword');
	$('.keyword_0000000011').addClass('bgKeyword');
	$('.keyword_0000000012').addClass('bgKeyword');

	$('.keyword_0000000013').addClass('bgKeyword');
	$('.keyword_0000000014').addClass('bgKeyword');
	$('.keyword_0000000015').addClass('bgKeyword');

	$('.keyword_0000000016').addClass('bgKeyword');
	$('.keyword_0000000017').addClass('bgKeyword');
	$('.keyword_0000000018').addClass('bgKeyword');
}

// 지침준수항목 name을 생성한다.
function RuleItemName(){
	$(".mon_res_id").each(function(index){
		$('.mon_res_id').eq(index).attr("name", "detailMonResRuleItem__"+index+"__mon_res_id");
		$('.rule_item_id').eq(index).attr("name", "detailMonResRuleItem__"+index+"__rule_item_id");
		$('.eval_res').eq(index).attr("name", "detailMonResRuleItem__"+index+"__eval_res");
		$('.confirm_opinion').eq(index).attr("name", "detailMonResRuleItem__"+index+"__confirm_opinion");
		$('.ref_agr').eq(index).attr("name", "detailMonResRuleItem__"+index+"__ref_agr");
	});
}

// text보기, 약관원본 보기, 자동준수평가 결과조회 보기
function AgreementView(){
	var radiobox_val = $(".radiobox:checked").val(); 

	if(radiobox_val == 'textView'){
		$('#agreeViewTxt').text('text 보기');
		$('#textDiff').show();
	    $('#original').hide();
	    $('#monitoring').hide();
	    $('#originalMht').hide();
	    $('#guideItemList').hide();
	}
	else if(radiobox_val == 'originalView'){
		$('#agreeViewTxt').text('약관원본 보기');
	    $('#textDiff').hide();
	    $('#original').show();
	    $('#monitoring').hide();
	    $('#originalMht').show();
	    $('#guideItemList').hide();
	}
	else if(radiobox_val == 'monitoringView'){
		// 지침준수항목 하이라이팅
		RuleItemHilighting();		
		$('#agreeViewTxt').text('자동준수평가결과조회');
	    $('#textDiff').hide();
	    $('#original').hide();
	    $('#monitoring').show();
	    $('#originalMht').hide();
	    $('#guideItemList').show();
	}	
}

// 준수평가를 출력하고 conform_yn의 hidden필드에 준수평가 value값을 넣는다.
function ObserValuation(){
    var conform_ynCount = $("div.conform_yn").length;
    
    for(var i=0; i < conform_ynCount; i++){
    	var eval_item_mark_yn = $("#detailMonResRuleItemSub__"+i+"__eval_item_mark_yn > option:selected"); // 표시
    	var eval_item_adv_yn = $("#detailMonResRuleItemSub__"+i+"__eval_item_adv_yn > option:selected"); // 유불리
    	var eval_item_exist_yn = $("#detailMonResRuleItemSub__"+i+"__eval_item_exist_yn > option:selected"); // 유무
    	
    	if(eval_item_mark_yn.val() == 'Y'){
    		$('.conform_yn').eq(i).text('준수');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("준수");
    	}

    	if(eval_item_mark_yn.val() == 'N'
    		&& eval_item_adv_yn.val() == 'Y'){
    		$('.conform_yn').eq(i).text('준수');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("준수");
    	}
    	
    	if(eval_item_mark_yn.val() == 'N'
    		&& eval_item_adv_yn.val() == 'N'){
    		$('.conform_yn').eq(i).text('미준수');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("미준수");
    	}
    	
    	if(eval_item_mark_yn.val() == 'N'
    		&& eval_item_adv_yn.val() == 'NA'
    		&& eval_item_adv_yn.val() == 'Y'){
    		$('.conform_yn').eq(i).text('준수');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("준수");
    	}
    	
    	if(eval_item_mark_yn.val() == 'N'
    		&& eval_item_adv_yn.val() == 'NA'
    		&& eval_item_adv_yn.val() == 'N'){
    		$('.conform_yn').eq(i).text('미준수');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("미준수");
    	}

    	if(eval_item_mark_yn.val() == 'NA'
    		&& eval_item_adv_yn.val() == 'Y'){
    		$('.conform_yn').eq(i).text('준수');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("준수");
    	}
    	
    	if(eval_item_mark_yn.val() == 'NA'
    		&& eval_item_adv_yn.val() == 'N'){
    		$('.conform_yn').eq(i).text('미준수');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("미준수");
    	}
    	
    	if(eval_item_mark_yn.val() == 'NA'
    		&& eval_item_adv_yn.val() == 'NA'
   			&& eval_item_exist_yn.val() == 'Y'){    			
    		$('.conform_yn').eq(i).text('준수');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("준수");
    	}
    	
    	if(eval_item_mark_yn.val() == 'NA'
    		&& eval_item_adv_yn.val() == 'NA'
   			&& eval_item_exist_yn.val() == 'N'){    			
    		$('.conform_yn').eq(i).text('미준수');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("미준수");
    	}
    	
    	if(eval_item_mark_yn.val() == 'NA'
    		&& eval_item_adv_yn.val() == 'NA'
   			&& eval_item_exist_yn.val() == 'NA'){    			
    		$('.conform_yn').eq(i).text('준수');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("준수");
    	}
    }
}


