package shms.validation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import com.opensymphony.xwork2.validator.ValidationException;
import com.opensymphony.xwork2.validator.validators.FieldValidatorSupport;

public class CustomDateFieldValidator extends FieldValidatorSupport {

	/**
	 * validation check를 할때 
	 * hashMap name이 view(jsp)에서 입력되었는지를 알수 있게 하기 위해서는
	 * stack에 getter setter로 정의된 hashMap(여기에서는 reqMap이름을 쓴다)이름을 지정하고
	 * hashMap에 저장된 값을 리턴한다.
	 */
	@Override
	protected Object getFieldValue(String name, Object object) 
	throws ValidationException{
	    ValueStack stack = ActionContext.getContext().getValueStack();

	    boolean pop = false;

	    if (!(stack.getRoot().contains(object))) {
	      stack.push(object);
	      pop = true;
	    }
	    
	    Object retVal = null;
		// HashMap reqMap의 값을 stack에 넣어준다.
		Object obj = (Map)stack.findValue("reqMap");
		
		// HashMap reqMap이 null이 아닐때
		if(obj != null){
			Map m = (Map)obj;
			// stack에 있는 HashMap reqMap값을 name으로 가져와서 valueStack에 올려준다.
			retVal = m.get(name);
		}
		// HashMap reqMap이 null일때
		else{
			// getter setter을 사용한 name의 값을 valueStack에 올려준다.
			retVal = stack.findValue(name);
		}
		
		if (pop) {
			stack.pop();
		}
	    
	    return retVal;
	}

	public void validate(Object paramObject) throws ValidationException {
		String fieldName = getFieldName();
		Object value = getFieldValue(fieldName, paramObject);
		
		if(!(value instanceof String)){
			addFieldError(fieldName, paramObject);
		}
		else{
			String s = (String)value;
			
			if(checkDate(s) == false){
				addFieldError(fieldName, paramObject);
			}
		}
	}
	
	public static boolean checkDate(String str)
	{
		boolean dateValidity = true;
	
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd",Locale.KOREA); //20041102101244
		df.setLenient(false); // false 로 설정해야 엄밀한 해석을 함.
	
		try {
			Date dt = df.parse(str);
		}
		catch(ParseException pe){
			dateValidity = false;
		}catch(IllegalArgumentException ae){
			dateValidity = false;
		}
	
		return dateValidity;
	}		
	
}

