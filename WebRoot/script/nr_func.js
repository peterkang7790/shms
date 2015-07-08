

/*-------------------------------------------------------------------------------*/ 

// ¾ÆÀÌµğ Ã¼Å©
function chkId(com_user_id){

	if(com_user_id.val() == ''){
		alert("ID¸¦ ÀÔ·ÂÇØ ÁÖ¼¼¿ä");		
		com_user_id.focus();
		return false;
	}
	if(com_user_id.val() != ''){
		if(com_user_id.val() != ''){
			var engNumPattern = /([^-a-zA-Z0-9 ])/;

			engNumPattern = com_user_id.val().match(engNumPattern);	
			if(engNumPattern != null){
			alert("¿µ¾î¿Í ¼ıÀÚ¸¸ÀÔ·Â ÇÒ ¼ö ÀÖ½À´Ï´Ù.");
			com_user_id.focus();
			return false;
			}
		}
		if (com_user_id.val().length < 3 || com_user_id.val().length > 15){
			alert("¾ÆÀÌµğ´Â 4ÀÚ ¿¡¼­ 15ÀÚ ±îÁö¸¸ Çã¿ëÇÕ´Ï´Ù.");
			com_user_id.focus();
			return false;
		}
	}
	
}



// ÆĞ½º¿öµå Ã¼Å©
function chkPass(com_user_pass,com_user_pass_ok){
	if(com_user_pass.val() == ''){
		alert("ºñ¹Ğ¹øÈ£¸¦ ÀÔ·ÂÇØ ÁÖ¼¼¿ä");		
		com_user_pass.focus();
		return false;
	}
	if(com_user_pass_ok.val() == ''){
		alert("ºñ¹Ğ¹øÈ£È®ÀÎÀ» ÀÔ·ÂÇØ ÁÖ¼¼¿ä");		
		com_user_pass_ok.focus();
		return false;
	}
	if(com_user_pass.val() != ''){

		
		var hanNo = /[^0-9A-Za-z~!@#$%^&*()_+=\-,.\/<>?[\]{};':"]/;
		hanNo = com_user_pass.val().match(hanNo);	
		if(hanNo != null){
			alert("¿µ¾î¿Í ¼ıÀÚ,Æ¯¼ö±âÈ£¸¸ ÀÔ·Â ÇÒ ¼ö ÀÖ½À´Ï´Ù.");
			com_user_pass.focus();
			return false;
		}
		
		if (com_user_pass.val().length < 6 || com_user_pass.val().length > 15){
			alert("ºñ¹Ğ¹øÈ£´Â 6ÀÚ ¿¡¼­ 15ÀÚ ±îÁö¸¸ Çã¿ëÇÕ´Ï´Ù1212.");
			com_user_pass.focus();
			return false;
		}

		if(com_user_pass.val() !=  com_user_pass_ok.val()) {	
			alert("ºñ¹Ğ¹øÈ£°¡ ÀÏÄ¡ÇÏÁö ¾Ê½À´Ï´Ù. ÀçÈ®ÀÎ ÇØÁÖ¼¼¿ä.");
			com_user_pass.val('');
			com_user_pass_ok.val('');
			com_user_pass.focus();
			return false;
		}
		
	}	
}


//ÀÌ¸ŞÀÏ Ã¼Å©
function chkEmail(com_user_email){
	if(com_user_email.val() != ''){
		var com_user_email_split = com_user_email.val().split(";");
		var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
		
		for(var i=0; i < com_user_email_split.length; i++){
			if(!emailPattern.test(com_user_email_split[i])){
				alert('Àß¸øµÈ e-mail Çü½ÄÀÔ´Ï´Ù.');
				com_user_email.focus();
				return false;
			}
		}
	}
}

/* 
ÇÑ±ÛÀÇ °æ¿ì Å° ÀÔ·Â½Ã ¹Ù·Î¹Ù·Î ÀÛ¾÷ÀÌ ¾ÈµÇ±â ¶§¹®¿¡ 
onchange ¿Í onblur µî ÀÌº¥Æ®µµ °°ÀÌ µî·Ï. 
*/ 

// ÇÑ±Û¸¸ ÀÔ·Â¹Ş±â (ÃÊ¼ºÃ¼ ¹«½Ã) 
// ³ª¸ÓÁö ±ÛÀÚ ¹«½Ã 
function nr_han(this_s,type){ 
    /* 
    type 
    -> 'c' : ÃÊ¼º Æ÷ÇÔ 
    -> 's' : ÃÊ¼º Æ÷ÇÔ + °ø¹é Æ÷ÇÔ 
    -> '' : ÃÊ¼º, °ø¹é ¹«½Ã 
    */ 
    temp_value = this_s.value.toString(); 
    regexp = ''; 
    repexp = ''; 
    switch(type){ 
        case 'c': regexp = /[^¤¡-¤¾°¡-ÆR]/g;break; 
        case 's': regexp = /[^¤¡-¤¾°¡-ÆR\s]/g;break; 
        case '':    regexp = /[^°¡-ÆR]/g; break; 
        default : regexp = /[^¤¡-¤¾°¡-ÆR\s]/g; 
    } 
    if(regexp.test(temp_value)) 
    { 
        temp_value = temp_value.replace(regexp,repexp); 
        this_s.value = temp_value; 
    } 
} 

/*-------------------------------------------------------------------------------*/ 

// ÇÑ±Û¸¸ ÀÔ·Â¹Ş±â (ÃÊ¼ºÃ¼ Æ÷ÇÔ) 
// ³ª¸ÓÁö ±ÛÀÚ ¹«½Ã 
function nr_han_cho(this_s){ 
    nr_han(this_s,'c'); 
} 

/*-------------------------------------------------------------------------------*/ 

// ÇÑ±Û¸¸ ÀÔ·Â¹Ş±â (ÃÊ¼ºÃ¼ Æ÷ÇÔ, °ø¹é Æ÷ÇÔ) 
// ³ª¸ÓÁö ±ÛÀÚ ¹«½Ã 
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
// ³ª¸ÓÁö ±ÛÀÚ ¹«½Ã 
function nr_num(this_s,type){ 
    /* 
    type 
    -> 'int' : ¾çÀÇ Á¤¼ö 
    -> 'float' : ¾çÀÇ ½Ç¼ö 
    -> '-int' : À½ÀÇ Á¤¼ö Æ÷ÇÔ 
    -> '-int' : À½ÀÇ ½Ç¼ö Æ÷ÇÔ 
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
// ¾çÀÇ Á¤¼ö¸¸ ÀÔ·Â¹Ş±â 
function nr_num_int(this_s){ 
    nr_num(this_s,'int'); 
} 
// ¾çÀÇ ½Ç¼ö¸¸ ÀÔ·Â¹Ş±â 
function nr_num_float(this_s){ 
    nr_num(this_s,'float'); 
} 

/*-------------------------------------------------------------------------------*/ 

// ¿µ¾î¸¸ ÀÔ·Â¹Ş±â  (´ë¼Ò¹®ÀÚ) 
// ³ª¸ÓÁö ±ÛÀÚ ¹«½Ã 
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



// ¿µ¾î¸¸ ÀÔ·Â¹Ş±â  (¼Ò¹®ÀÚ) 
// ³ª¸ÓÁö ±ÛÀÚ ¹«½Ã 
function nr_eng_small(this_s){ 
    nr_eng(this_s,'small'); 
} 

// ¿µ¾î¸¸ ÀÔ·Â¹Ş±â  (´ë¹®ÀÚ) 
// ³ª¸ÓÁö ±ÛÀÚ ¹«½Ã 
function nr_eng_big(this_s){ 
    nr_eng(this_s,'big'); 
} 
// ÀüÈ­¹øÈ£ ±Ô°İ¿¡ ¸Â°Ô DDD-MM~M-XXXX 
// ³ª¸ÓÁö ±ÛÀÚ ¹«½Ã 
function nr_phone(this_s) 
{ 
    temp_value = this_s.value.toString(); 
    temp_value = temp_value.replace(/[^0-9]/g,''); 
    temp_value = temp_value.replace(/(0(?:2|[0-9]{2}))([0-9]+)([0-9]{4}$)/,"$1-$2-$3"); 
    this_s.value = temp_value; 
} 



//ÀüÈ­¹øÈ£ ±Ô°İ¿¡ ¸Â°Ô DDD-MM~M-XXXX 
//³ª¸ÓÁö ±ÛÀÚ ¹«½Ã 
function nr_email(this_s) 
{ 
 temp_value = this_s.value.toString(); 
 temp_value = temp_value.replace(/[^-a-zA-Z0-9._]/g,'');
 this_s.value = temp_value; 
}


/*-------------------------------------------------------------------------------*/ 


// ÁÖ¹Îµî·Ï ¹øÈ£ ±Ô°İ¿¡ ¸Â°Ô 123456-1234567  //°ËÁõÇÏÁö ¾ÊÀ½. 
// ³ª¸ÓÁö ±ÛÀÚ ¹«½Ã 
function nr_jumin(this_s) 
{ 
    temp_value = this_s.value.toString(); 
    temp_value = temp_value.replace(/[^0-9]/g,''); 
    temp_value = temp_value.substr(0,13); 
    temp_value = temp_value.replace(/([0-9]{6})([0-9]{7}$)/,"$1-$2"); 
    this_s.value = temp_value; 
} 



/*-------------------------------------------------------------------------------*/ 

// »ç¾÷ÀÚ µî·Ï ¹øÈ£ ±Ô°İ¿¡ ¸Â°Ô 123-12-12345  //°ËÁõÇÏÁö ¾ÊÀ½. 
// ³ª¸ÓÁö ±ÛÀÚ ¹«½Ã 
function nr_company_num(this_s) 
{ 
    temp_value = this_s.value.toString(); 
    temp_value = temp_value.replace(/[^0-9]/g,''); 
    temp_value = temp_value.substr(0,10); 
    temp_value = temp_value.replace(/([0-9]{3})([0-9]{2})([0-9]{5}$)/,"$1-$2-$3"); 
    this_s.value = temp_value; 
} 

