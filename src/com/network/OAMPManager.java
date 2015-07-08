package com.network;
import java.io.IOException;

public class OAMPManager {
	
	//private static OAMPManager instance = null; //OAMP Manager 메인 객체
	
	private OAMPConnection OAMPMgrConn = null;
	
	
	private String lastErrorMsg = null;
	
	private void setLastErrorMsg(String errorMsg)
	{
		lastErrorMsg = errorMsg;		
	}
	
	public String getLastErrorMsg()
	{
		return lastErrorMsg;
	}
	
	public void init(String managerIP, int managerPort) {
		OAMPMgrConn = new OAMPConnection(managerIP, managerPort);
	}
	
	public void init(String managerIP, int managerPort, int managerTimeout) {
		init(managerIP, managerPort);
		setConnectionTimeout(managerTimeout);
	}
	
	public boolean sendMsg2OM(int reqCmdCode, int resCmdCode, String nodeName, String msgBody) throws IOException {	
		
		boolean bResult = false;
		
		try {
			if(!OAMPMgrConn.connect()){
				OAMPMgrConn.disconnect();
				return bResult;
			}
		} catch (IOException e) {			
			OAMPMgrConn.disconnect();
			//OAMPOut.println("OAMP Manager : " + e.getLocalizedMessage());
			String errorMsg = "OAMP Manager : " + e.getLocalizedMessage();
			this.setLastErrorMsg(errorMsg);
			return bResult;
			//e.printStackTrace();
		}
		
		//Command Execute Fail : 1. Connection Fail
		
		//Send Request Msg
		//Command Execute Fail : 2. Data Send Fail
		if(!OAMPMgrConn.sendRequest(reqCmdCode, nodeName, msgBody)){
			OAMPMgrConn.disconnect();
			return bResult;
		}		
		
		//Command Execute Fail : 3. Timeout Response Msg
		try {
			if(OAMPMgrConn.readResponse()){			
				bResult = true;			
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			throw new IOException("");
		}
		 	
		OAMPMgrConn.disconnect();
				
		return bResult;
	}
	

	public void finalization() {
		// TODO Auto-generated method stub
		
	}

	public String getLastUserCommandResult() {		
		return OAMPMgrConn.getLastUserCommandResult();
	}

	//public static OAMPManager getInstance() {
	//	//OAMP Manager가 생성되어 있는지 검사
    //    if (instance == null) { //생성되어 있지 않다면
    //        synchronized (OAMPManager.class) {//Lock 설정
    //            if (instance == null) {//OAMPManager가  없으면                	
    //                instance = new OAMPManager();
    //            }
    //        }
    //    }

    //    return instance;        
		
	//}

	public void setConnectionTimeout(int timeout) {
		OAMPMgrConn.setConnectionTimeout(timeout);
	}

	public boolean isConnect() {
		// TODO Auto-generated method stub
		return OAMPMgrConn.isLastConnect();
	}

	
}


