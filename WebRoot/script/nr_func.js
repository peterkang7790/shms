

/*-------------------------------------------------------------------------------*/ 

// ���̵� üũ
function chkId(com_user_id){

	if(com_user_id.val() == ''){
		alert("ID�� �Է��� �ּ���");		
		com_user_id.focus();
		return false;
	}
	if(com_user_id.val() != ''){
		if(com_user_id.val() != ''){
			var engNumPattern = /([^-a-zA-Z0-9 ])/;

			engNumPattern = com_user_id.val().match(engNumPattern);	
			if(engNumPattern != null){
			alert("����� ���ڸ��Է� �� �� �ֽ��ϴ�.");
			com_user_id.focus();
			return false;
			}
		}
		if (com_user_id.val().length < 3 || com_user_id.val().length > 15){
			alert("���̵�� 4�� ���� 15�� ������ ����մϴ�.");
			com_user_id.focus();
			return false;
		}
	}
	
}



// �н����� üũ
function chkPass(com_user_pass,com_user_pass_ok){
	if(com_user_pass.val() == ''){
		alert("��й�ȣ�� �Է��� �ּ���");		
		com_user_pass.focus();
		return false;
	}
	if(com_user_pass_ok.val() == ''){
		alert("��й�ȣȮ���� �Է��� �ּ���");		
		com_user_pass_ok.focus();
		return false;
	}
	if(com_user_pass.val() != ''){

		
		var hanNo = /[^0-9A-Za-z~!@#$%^&*()_+=\-,.\/<>?[\]{};':"]/;
		hanNo = com_user_pass.val().match(hanNo);	
		if(hanNo != null){
			alert("����� ����,Ư����ȣ�� �Է� �� �� �ֽ��ϴ�.");
			com_user_pass.focus();
			return false;
		}
		
		if (com_user_pass.val().length < 6 || com_user_pass.val().length > 15){
			alert("��й�ȣ�� 6�� ���� 15�� ������ ����մϴ�1212.");
			com_user_pass.focus();
			return false;
		}

		if(com_user_pass.val() !=  com_user_pass_ok.val()) {	
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�. ��Ȯ�� ���ּ���.");
			com_user_pass.val('');
			com_user_pass_ok.val('');
			com_user_pass.focus();
			return false;
		}
		
	}	
}


//�̸��� üũ
function chkEmail(com_user_email){
	if(com_user_email.val() != ''){
		var com_user_email_split = com_user_email.val().split(";");
		var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
		
		for(var i=0; i < com_user_email_split.length; i++){
			if(!emailPattern.test(com_user_email_split[i])){
				alert('�߸��� e-mail �����Դϴ�.');
				com_user_email.focus();
				return false;
			}
		}
	}
}

/* 
�ѱ��� ��� Ű �Է½� �ٷιٷ� �۾��� �ȵǱ� ������ 
onchange �� onblur �� �̺�Ʈ�� ���� ���. 
*/ 

// �ѱ۸� �Է¹ޱ� (�ʼ�ü ����) 
// ������ ���� ���� 
function nr_han(this_s,type){ 
    /* 
    type 
    -> 'c' : �ʼ� ���� 
    -> 's' : �ʼ� ���� + ���� ���� 
    -> '' : �ʼ�, ���� ���� 
    */ 
    temp_value = this_s.value.toString(); 
    regexp = ''; 
    repexp = ''; 
    switch(type){ 
        case 'c': regexp = /[^��-����-�R]/g;break; 
        case 's': regexp = /[^��-����-�R\s]/g;break; 
        case '':    regexp = /[^��-�R]/g; break; 
        default : regexp = /[^��-����-�R\s]/g; 
    } 
    if(regexp.test(temp_value)) 
    { 
        temp_value = temp_value.replace(regexp,repexp); 
        this_s.value = temp_value; 
    } 
} 

/*-------------------------------------------------------------------------------*/ 

// �ѱ۸� �Է¹ޱ� (�ʼ�ü ����) 
// ������ ���� ���� 
function nr_han_cho(this_s){ 
    nr_han(this_s,'c'); 
} 

/*-------------------------------------------------------------------------------*/ 

// �ѱ۸� �Է¹ޱ� (�ʼ�ü ����, ���� ����) 
// ������ ���� ���� 
function nr_han_cho_space(this_s){ 
    nr_han(this_s,'s'); 
} 


/*-------------------------------------------------------------------------------*/ 
function nr_numeng(this_s){ 
    temp_value = this_s.value.toString(); 
    regexp = /[^0-0a-zA-Z]/g; 
    repexp = ''; 
    temp_value = temp_value.replace(regexp,repexp); 
    this_s.value = temp_value; 
} 

/*-------------------------------------------------------------------------------*/ 
// ������ ���� ���� 
function nr_num(this_s,type){ 
    /* 
    type 
    -> 'int' : ���� ���� 
    -> 'float' : ���� �Ǽ� 
    -> '-int' : ���� ���� ���� 
    -> '-int' : ���� �Ǽ� ���� 
    */ 
    temp_value = this_s.value.toString(); 
    regexp = /[^-\.0-9]/g; 
    repexp = ''; 
    temp_value = temp_value.replace(regexp,repexp); 
    regexp = ''; 
    repexp = ''; 
    switch(type){ 
        case 'int':     regexp = /[^0-9]/g; break; 
        case 'float':regexp = /^(-?)([0-9]*)(\.?)([^0-9]*)([0-9]*)([^0-9]*)/; break; 
        case '-int':    regexp = /^(-?)([0-9]*)([^0-9]*)([0-9]*)([^0-9]*)/;break; 
        case '-float':regexp = /^(-?)([0-9]*)(\.?)([^0-9]*)([0-9]*)([^0-9]*)/; break; 
        default : regexp = /[^0-9]/g; break; 
    } 
    switch(type){ 
        case 'int':repexp = '';break; 
        case 'float':repexp = '$2$3$5';break; 
        case '-int':    repexp = '$1$2$4';break; 
        case '-float':repexp = '$1$2$3$5'; break; 
        default : regexp = /[^0-9]/g; break; 
    } 
    temp_value = temp_value.replace(regexp,repexp); 
    this_s.value = temp_value; 
} 
// ���� ������ �Է¹ޱ� 
function nr_num_int(this_s){ 
    nr_num(this_s,'int'); 
} 
// ���� �Ǽ��� �Է¹ޱ� 
function nr_num_float(this_s){ 
    nr_num(this_s,'float'); 
} 

/*-------------------------------------------------------------------------------*/ 

// ��� �Է¹ޱ�  (��ҹ���) 
// ������ ���� ���� 
function nr_eng(this_s,type){ 
    temp_value = this_s.value.toString(); 
    regexp = ''; 
    repexp = ''; 
    switch(type){ 
        case 'small':regexp = /[^a-z]/g;break; 
        case 'big':regexp = /[^A-Z]/g;break; 
        case 'all':regexp = /[^a-z]/i;break; 
        default :regexp = /[^a-z]/i;break; 
    } 
    temp_value = temp_value.replace(regexp,repexp); 
    this_s.value = temp_value; 
} 



// ��� �Է¹ޱ�  (�ҹ���) 
// ������ ���� ���� 
function nr_eng_small(this_s){ 
    nr_eng(this_s,'small'); 
} 

// ��� �Է¹ޱ�  (�빮��) 
// ������ ���� ���� 
function nr_eng_big(this_s){ 
    nr_eng(this_s,'big'); 
} 
// ��ȭ��ȣ �԰ݿ� �°� DDD-MM~M-XXXX 
// ������ ���� ���� 
function nr_phone(this_s) 
{ 
    temp_value = this_s.value.toString(); 
    temp_value = temp_value.replace(/[^0-9]/g,''); 
    temp_value = temp_value.replace(/(0(?:2|[0-9]{2}))([0-9]+)([0-9]{4}$)/,"$1-$2-$3"); 
    this_s.value = temp_value; 
} 



//��ȭ��ȣ �԰ݿ� �°� DDD-MM~M-XXXX 
//������ ���� ���� 
function nr_email(this_s) 
{ 
 temp_value = this_s.value.toString(); 
 temp_value = temp_value.replace(/[^-a-zA-Z0-9._]/g,'');
 this_s.value = temp_value; 
}


/*-------------------------------------------------------------------------------*/ 


// �ֹε�� ��ȣ �԰ݿ� �°� 123456-1234567  //�������� ����. 
// ������ ���� ���� 
function nr_jumin(this_s) 
{ 
    temp_value = this_s.value.toString(); 
    temp_value = temp_value.replace(/[^0-9]/g,''); 
    temp_value = temp_value.substr(0,13); 
    temp_value = temp_value.replace(/([0-9]{6})([0-9]{7}$)/,"$1-$2"); 
    this_s.value = temp_value; 
} 



/*-------------------------------------------------------------------------------*/ 

// ����� ��� ��ȣ �԰ݿ� �°� 123-12-12345  //�������� ����. 
// ������ ���� ���� 
function nr_company_num(this_s) 
{ 
    temp_value = this_s.value.toString(); 
    temp_value = temp_value.replace(/[^0-9]/g,''); 
    temp_value = temp_value.substr(0,10); 
    temp_value = temp_value.replace(/([0-9]{3})([0-9]{2})([0-9]{5}$)/,"$1-$2-$3"); 
    this_s.value = temp_value; 
} 

