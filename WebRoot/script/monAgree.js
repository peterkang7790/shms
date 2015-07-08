// �̿��� ��ũ id������ iframe�� ����Ѵ�.
$(document).ready(function(){
	// ȭ���� �ε��ɶ� �̿��� ù ȭ���� load�Ѵ�.
	$('#agreeView').load($('.agreeUrl').eq(0).attr("id"),function(){
		AgreementView();
	});
	
	// ȭ���� �ε��ɶ�  text�񱳺��� �⺻������ �̿����� ù��° id�� �����Ѵ�.
	$('#textDiffPop').attr('url','diffTextView.do?mon_agr_id='+$('.mon_agr_id').eq(0).val()+'&old_mon_agr_id='+$('.old_mon_agr_id').eq(0).val());
	// ȭ���� �ε��ɶ� �������Ȯ�� �⺻������ �̿����� ù��° id�� �����Ѵ�.
	$('#editViewAgreeStateChange').attr('url','editViewAgreeStateChange.do?mon_agr_id='+$('.mon_agr_id').eq(0).val()+'&mon_id='+$('#mon_id').val());
	// ȭ���� �ε��ɶ� ��������˾� �⺻������ �̿����� ù��° id�� �����Ѵ�.
	$('#originalMhtPop').attr('url','detailMhtViewMonAgreeGatherData.do?mon_agr_id='+$('.mon_agr_id').eq(0).val());
	// ȭ���� �ε��ɶ� ���������ȭ���˾� �⺻������ �̿����� ù��° id�� �����Ѵ�.
	$('#originalMhtComparePop').attr('url','beforeAfterMhtView.do?mon_agr_id='+$('.mon_agr_id').eq(0).val()+'&old_mon_agr_id='+$('.old_mon_agr_id').eq(0).val());
	// ù�Ǹ޴��� current�� addClass�Ѵ�.
	$('.agreeTabs').eq(0).addClass('current');
	
	if($('.mon_agr_sta').eq(0).val() == 'fail'){
		$('#textView').attr("disabled", "disabled");
		$('#originalView').attr("disabled", "disabled");
	}
	
	// �Ǹ޴�
	$('.agreeUrl').each(function(index){
		// �̿����� Ŭ����
		$(this).click(function(){
			var $this = $(this);

			// �̿��� ��ư�� Ŭ���Ͽ����� �������Ȯ�� ��ư, ������� �˾�����, ��������� �˾������� �ּҰ��� �������ش�.
			mon_agr_id = $('.mon_agr_id').eq(index).val();
			old_mon_agr_id = $('.old_mon_agr_id').eq(index).val();
			// text�񱳺����ư
			$('#textDiffPop').attr('url','diffTextView.do?mon_agr_id='+mon_agr_id+"&old_mon_agr_id="+old_mon_agr_id);			
			// ����Ȯ�ι�ư
			$('#editViewAgreeStateChange').attr('url','editViewAgreeStateChange.do?mon_agr_id='+mon_agr_id+'&mon_id='+$('#mon_id').val());
			// ��������˾����� ��ư
			$('#originalMhtPop').attr('url','detailMhtViewMonAgreeGatherData.do?mon_agr_id='+mon_agr_id);
			// ���������ȭ�麸�� ��ư
			$('#originalMhtComparePop').attr('url','beforeAfterMhtView.do?mon_agr_id='+mon_agr_id+"&old_mon_agr_id="+old_mon_agr_id);
			
			$('.agreeTabs').removeClass('current');
			$('.agreeTabs').eq(index).addClass('current');
			
			// �̿����� Ŭ���Ҷ� �̿����� id�� �ִ� ������ �̿��� �������� load�Ѵ�.		
			$('#agreeView').load($this.attr("id"),function(){
				// text����, ������� ����, �ڵ��ؼ��� �����ȸ ����
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
	
	// �̿��� �ϴ��� ���� �ڽ��� Ŭ���ϸ� 
	$('.radiobox').click(function(){
		// text����, ������� ����, �ڵ��ؼ��� �����ȸ ����
		AgreementView();
	});
	
	// 2������͸� ��� �ؼ��򰡸� ������ش�.
	ObserValuation();
    $('select').change(function(){ 
    	ObserValuation();
    });
    
	// �������Ȯ���� Ŭ���ϸ� editViewAgreeStateChange�� href�Ӽ��� ����Ǿ��ִ� url�� �˾��� ����.
	$('#editViewAgreeStateChange').click(function(){
		MM_openBrWindow($(this).attr('url'),'','width=480,height=200');
	});
	
	// ��������˾����� ��ư�� Ŭ���ϸ� originalMhtPop�� href�Ӽ��� ����Ǿ��ִ� url�� �˾��� ����.
	$('#originalMhtPop').click(function(){
		MM_openBrWindow($(this).attr('url'),'','width=1024,height=800,resizable=yes,scrollbars=yes');
	});
	
	// ���������ȭ�麸�� ��ư�� Ŭ���ϸ� originalMhtComparePop�� href�Ӽ��� ����Ǿ��ִ� url�� �˾��� ����.
	$('#originalMhtComparePop').click(function(){
		MM_openBrWindow($(this).attr('url'),'','width=1024,height=800,resizable=yes,scrollbars=yes');
	});

	// text�񱳺��� ��ư�� Ŭ���ϸ� �����textȭ�� �˾��� ����.
	$('#textDiffPop').click(function(){
		MM_openBrWindow($(this).attr('url'),'','width=1024,height=800,resizable=yes,scrollbars=yes');
	});
	
    $("#item_select").change(function(){
    	// ��ħ�ؼ��׸� ���̶�����
    	RuleItemHilighting();
    }); 
    
    var submitCount = 0;
    // �����ư
    $('#doing').click(function(){
    	$('#mon_sta').val('doing');
    	
    	$('#mon_conclusion').val(xed.getCurrentContent(true));      // ������ ���� �Է� 	

    	if($('#mon_conclusion').val() == ''){
    		alert("����͸� ����� �Է��� �ּ���.");
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
    		alert("�����ǰ� �Է� �������� �Ѿ����ϴ�.");
    		return false;
    	}

    	if(ref_agr_length_chk == "true"){
    		alert("���þ�� ���� �Է� �������� �Ѿ����ϴ�.")
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
    
    // Ȯ�ι�ư
    $('#done').click(function(){
    	$('#mon_sta').val('done');
    	
		$('#mon_conclusion').val(xed.getCurrentContent(true));      // ������ ���� �Է�
    	
    	if($('#mon_conclusion').val() == ''){
    		alert("����͸� ����� �Է��� �ּ���.");
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

// ��ħ�ؼ��׸� ���̶�����
function RuleItemHilighting(){
	var message_index = $("#item_select").val();
	
	if(message_index == 'keywordAll'){
		//��ħ�ؼ��׸� ��ü ���̶�����
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

//��ħ�ؼ��׸� ��ü ���̶�����
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

// ��ħ�ؼ��׸� name�� �����Ѵ�.
function RuleItemName(){
	$(".mon_res_id").each(function(index){
		$('.mon_res_id').eq(index).attr("name", "detailMonResRuleItem__"+index+"__mon_res_id");
		$('.rule_item_id').eq(index).attr("name", "detailMonResRuleItem__"+index+"__rule_item_id");
		$('.eval_res').eq(index).attr("name", "detailMonResRuleItem__"+index+"__eval_res");
		$('.confirm_opinion').eq(index).attr("name", "detailMonResRuleItem__"+index+"__confirm_opinion");
		$('.ref_agr').eq(index).attr("name", "detailMonResRuleItem__"+index+"__ref_agr");
	});
}

// text����, ������� ����, �ڵ��ؼ��� �����ȸ ����
function AgreementView(){
	var radiobox_val = $(".radiobox:checked").val(); 

	if(radiobox_val == 'textView'){
		$('#agreeViewTxt').text('text ����');
		$('#textDiff').show();
	    $('#original').hide();
	    $('#monitoring').hide();
	    $('#originalMht').hide();
	    $('#guideItemList').hide();
	}
	else if(radiobox_val == 'originalView'){
		$('#agreeViewTxt').text('������� ����');
	    $('#textDiff').hide();
	    $('#original').show();
	    $('#monitoring').hide();
	    $('#originalMht').show();
	    $('#guideItemList').hide();
	}
	else if(radiobox_val == 'monitoringView'){
		// ��ħ�ؼ��׸� ���̶�����
		RuleItemHilighting();		
		$('#agreeViewTxt').text('�ڵ��ؼ��򰡰����ȸ');
	    $('#textDiff').hide();
	    $('#original').hide();
	    $('#monitoring').show();
	    $('#originalMht').hide();
	    $('#guideItemList').show();
	}	
}

// �ؼ��򰡸� ����ϰ� conform_yn�� hidden�ʵ忡 �ؼ��� value���� �ִ´�.
function ObserValuation(){
    var conform_ynCount = $("div.conform_yn").length;
    
    for(var i=0; i < conform_ynCount; i++){
    	var eval_item_mark_yn = $("#detailMonResRuleItemSub__"+i+"__eval_item_mark_yn > option:selected"); // ǥ��
    	var eval_item_adv_yn = $("#detailMonResRuleItemSub__"+i+"__eval_item_adv_yn > option:selected"); // ���Ҹ�
    	var eval_item_exist_yn = $("#detailMonResRuleItemSub__"+i+"__eval_item_exist_yn > option:selected"); // ����
    	
    	if(eval_item_mark_yn.val() == 'Y'){
    		$('.conform_yn').eq(i).text('�ؼ�');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("�ؼ�");
    	}

    	if(eval_item_mark_yn.val() == 'N'
    		&& eval_item_adv_yn.val() == 'Y'){
    		$('.conform_yn').eq(i).text('�ؼ�');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("�ؼ�");
    	}
    	
    	if(eval_item_mark_yn.val() == 'N'
    		&& eval_item_adv_yn.val() == 'N'){
    		$('.conform_yn').eq(i).text('���ؼ�');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("���ؼ�");
    	}
    	
    	if(eval_item_mark_yn.val() == 'N'
    		&& eval_item_adv_yn.val() == 'NA'
    		&& eval_item_adv_yn.val() == 'Y'){
    		$('.conform_yn').eq(i).text('�ؼ�');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("�ؼ�");
    	}
    	
    	if(eval_item_mark_yn.val() == 'N'
    		&& eval_item_adv_yn.val() == 'NA'
    		&& eval_item_adv_yn.val() == 'N'){
    		$('.conform_yn').eq(i).text('���ؼ�');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("���ؼ�");
    	}

    	if(eval_item_mark_yn.val() == 'NA'
    		&& eval_item_adv_yn.val() == 'Y'){
    		$('.conform_yn').eq(i).text('�ؼ�');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("�ؼ�");
    	}
    	
    	if(eval_item_mark_yn.val() == 'NA'
    		&& eval_item_adv_yn.val() == 'N'){
    		$('.conform_yn').eq(i).text('���ؼ�');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("���ؼ�");
    	}
    	
    	if(eval_item_mark_yn.val() == 'NA'
    		&& eval_item_adv_yn.val() == 'NA'
   			&& eval_item_exist_yn.val() == 'Y'){    			
    		$('.conform_yn').eq(i).text('�ؼ�');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("�ؼ�");
    	}
    	
    	if(eval_item_mark_yn.val() == 'NA'
    		&& eval_item_adv_yn.val() == 'NA'
   			&& eval_item_exist_yn.val() == 'N'){    			
    		$('.conform_yn').eq(i).text('���ؼ�');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("���ؼ�");
    	}
    	
    	if(eval_item_mark_yn.val() == 'NA'
    		&& eval_item_adv_yn.val() == 'NA'
   			&& eval_item_exist_yn.val() == 'NA'){    			
    		$('.conform_yn').eq(i).text('�ؼ�');
    		$("#addMonAgreeDoing_detailMonResRuleItemSub__"+i+"__conform_yn").val("�ؼ�");
    	}
    }
}


