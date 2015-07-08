package shms.pda;

import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.comm.CommPortIdentifier;
import javax.comm.SerialPort;

public class Rs232c {
	
    public static void main( String arg[] ) {
    	int checkflag = 0;
    	ArrayList<String> alm_N_Lst = new ArrayList<String>();     // �˶���ȣ ����Ʈ
    	ArrayList<String> alm_Code_Lst = new ArrayList<String>();  // �˶��ڵ� ����Ʈ
    	ArrayList<String> Sensor_ID_Lst = new ArrayList<String>(); // ����ID ����Ʈ
    	ArrayList<String> alm_Size = new ArrayList<String>();     // �˶��������� ����Ʈ
    	
    	ArrayList<String> Object_Lst = new ArrayList<String>(); // ��ü ����Ʈ
    	
    	try  // JDBC ����̹� �ε�
    	{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		System.out.println("����̹��ε� ����");
    	} catch (ClassNotFoundException e) {
    		e.printStackTrace();
    	}

    	try  // ��� ����
    	{
    		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.100.233:1521:orcl", "shms", "shms001");
    		
    		
    		System.out.println("���Ӽ���");
    		
    		Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    		
    		
    		
    		String roNum = "";
    		String TroubleID = "";
			String StructNM = "";
			String StructId = "";
			String SenId = "";
			String TroubleCd = "";
			String TroublemSG = "";
			String ClassNM = "";
			String Prodt = "";
			String UserId = "";
			String PassWd = "";
			String UserNM = "";
			String mNO = "";
			String telNO = "";
			String content = "";

			String troubleId = "";
			String[] troubleIdArr = new String[1000];
			//troubleIdArr = new String[alm_N_Lst.size()];

			String query_almID = "SELECT TROUBLE_ID FROM PPP_TROUBLE WHERE TROUBLE_CLASS_CD IS NOT NULL AND PPP_TROUBLE.SMS_SEND_YN = 'N'";
			
			System.out.println("query_almID = " + query_almID);
    		ResultSet rset = st.executeQuery(query_almID);
    		
			int idx = 0;
    		while(rset.next()) 
			{
    			alm_N_Lst.add( rset.getString(1) );
    			troubleIdArr[idx++] = rset.getString(1);
				System.out.println("TROUBLE_ID = " + rset.getString(1));
			}
			
    		boolean okPort = true;
    		
//    		String sendSize = "select count(u.sms_recv_yn) from  ppp_user u where u.sms_recv_yn = 'Y'";
//    		ResultSet senA = st.executeQuery(sendSize);
//    		
//    		while(senA.next())
//    		{
//    			alm_Size.add( senA.getString(1) );
//    		}
//    		
    		
			if ( alm_N_Lst.size() > 0 ) // �˶��޽����� �ִ� ���,  �� �̺�Ʈ�� �߻��Ѱ��.
    		{
    			for ( int i = 0 ; i < alm_N_Lst.size() ; i++ )
    			{
    				String query_state = " select t.TROUBLE_ID, c.STRUCT_NM, c.STRUCT_ID, " 
    									 +" t.SENSOR_ID, t.TROUBLE_CLASS_CD, t.TROUBLE_MSG," 
    									 +" (select COMMON_DET_NM from PPP_COMMON_DET_CODE where COMMON_CD = 'TROUBLE' and COMMON_DET_CD = t.TROUBLE_CLASS_CD) as TROUBLE_CLASS_NM, "
    									 +" t.TROUBLE_PROD_DT, u.USER_ID, u.PASSWORD, u.USER_NM, u.MOBILE_NO , c.STRUCT_TEL_NO"
										 +" from PPP_TROUBLE t, PPP_SENSOR s, PPP_STRUCT c, PPP_USER u "
										 +" where t.SENSOR_ID = s.SENSOR_ID "
										 +"  and s.STRUCT_ID = c.STRUCT_ID "
										 +"  and u.SMS_RECV_YN = 'Y' "
										 +"  and t.SMS_SEND_YN = 'N' "
										 +"  and t.TROUBLE_ID = '"+ alm_N_Lst.get(i) +"' ";
    				
    				System.out.println("query_state = " + query_state);
    				
       				ResultSet rsetObj = st.executeQuery(query_state);
       				
       				List alSizelst = resultSetToArrayList(rsetObj);
       				int aaa = alSizelst.size();
       				Map<String,String> alMap = null;
       				
       				String vDate = "";
       				
       				for( int j=0; j<alSizelst.size(); j++ )
    				{
    					
       					alMap = (Map)alSizelst.get(j);
       					
       					
       					
    					System.out.println("mobile_num = " + alMap.get("MOBILE_NO") != null ? alMap.get("MOBILE_NO").toString():"");

        				TroubleID = alMap.get("TROUBLE_ID") != null?alMap.get("TROUBLE_ID").toString():"";
    					StructNM = alMap.get("STRUCT_NM") != null?alMap.get("STRUCT_NM").toString():"";
    					StructId = alMap.get("STRUCT_ID") != null?alMap.get("STRUCT_ID").toString():"";
    					SenId = alMap.get("SENSOR_ID") != null?alMap.get("SENSOR_ID").toString():"";
    					TroubleCd = alMap.get("TROUBLE_CLASS_CD") != null ?alMap.get("TROUBLE_CLASS_CD").toString():"";
    					TroublemSG = alMap.get("TROUBLE_MSG") != null ? alMap.get("TROUBLE_MSG").toString():"";
    					ClassNM = alMap.get("TROUBLE_CLASS_NM")!=null ? alMap.get("TROUBLE_CLASS_NM").toString():"";
    					Prodt = alMap.get("TROUBLE_PROD_DT") != null ? alMap.get("TROUBLE_PROD_DT").toString():"";
    					UserId = alMap.get("USER_ID") != null ? alMap.get("USER_ID").toString():"";
    					PassWd = alMap.get("PASSWORD") != null ? alMap.get("PASSWORD").toString():"";
    					UserNM = alMap.get("USER_NM") != null ? alMap.get("USER_NM").toString():"";
    					mNO = alMap.get("MOBILE_NO") != null ? alMap.get("MOBILE_NO").toString():"";
    					telNO = alMap.get("STRUCT_TEL_NO") != null ? alMap.get("STRUCT_TEL_NO").toString():"";
    					
    					SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
    					
						Date sendDt = new Date();
    					
    					vDate = formatter.format(sendDt);
    					
     					okPort = sendSMS( TroubleID, StructNM, StructId, SenId, TroubleCd, TroublemSG, ClassNM, Prodt, UserId, PassWd,  UserNM, mNO, telNO );
    					
  //  					okPort = true;
    					
    					if( okPort )
    					{
    						content = "["+ ClassNM +"]" + StructNM +"�� ���� "+  SenId +"���� "+ ClassNM +"�߻� . ����� ��ġ �ٶ��ϴ�.";
        					
        					String query_insert = "insert into PPP_SMS_HIST ( TROUBLE_ID, SEND_DT, RECV_NM, RECV_NO, SEND_MSG, SMS_SEQ_NO, REG_DT )" 
        							+ "   values ('"+ TroubleID +"','"+vDate+"', '"+ UserNM +"'," 
    							    + "   '"+ mNO +"','"+ content +"', NVL((select max(SMS_SEQ_NO) + 1 from PPP_SMS_HIST), 1), SYSDATE) ";
        					
        					System.out.println("query_insert = " + query_insert);
        					st.executeUpdate(query_insert);
    					}
    					
    				}
    				
    				System.out.println("End of while ...");
    				if( okPort )
    				{
    					String query_UPDATE = "update PPP_TROUBLE SET "
							                + " SMS_SEND_YN = 'Y',"
							                + " TROUBLE_MSG ='"+content+"',"
							                + " TROUBLE_URL = 'http://hemsfos.lsware.co.kr/shms/pda/inter_Pda.do?user_id="+UserId+"&trouble_id="+TroubleID+"'" 
							                + " WHERE TROUBLE_ID = '"+ troubleIdArr[i] +"'";
						System.out.println("query_UPDATE = " + query_UPDATE);
						st.executeUpdate(query_UPDATE);
    				}
    				
    			}
    		}

			try
		    {
		    	Thread.sleep(3000);  // 3�ʿ� �ѹ��� ��� üũ
		    }catch (Exception e){}

		    alm_N_Lst.clear();
			alm_Code_Lst.clear();
			Sensor_ID_Lst.clear();
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    
    }
    
    public static boolean sendSMS(String TroubleID, String StructNM, String StructId, String SenId, String TroubleCd, String TroublemSG, String ClassNM, String Prodt, String UserId, String PassWd, String UserNM , String mNO, String telNO)
    {
    	boolean far = true;
        try {
            CommPortIdentifier ports = CommPortIdentifier.getPortIdentifier( "COM4" );
            SerialPort port = ( SerialPort )ports.open( "SMS", 1000 );
            port.setSerialPortParams( 115200,
            		                  SerialPort.DATABITS_8, 
            		                  SerialPort.STOPBITS_1, 
            		                  SerialPort.PARITY_NONE );
            port.setFlowControlMode( SerialPort.FLOWCONTROL_NONE );
           
            OutputStream out = port.getOutputStream();
            
          
            // SMS���� ����
            String Command = "AT$SMSMO=";
            String TargetNum = mNO; //mNO; //"01045738508";   // ���� ��ȣ
            									// �ȴϾƹ�ȣ 01045738508
            String SendNum = telNO;    // ������ ��ȣ
            String Mode = "4098";			   // SMS���
            String Encode = "16";  // HEX. Incode �� �����ϴ� ��쵵 ������ �ѱ� ������ ���� �� �ʿ���
            String content = "["+ ClassNM +"]" + StructNM +"�� ���� "+  SenId +"���� "+ ClassNM +"�߻� . ����� ��ġ �ٶ��ϴ�.http://192.168.0.3/shms/pda/inter_Pda.do?user_id="+UserId+"&trouble_id="+TroubleID;
           
            String[] contents;
            contents = content.split("http://"); // �޼����� ��� http:// �� ��ū���� �и�
            
            if ( contents.length > 1 ) // �и� �� ���
            	contents[1] = "http://"+contents[1];
            
            for ( int i = 0 ; i < contents.length ; i++ )
            {
            	// SMS���ۺ�
                String convertHexa = stringToHex(contents[i]);
                String msg = Command+TargetNum+","+SendNum+","+Mode+","+Encode+",,,"+convertHexa+"\n\r";         
                
                out.write( (msg).getBytes() );// ����

                try
                {
                	Thread.sleep(4500); // SMS ���� ������ 4��
                }catch (Exception e){}
            }
            
            out.close();
            port.close();
        }
        catch( Exception e ) {
            System.out.println( "Error:" + e.getMessage() );
            far = false;
        }
        
        return far;
    }

	// ���ڿ��� ��� ��Ʈ������ ��ȯ�ϴ� �Լ�
    public static String stringToHex(String s) {
   	
      String result = "";
      for ( int i = 0; i < s.length(); i++ ) 
		{
			System.out.print(s.charAt(i));  
			if ( s.charAt(i) >= 'A' && s.charAt(i) <= 'z' ) // ������ ���
			{
				//System.out.print("(����)");
				result += String.format("%02X", (int) s.charAt(i));
			}
			else if (s.charAt(i)>='\uAC00' && s.charAt(i)<='\uD7A3') // �ѱ��� ���
			{
				//System.out.print("(�ѱ�)");
				korean Wansung = new korean();
				
				// result += String.format("%04X", (int) s.charAt(i)); ���������Ͽ��� �ϼ��� �ѱ��ڵ带 ���⶧���� �� �ڵ�� �ȉ�
				result += Wansung.korean_convert(s.charAt(i));
			}
			else
			{
				//System.out.print("(����)");
			    result += String.format("%02X", (int) s.charAt(i));
			}
		}
      
      System.out.println("");
      return result;
    }    
    
    /**
    *
    * Method Name : resultSetToArrayList
    * Description : ResultSet ��ü�� �Ѱ��� Row�� HashMap�� ArrayList�� ��ȯ�մϴ�.
    *
    * @author rian_susukang
    * @param resultSet
    * @return
    * @throws SQLException Collection
    *
    */
   public static List resultSetToArrayList(ResultSet resultSet) throws SQLException{
   
    ResultSetMetaData metaData = resultSet.getMetaData();
    int sizeOfColumn = metaData.getColumnCount();
    String[]columnName = new String[metaData.getColumnCount()];
   
    for(int indexOfColumn = 0 ; indexOfColumn < sizeOfColumn ; indexOfColumn++){
     columnName[indexOfColumn] = metaData.getColumnName(indexOfColumn + 1);
    } 
    ArrayList resultList = new ArrayList();
    HashMap currentHashMap;
   
    while(resultSet.next()){
     currentHashMap = new HashMap();
     for(int indexOfColumn=0 ; indexOfColumn < sizeOfColumn ; indexOfColumn++){
      currentHashMap.put(columnName[indexOfColumn], resultSet.getString(columnName[indexOfColumn]));
     }
     resultList.add(currentHashMap);
    }
    System.out.println("resultArrayList="+resultList);
    return resultList;
   } 

}