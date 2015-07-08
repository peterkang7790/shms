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
	 * validation check�� �Ҷ� 
	 * hashMap name�� view(jsp)���� �ԷµǾ������� �˼� �ְ� �ϱ� ���ؼ���
	 * stack�� getter setter�� ���ǵ� hashMap(���⿡���� reqMap�̸��� ����)�̸��� �����ϰ�
	 * hashMap�� ����� ���� �����Ѵ�.
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
		// HashMap reqMap�� ���� stack�� �־��ش�.
		Object obj = (Map)stack.findValue("reqMap");
		
		// HashMap reqMap�� null�� �ƴҶ�
		if(obj != null){
			Map m = (Map)obj;
			// stack�� �ִ� HashMap reqMap���� name���� �����ͼ� valueStack�� �÷��ش�.
			retVal = m.get(name);
		}
		// HashMap reqMap�� null�϶�
		else{
			// getter setter�� ����� name�� ���� valueStack�� �÷��ش�.
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
		df.setLenient(false); // false �� �����ؾ� ������ �ؼ��� ��.
	
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

