/*
 * Util.java 1.0, 2009. 6. 27.
 * 
 * Copyright (c) 2008 BY LSWARE INC. All rights reserved.
 */

package shms.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class Utils {
    /**
     * num���̸�ŭ key�տ� 0�� ���δ�.
     * @param key
     * @param num
     * @return key
     */
    public String getZeroLength(String key, int num){
    	String ZERO = "";
    	
    	for(int i=key.length(); i < num; i++){
			ZERO += "0";
		}
    	
    	return ZERO + key;
    }
    
    /**
     * ����Ʈ�� �����޾� hashMap���� ĳ������ key���� ���Ͽ� 
     * ������ value�� count�� map���� ���Ѵ�.
     * @param list ����Ʈ
     * @param key �ؽ��� Ű
     * @return
     */
    public Map getMergeMap(List list, String key){
    	String beforeString = "";
    	String afterString = "";
    	int num = 1;
    	Map map = new HashMap();
    	Map mergeMap = new HashMap();
    	
    	for(int i=0; i < list.size(); i++){
    		map = (HashMap)list.get(i);
    		beforeString = (String) map.get(key);

    		if(!beforeString.equals(afterString)){
    			num = 1;
    		}
    		
    		if(beforeString.equals(afterString)){
    			num++;
    		}
    		
    		mergeMap.put(beforeString, num);	
    		afterString = beforeString;
    	}
    	
    	return mergeMap;
    }
    
    /**
     * ������ ���ۿ����� ������������ �Է� �޾Ƽ� ��ü ��������� �����Ѵ�.
     * ForExample)
     * �Է°� : 2008-2010
     * ��°� : {2008,2009,2010}
     * @param startYear
     * @param endYear
     * @return
     */
    public static ArrayList getYearList(String startYear, String endYear){
		int stat_dt_sdt = Integer.parseInt(startYear);
    	int stat_dt_edt = Integer.parseInt(endYear);
    	
    	ArrayList<String>  yearList = new ArrayList();
    	
    	for(int i=stat_dt_sdt ; i <= stat_dt_edt ; i++){
    		yearList.add(String.valueOf(i));
    	}
    	
    	return yearList;
    }

	public static List getPrefixList(List list, String prefix) {
		List prefixList = new ArrayList();
		
		for(int i=0; i < list.size() ; i++){
			prefixList.add(prefix + list.get(i));
		}
		
		return prefixList;
	}    
	
	/**
	 * ����Ʈ ���� �޾� Ư�� index���� arrayList���� �����Ѵ�.
	 * @param list ����Ʈ ��
	 * @param removeInt ������ int�迭�� 
	 * @return
	 */
	public static List listRemove(List list, int[] removeInt){
		
		ArrayList codeList = (ArrayList)list;
		
		for(int i=0; i < removeInt.length; i++){
			codeList.remove(removeInt[i]);	
		}
		
		return codeList;
	}
	
	/**
	 * String�� �޾� '${}'���̿� �ִ� ���ڸ� replace�Ѵ�.
	 * For example :
	 * �̰��� ${test } �Դϴ�. => �̰��� �׽�Ʈ �Դϴ�.	 
	 * @param targetString ���� String ��
	 * @param map ��ȯ�� ��
	 * @return
	 */
	public static String getReplaceData(String targetString, Map map){
		int indexNum = 0;

		List<Integer> startList = new ArrayList<Integer>();
		List<Integer> endList = new ArrayList<Integer>();
		for(int i=1; i < targetString.length(); i++){
			int start = targetString.indexOf("${", indexNum); // '${' ���ڿ��� ã�� index��ȣ 
			
			// ���̻� ã�� ���ڿ��� ������ �ߴ��Ѵ�.
			if(start == -1){
				break;
			}

			indexNum = start+1; // '${' ���ڿ��� ã������ ã�� index���ڿ� +1�� �Ͽ� ���� '${'�� ���ڿ��� ã�´�.

			startList.add(start); // startList�� index��ȣ�� �����Ѵ�.
		}
		
		// '${'���ڿ��� ã�� startList�� ������ '}'�� ���ڿ� index��ȣ�� ã�´�.
		for(int i=0; i < startList.size(); i++){
			int end = targetString.indexOf("}", startList.get(i)); // '}' ���ڿ��� ã�� index��ȣ
			endList.add(end); // endList�� index��ȣ�� �����Ѵ�.	
		}
		
		String saveString = ""; // �ӽ������
		String resultString = targetString; // ����� ����
		for(int i=0; i < startList.size(); i++){
			String terget = targetString.substring(startList.get(i), endList.get(i)+1); // ��ȯ�� Ÿ�� String
			String replacement = targetString.substring(startList.get(i).intValue()+2, endList.get(i)).trim(); // ����� String name
			String replacement_prop = null; // properties���� �ҷ��°��� ����
        	saveString = resultString; // �ӽ�����ҿ� ������� �����Ѵ�.
        	
	        Iterator itr = ShmsProperties.list().keySet().iterator();
	        while (itr.hasNext()) {
	            String key = (String)itr.next().toString().trim();
            	
				if(key.equals(replacement)){
					replacement_prop = ShmsProperties.get(key);	// �������͸� url�� properties�������� �ҷ��´�.
				}
	        }
	        
	        if(replacement_prop == null){
				if(map.get(replacement) == null){
					replacement = "-"; // ���� ������ '-'ó���Ѵ�.
				}
				// map�� �ִ� ������ �ҷ��´�.
				else{
					replacement = map.get(replacement).toString();
				}
	        }
	        
	        if(replacement_prop != null){
	        	replacement = replacement_prop;
	        }
			resultString = saveString.replace(terget, replacement);
		}
		
		return resultString;
	}
}
