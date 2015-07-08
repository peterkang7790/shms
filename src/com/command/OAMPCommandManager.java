package com.command;

import java.io.IOException;

import com.network.OAMPConnection;
import com.network.OAMPManager;

public class OAMPCommandManager {
	
	private boolean bEnableLastsendMsg2OM = false;
	
	public boolean isBEnableLastsendMsg2OM() {
		return bEnableLastsendMsg2OM;
	}

	public void setBEnableLastMsgSend2OM(boolean bEnable) {
		bEnableLastsendMsg2OM = bEnable;
	}

	public String sendMsg2OM(String senId) throws IOException{
	
		OAMPManager OAMPMgr = new OAMPManager();
		OAMPMgr.init("192.168.100.233", 2000, 100000);
		
		int reqCmdCode = OAMPConnection.CMD_SHMS_SVC_COD;
		int resCmdCode = OAMPConnection.CMD_SHMS_SVC_RES;
		
		boolean sendMsg = OAMPMgr.sendMsg2OM(reqCmdCode, resCmdCode, "",senId);
		
		String result = "";
		if( sendMsg ){
			
			result = OAMPMgr.getLastUserCommandResult();
		}
		else
		{
			System.out.println("실패했습니다.");
			
		}
		
		return result;
	}
	
	
	
}
