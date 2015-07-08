package shms.common;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.TreeMap;

public class ShmsCommon {
	
	private static Map<String, String> msrItemMap = new HashMap<String, String>();
	private static Map<String, String> senTypeidMap = new HashMap<String,String>();
	private static Map<String, String> yesOrno = new HashMap<String,String>();
	private static TreeMap<String, String> almStateMap = new TreeMap<String,String>();
	private static TreeMap<String, String> choiceDtMap = new TreeMap<String,String>();
	private static TreeMap<String, String> choiceHkMap = new TreeMap<String,String>();
	private static TreeMap<String, String> almChangePolMap = new TreeMap<String,String>();
	
	static
	{
		//임시로 계축항목과  센서종류의 맵을  만든다
		// msr_item_id
		msrItemMap.put("A1", "대표단면응력");
		msrItemMap.put("A2", "부재온도");
		msrItemMap.put("A3", "경사범위");
		msrItemMap.put("A4", "내부온도");
		msrItemMap.put("A5", "행어장력");
		msrItemMap.put("A6", "주케이블온도");
		
		// sensor_type_id
		senTypeidMap.put("S1", "변형율계");
		senTypeidMap.put("S2", "온도계");
		senTypeidMap.put("S3", "2축경사계");
		senTypeidMap.put("S4", "1축가속계");
		
		yesOrno.put("Y", "예");
		yesOrno.put("N", "아니오");
		
		
		almStateMap.put("CRI", "위험");
		almStateMap.put("MAJ", "경고");
		almStateMap.put("MIN", "주의");
		almStateMap.put("SAF", "안전");
		
		choiceDtMap.put("D5", "직접");
		choiceDtMap.put("D4", "최근한달");
		choiceDtMap.put("D3", "최근일주일");
		choiceDtMap.put("D2", "당일");
		choiceDtMap.put("D1", "최근1시간");
		
		choiceHkMap.put("T1", "5분통계");
		choiceHkMap.put("T2", "Hour");
		choiceHkMap.put("T3", "Daily");
		choiceHkMap.put("T4", "Weekly");
		choiceHkMap.put("T5", "Monthly");
		
		almChangePolMap.put("A1", "대표알람");
		almChangePolMap.put("A2", "최종알람");
		
	}
	
	public ShmsCommon()
	{
		
	}
	
	public static Map getMsrItemMap()
	{
		return msrItemMap;
	}
	
	public static Map getSenTypeMap()
	{
		return senTypeidMap;
	}
	
	public static Map getYesOrnoMap()
	{
		return yesOrno;
	}
	
	public static TreeMap getAlmStateMap()
	{
		return almStateMap;
	}
	
	public static TreeMap getChoiceDtMap()
	{
		return choiceDtMap;
	}
	
	public static TreeMap getChoiceHkMap()
	{
		return choiceHkMap;
	}
	
	public static TreeMap getAlmChangePolMap()
	{
		return almChangePolMap;
	}
	
	
	public static String getMsrItemMap( String code )
	{	
		return (String) msrItemMap.get( code );
	}
	
	public static String getSenTypeMap( String code )
	{	
		return (String) senTypeidMap.get( code );
	}
	
	public static String getYesNoMap( String code )
	{	
		return (String) yesOrno.get( code );
	}
	
	public static String getAlmStateMap( String code )
	{	
		return (String) almStateMap.get( code );
	}

	public static String getChoiceDtMap( String code )
	{	
		return (String) choiceDtMap.get( code );
	}
	
	public static String getChoiceHkMap( String code )
	{	
		return (String) choiceHkMap.get( code );
	}

	public static String getAlmChangePolMap( String code )
	{	
		return (String) almChangePolMap.get( code );
	}
	
	// 페이징 에따른 목록 순차번호 주기
	public static int rtPageNum(int nPage, int endPage)
	{
		int a;
		if( nPage > 1 )
		{
			a=endPage-9;
		}
		else
		{
			a=1;
		}
		return (int)a;
	}
	
}
