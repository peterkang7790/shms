package shms.validation;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import com.opensymphony.xwork2.validator.ValidationException;
import com.opensymphony.xwork2.validator.validators.EmailValidator;

public class CustomEmailValidator extends EmailValidator {

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
	
}

