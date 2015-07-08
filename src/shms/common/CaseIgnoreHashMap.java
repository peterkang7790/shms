/*
 * CaseIgnoreHashMap.java 1.0, 2009. 5. 29.
 * 
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.common;

import java.util.HashMap;
import java.util.Set;

public class CaseIgnoreHashMap extends HashMap {
	
	HashMap caseHashMap = new HashMap();
	

	public HashMap getCaseHashMap() {
		return caseHashMap;
	}

	public void setCaseHashMap(HashMap caseHashMap) {
		this.caseHashMap = caseHashMap;
	}

	public Object put(Object key, Object value){
		
		//String caseIgnoreKey = key.toString().toLowerCase().replaceAll("_", "");
		String caseIgnoreKey = key.toString().toLowerCase();
		
		Object retObj = null;
		
//		if(super.get(caseIgnoreKey) == null){
			retObj = super.put(caseIgnoreKey, value);
			caseHashMap.put(key, value);
//		}
		
		return retObj;
	}
	
	public Object get(Object key){
		
		//key = key.toString().toLowerCase().replace("_", "");
		key = key.toString().toLowerCase();
		
		return super.get(key);
	}
	
	public Set keySet() {
		Set set = super.keySet();
		
		return set;
	}
	
//	
//	public Collection values() {
//		// TODO Auto-generated method stub
//		return super.values();
//	}
	
	
}

