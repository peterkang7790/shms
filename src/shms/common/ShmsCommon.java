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
		//�ӽ÷� �����׸��  ���������� ����  �����
		// msr_item_id
		msrItemMap.put("A1", "��ǥ�ܸ�����");
		msrItemMap.put("A2", "����µ�");
		msrItemMap.put("A3", "������");
		msrItemMap.put("A4", "���οµ�");
		msrItemMap.put("A5", "������");
		msrItemMap.put("A6", "�����̺�µ�");
		
		// sensor_type_id
		senTypeidMap.put("S1", "��������");
		senTypeidMap.put("S2", "�µ���");
		senTypeidMap.put("S3", "2�����");
		senTypeidMap.put("S4", "1�డ�Ӱ�");
		
		yesOrno.put("Y", "��");
		yesOrno.put("N", "�ƴϿ�");
		
		
		almStateMap.put("CRI", "����");
		almStateMap.put("MAJ", "���");
		almStateMap.put("MIN", "����");
		almStateMap.put("SAF", "����");
		
		choiceDtMap.put("D5", "����");
		choiceDtMap.put("D4", "�ֱ��Ѵ�");
		choiceDtMap.put("D3", "�ֱ�������");
		choiceDtMap.put("D2", "����");
		choiceDtMap.put("D1", "�ֱ�1�ð�");
		
		choiceHkMap.put("T1", "5�����");
		choiceHkMap.put("T2", "Hour");
		choiceHkMap.put("T3", "Daily");
		choiceHkMap.put("T4", "Weekly");
		choiceHkMap.put("T5", "Monthly");
		
		almChangePolMap.put("A1", "��ǥ�˶�");
		almChangePolMap.put("A2", "�����˶�");
		
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
	
	// ����¡ ������ ��� ������ȣ �ֱ�
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
