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
     * num길이만큼 key앞에 0을 붙인다.
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
     * 리스트의 값을받아 hashMap으로 캐스팅후 key값을 비교하여 
     * 동일한 value의 count를 map으로 구한다.
     * @param list 리스트
     * @param key 해쉬맵 키
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
     * 연도별 시작연도와 마지막연도를 입력 받아서 전체 연도목록을 생성한다.
     * ForExample)
     * 입력값 : 2008-2010
     * 출력값 : {2008,2009,2010}
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
	 * 리스트 값을 받아 특정 index열의 arrayList값을 삭제한다.
	 * @param list 리스트 값
	 * @param removeInt 삭제할 int배열값 
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
	 * String를 받아 '${}'사이에 있는 문자를 replace한다.
	 * For example :
	 * 이것은 ${test } 입니다. => 이것은 테스트 입니다.	 
	 * @param targetString 원본 String 값
	 * @param map 변환할 값
	 * @return
	 */
	public static String getReplaceData(String targetString, Map map){
		int indexNum = 0;

		List<Integer> startList = new ArrayList<Integer>();
		List<Integer> endList = new ArrayList<Integer>();
		for(int i=1; i < targetString.length(); i++){
			int start = targetString.indexOf("${", indexNum); // '${' 문자열을 찾는 index번호 
			
			// 더이상 찾는 문자열이 없으면 중단한다.
			if(start == -1){
				break;
			}

			indexNum = start+1; // '${' 문자열을 찾았으면 찾은 index숫자에 +1을 하여 다음 '${'의 문자열을 찾는다.

			startList.add(start); // startList에 index번호를 저장한다.
		}
		
		// '${'문자열을 찾은 startList의 값으로 '}'의 문자열 index번호를 찾는다.
		for(int i=0; i < startList.size(); i++){
			int end = targetString.indexOf("}", startList.get(i)); // '}' 문자열을 찾는 index번호
			endList.add(end); // endList에 index번호를 저장한다.	
		}
		
		String saveString = ""; // 임시저장소
		String resultString = targetString; // 결과값 저장
		for(int i=0; i < startList.size(); i++){
			String terget = targetString.substring(startList.get(i), endList.get(i)+1); // 변환할 타켓 String
			String replacement = targetString.substring(startList.get(i).intValue()+2, endList.get(i)).trim(); // 변경될 String name
			String replacement_prop = null; // properties에서 불러온값을 저장
        	saveString = resultString; // 임시저장소에 결과값을 저장한다.
        	
	        Iterator itr = ShmsProperties.list().keySet().iterator();
	        while (itr.hasNext()) {
	            String key = (String)itr.next().toString().trim();
            	
				if(key.equals(replacement)){
					replacement_prop = ShmsProperties.get(key);	// 약관모니터링 url을 properties정보에서 불러온다.
				}
	        }
	        
	        if(replacement_prop == null){
				if(map.get(replacement) == null){
					replacement = "-"; // 값이 없으면 '-'처리한다.
				}
				// map에 있는 정보를 불러온다.
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
