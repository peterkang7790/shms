

/*-------------------------------------------------------------------------------*/ 

// 아이디 체크
function chkId(com_user_id){

	if(com_user_id.val() == ''){
		alert("ID를 입력해 주세요");		
		com_user_id.focus();
		return false;
	}
	if(com_user_id.val() != ''){
		if(com_user_id.val() != ''){
			var engNumPattern = /([^-a-zA-Z0-9 ])/;

			engNumPattern = com_user_id.val().match(engNumPattern);	
			if(engNumPattern != null){
			alert("영어와 숫자만입력 할 수 있습니다.");
			com_user_id.focus();
			return false;
			}
		}
		if (com_user_id.val().length < 3 || com_user_id.val().length > 15){
			alert("아이디는 4자 에서 15자 까지만 허용합니다.");
			com_user_id.focus();
			return false;
		}
	}
	
}



// 패스워드 체크
function chkPass(com_user_pass,com_user_pass_ok){
	if(com_user_pass.val() == ''){
		alert("비밀번호를 입력해 주세요");		
		com_user_pass.focus();
		return false;
	}
	if(com_user_pass_ok.val() == ''){
		alert("비밀번호확인을 입력해 주세요");		
		com_user_pass_ok.focus();
		return false;
	}
	if(com_user_pass.val() != ''){

		
		var hanNo = /[^0-9A-Za-z~!@#$%^&*()_+=\-,.\/<>?[\]{};':"]/;
		hanNo = com_user_pass.val().match(hanNo);	
		if(hanNo != null){
			alert("영어와 숫자,특수기호만 입력 할 수 있습니다.");
			com_user_pass.focus();
			return false;
		}
		
		if (com_user_pass.val().length < 6 || com_user_pass.val().length > 15){
			alert("비밀번호는 6자 에서 15자 까지만 허용합니다1212.");
			com_user_pass.focus();
			return false;
		}

		if(com_user_pass.val() !=  com_user_pass_ok.val()) {	
			alert("비밀번호가 일치하지 않습니다. 재확인 해주세요.");
			com_user_pass.val('');
			com_user_pass_ok.val('');
			com_user_pass.focus();
			return false;
		}
		
	}	
}


//이메일 체크
function chkEmail(com_user_email){
	if(com_user_email.val() != ''){
		var com_user_email_split = com_user_email.val().split(";");
		var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
		
		for(var i=0; i < com_user_email_split.length; i++){
			if(!emailPattern.test(com_user_email_split[i])){
				alert('잘못된 e-mail 형식입니다.');
				com_user_email.focus();
				return false;
			}
		}
	}
}

/* 
한글의 경우 키 입력시 바로바로 작업이 안되기 때문에 
onchange 와 onblur 등 이벤트도 같이 등록. 
*/ 

// 한글만 입력받기 (초성체 무시) 
// 나머지 글자 무시 
function nr_han(this_s,type){ 
    /* 
    type 
    -> 'c' : 초성 포함 
    -> 's' : 초성 포함 + 공백 포함 
    -> '' : 초성, 공백 무시 
    */ 
    temp_value = this_s.value.toString(); 
    regexp = ''; 
    repexp = ''; 
    switch(type){ 
        case 'c': regexp = /[^ㄱ-ㅎ가-힣]/g;break; 
        case 's': regexp = /[^ㄱ-ㅎ가-힣\s]/g;break; 
        case '':    regexp = /[^가-힣]/g; break; 
        default : regexp = /[^ㄱ-ㅎ가-힣\s]/g; 
    } 
    if(regexp.test(temp_value)) 
    { 
        temp_value = temp_value.replace(regexp,repexp); 
        this_s.value = temp_value; 
    } 
} 

/*-------------------------------------------------------------------------------*/ 

// 한글만 입력받기 (초성체 포함) 
// 나머지 글자 무시 
function nr_han_cho(this_s){ 
    nr_han(this_s,'c'); 
} 

/*-------------------------------------------------------------------------------*/ 

// 한글만 입력받기 (초성체 포함, 공백 포함) 
// 나머지 글자 무시 
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
// 나머지 글자 무시 
function nr_num(this_s,type){ 
    /* 
    type 
    -> 'int' : 양의 정수 
    -> 'float' : 양의 실수 
    -> '-int' : 음의 정수 포함 
    -> '-int' : 음의 실수 포함 
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
// 양의 정수만 입력받기 
function nr_num_int(this_s){ 
    nr_num(this_s,'int'); 
} 
// 양의 실수만 입력받기 
function nr_num_float(this_s){ 
    nr_num(this_s,'float'); 
} 

/*-------------------------------------------------------------------------------*/ 

// 영어만 입력받기  (대소문자) 
// 나머지 글자 무시 
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



// 영어만 입력받기  (소문자) 
// 나머지 글자 무시 
function nr_eng_small(this_s){ 
    nr_eng(this_s,'small'); 
} 

// 영어만 입력받기  (대문자) 
// 나머지 글자 무시 
function nr_eng_big(this_s){ 
    nr_eng(this_s,'big'); 
} 
// 전화번호 규격에 맞게 DDD-MM~M-XXXX 
// 나머지 글자 무시 
function nr_phone(this_s) 
{ 
    temp_value = this_s.value.toString(); 
    temp_value = temp_value.replace(/[^0-9]/g,''); 
    temp_value = temp_value.replace(/(0(?:2|[0-9]{2}))([0-9]+)([0-9]{4}$)/,"$1-$2-$3"); 
    this_s.value = temp_value; 
} 



//전화번호 규격에 맞게 DDD-MM~M-XXXX 
//나머지 글자 무시 
function nr_email(this_s) 
{ 
 temp_value = this_s.value.toString(); 
 temp_value = temp_value.replace(/[^-a-zA-Z0-9._]/g,'');
 this_s.value = temp_value; 
}


/*-------------------------------------------------------------------------------*/ 


// 주민등록 번호 규격에 맞게 123456-1234567  //검증하지 않음. 
// 나머지 글자 무시 
function nr_jumin(this_s) 
{ 
    temp_value = this_s.value.toString(); 
    temp_value = temp_value.replace(/[^0-9]/g,''); 
    temp_value = temp_value.substr(0,13); 
    temp_value = temp_value.replace(/([0-9]{6})([0-9]{7}$)/,"$1-$2"); 
    this_s.value = temp_value; 
} 



/*-------------------------------------------------------------------------------*/ 

// 사업자 등록 번호 규격에 맞게 123-12-12345  //검증하지 않음. 
// 나머지 글자 무시 
function nr_company_num(this_s) 
{ 
    temp_value = this_s.value.toString(); 
    temp_value = temp_value.replace(/[^0-9]/g,''); 
    temp_value = temp_value.substr(0,10); 
    temp_value = temp_value.replace(/([0-9]{3})([0-9]{2})([0-9]{5}$)/,"$1-$2-$3"); 
    this_s.value = temp_value; 
} 

