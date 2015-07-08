package com.network;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;

public class OAMPConnection {
	
	//CLI/WEB -> OAMP Manager
	//public static final int CMD_CLI_CONFIG_CHANGE_REQ		=	0x0010;	// 설정파일 변경 요청			<cli->man->agt->api->agt->man->cli>
	//public static final int CMD_MAN_CONFIG_CHANGE_REQ		=	0x0031;	// 설정파일 변경 	<cli->man->agt->api->agt->man->cli>
	//public static final int CMD_CLI_TRACE_USER_REQ 		=	0x0011;	// ims svc에서 trace user 설정 요청	<cli->man->agt->api->agt->man->cli>
	//public static final int CMD_CLI_TRACE_JOIN_REQ 		=	0x0012;	// traceReceiver에게 session id 및 global local 정보를 보냄
	//public static final int CMD_CLI_TRM_TRACE_USER_REQ		=	0x0013;	// trace receiver에서 trace user 설정요청

	/* SHMS TEST cmd code */
	public static final int CMD_SHMS_SVC_COD = 0x0401;
	public static final int CMD_SHMS_SVC_RES = 0x0401;
	
	/* IMS 서비스 설정 변경 */
	public static final int CMD_CLI_CHG_SVC_CFG_REQ         =   0x0010;
	public static final int CMD_MAN_CHG_SVC_CFG_RES         =   0x0031;

	
	/* Init Trace Manager */
	public static final int CMD_CLI_TRCRM_JOIN_REQ			=   0x0011; //SessionID^ON\n	
	public static final int CMD_TRCRM_TRCRM_JOIN_RES		=   0x0100; //OK\n
	public static final int CMD_TRCRM_PROT_TRC_DATA_SEND    =	0x0104;
	
	
	/* REG-PROT-TRC/CANC-PROT-TRC */
	public static final int CMD_CLI_PROT_TRC_REQ			=	0x0012;	
	public static final int CMD_MAN_PROT_TRC_RES			=	0x0033;

	
	/* CHG-PROT-TRC-GLO */
	public static final int CMD_CLI_CHG_PROT_TRC_GLO_REQ 	=	0x0013; //Send (CLI-> TraceReceiver
	public static final int CMD_TRM_CHG_PROT_TRC_GLO_RES	=	0x0101;   //Recv(Trace Receiver -> CLI)

	
	/* DB 변경 알림 전송 */
	//public static final int CMD_CLI_DB_CHANGE_NOTI_REQ		=	0x0014;
	//public static final int CMD_MAN_DB_CHANGE_NOTI_RES		= 	0x0035;
	
	/* Process 제어 명령 */
	public static final int CMD_CLI_CTRL_SVC_PRS_REQ       =    0x0015;   // CTRL_SVC :
	public static final int CMD_MAN_CTRL_SVC_PRS_RES       =    0x0039;   // CTRL_SVC :
	
	/* ALARM 코드 변경 알림 */
	//public static final int CMD_CLI_ALM_CODE_REQ			=    0x0016; 
	//public static final int CMD_MAN_ALM_CODE_RES			=    0x003a;
	
	/* Node 정보 업데이트 알림 */
	//public static final int CMD_CLI_NODE_REQ               =    0x0017; // 노드 정보 업데이트시(CRTE-NODE, CHG-NODE, DLT-NODE)
	//public static final int CMD_MAN_NODE_RES               =    0x003b; //
	
	
	/* Request */	
	public static final int CMD_CLI_CRTE_REQ				=	0x001c;
	public static final int CMD_CLI_CHG_REQ					=	0x001d;
	public static final int CMD_CLI_DLT_REQ					=	0x001e;
	
	
	/* Response */
	public static final int CMD_MAN_CRTE_RES				=	0x0047;
	public static final int CMD_MAN_CHG_RES					=	0x0048;
	public static final int CMD_MAN_DLT_RES					=	0x0049;

	
	
	// Manager에서 사용하는 Command
	//public static final int CMD_MAN_TRACE_USER_REQ			=	0x0033;	// Trace 정보 설정
	//public static final int CMD_MAN_TRACE_USER_RES			=	0x0034;	// Trace 정보 삭제	
	//public static final int CMD_MAN_TRACE_ALL_USER_DEL_REQ = 	0x0035;	// Trace 정보 모두 삭제
	//public static final int CMD_MAN_CONFIG_CHANGE_RES		= 	0x0036;	// CLI에게 설정 결과 전송
	//public static final int CMD_MAN_SVC_CONFIG_DATA_RES	=	0x0037;	// DB에 있는 설정 파일 전송
	//public static final int CMD_MAN_IMS_5M_STATSTIC_RES	=	0x0039;	
	

	
	/* OAMP Protocol Definition */
	static final int MESSAGE_HEADER_NODE_LENGTH		= 32; //Message Header Node 명  길이

	
	
	
	String connectionIP = "localhost";
	int connectionPort = -1;
	
	
	private String lastUserCommandResult = null;
	private boolean bLastConnect = true;
	
	Socket theClientSocket = null;
	private DataOutputStream theClientOutputStream = null;
	private DataInputStream theClientInputStream = null;		
	private int connectionTimeout = 2000;
	
	private boolean bOAMP = true;

	
	
	public OAMPConnection(String connIP, int connPort) {
		connectionIP = connIP;
		connectionPort = connPort;
	}


	public boolean readResponse() throws IOException {
		return readMsg(theClientInputStream);
	}

	public boolean readMsg(DataInputStream connInputStream) throws java.io.IOException {
		boolean bResult = false;
		
		lastUserCommandResult = null;
		
		int c;
	    String responseLine;
	    
	    String s;
	    try {
	    	
	    	/* Header */
	    	
			/* ------
			 * Header
			 * ------		
			 * uint32		command;	// 명령
			 * uint32		req_no;		// 명령관리및 CLI/WEB Handler 찾기
			 * char[32]		node_nm[32];// 노드명
			 * uint32		body_length;// data body 부분 길이	
			 * -------------
			 * header + body
			 * -------------
			 */
	
	    	/* Body */
	    	if(bOAMP){
	    		
	    		//try {
				//	connInputStream.
				//} catch (InterruptedException e) {
					// TODO Auto-generated catch block
				//	bResult = false;
				//	e.printStackTrace();
				//	OAMPOut.println("Read Timeout");
				//	return bResult;
				//}
	    		
				//SocketChannel socketchannel = theClientSocket.getChannel();
	    		
	    		//theClientSocket.setSoTimeout(10000);

				//socketchannel.configureBlocking(false);
				//socketchannel.register(sel, ops, att)
	    		int command = connInputStream.readInt();						/* command */	    		
	    		int req_no = connInputStream.readInt();							/* req_no */
	    		
	    		byte[] node_nm = new byte[MESSAGE_HEADER_NODE_LENGTH];			/* node_nm */
	    		
	    		connInputStream.read(node_nm, 0, MESSAGE_HEADER_NODE_LENGTH);
	    		String sNodeName = new String(node_nm, "8859_1");
	    		String[] nodeNames = sNodeName.split("\0");        		
	    		if(nodeNames.length > 0){
	    			sNodeName = nodeNames[0];
	    		}
	    		else{
	    			sNodeName = null;
	    		}
	    		
	    		int body_length = connInputStream.readInt();
	    		
	    		byte[] body = new byte[body_length];
	    		int readInt = 0;
	    		int readLength = 0;
	    		String sBody = null;
	    		boolean bValidData = false;
	    		
	    		while(readLength < body_length){
	    			try{
	    				readInt = connInputStream.read(body, readLength, body_length - readLength);
	    			}
	    			catch(ArrayIndexOutOfBoundsException e){
	    				break;
	    			}
	    			
	    			readLength = readLength + readInt;
	    			
	    			if(readLength == body_length){
	    				bValidData = true;
	    				break;
	    			}
	    			
	    			if(readLength > body_length){
	    				break;
	    			}
	    		}
	    		
	    		if(!bValidData){
	    			return bResult; 
	    		}
	    		
	    		
    			sBody = new String(body, "8859_1");
    			body = null;
    			
    			lastUserCommandResult = sBody;
	    		sBody = null;		
	    		
	    		
	    		
	    		if(command != CMD_TRCRM_PROT_TRC_DATA_SEND){	    			
		    		if(lastUserCommandResult.startsWith("FAIL")){
		    			//bResult = false;
		    			//bResult = true;
		    			//OAMPOut.println("FAIL");
		    		}
		    		else if(lastUserCommandResult.startsWith("Y")){
		    			bResult = true;
		    			//OAMPOut.println("OK");
		    		}
	    		}
	    		else{
	    			bResult = true;
	    		}
	    	}
	    	else{
	    		s = connInputStream.readLine();
	    		bResult = true;
	    		lastUserCommandResult = s;
	    	}	
	    	
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new IOException("Data Read Fail(" + connectionIP + ":" + connectionPort + ")");
			//e.printStackTrace();			
		} finally{
			
		}	
	    
		return bResult;
	}

	public boolean sendRequest(int reqCommand, String nodeName, String msgBody){
		return sendMsg(theClientOutputStream,reqCommand, nodeName, msgBody);
	}
	
	public boolean sendMsg(DataOutputStream connOutputStream, int reqCommand, String nodeName, String msgBody){
		byte[] msg = msgBody.getBytes();
		int msgLength = msg.length;
		return sendMsg(connOutputStream, reqCommand, nodeName, msg, msgLength);
	}
	
	public boolean sendMsg(DataOutputStream connOutputStream, int reqCommand, String nodeName, byte[] buffer, int msgBodyLength) {
		
		boolean bResult = false;
		
		lastUserCommandResult = null;
		
		
		/* ------
		 * Header
		 * ------		
		 * uint32		command;	// 명령
		 * uint32		req_no;		// 명령관리및 CLI/WEB Handler 찾기
		 * char[16]		node_nm[32];// 노드명
		 * uint32		body_length;// data body 부분 길이	
		 * -------------
		 * header + body
		 * -------------
		 */
		
		//Create Header		
		try {			
			/* Create Header */			
			if(bOAMP){				
				
				int command = reqCommand;
				byte[] byteNodeName = nodeName.getBytes();
				//OAMPOut.println("[" + byteNodeIP.length + "]");
				//OAMPOut.println("[" + nodeIP + "]");
				byte[] node_nm= new byte[MESSAGE_HEADER_NODE_LENGTH];
				for(int i=0 ; i < node_nm.length ; i++){
					if(i < byteNodeName.length)
						node_nm[i] = byteNodeName[i];
					else
						node_nm[i] = '\0';
				}
				
				//int nodeIPLength = 16;
				int req_no = 0;
				/* Boby Info */
				byte[] byteMsgBody = buffer;				
				int body_length = msgBodyLength;
				
				connOutputStream.writeInt(command);				/* uint32 command */
				connOutputStream.writeInt(req_no);					/* uint32 req_number */
				connOutputStream.write(node_nm, 0, node_nm.length);/* node_nm[32] */				
				connOutputStream.writeInt(body_length);				/* uint32 body_length */		
				
				/* Create Body */
				connOutputStream.write(byteMsgBody, 0, body_length);
				connOutputStream.flush();	
			}
			else{
				byte[] byteMsgBody = buffer;
				int MsgBodyLength = msgBodyLength;
				connOutputStream.write(byteMsgBody, 0, MsgBodyLength);
				connOutputStream.writeChar('\n');
				connOutputStream.writeByte(0);
				connOutputStream.flush();
			}		
		
			bResult = true;			
				
			//if(OAMPProperties.isDebug()){
			//	OAMPConsoleOut.println("\n[sendMsg]\n" + buffer);
			//}
	
			
		} catch (IOException e) { 
			e.printStackTrace();
			bLastConnect = false;
		}
		
		bLastConnect = true;
				
		return bResult;
	}
	
	public boolean connect() throws java.io.IOException{
		boolean bResult = false;
		
		lastUserCommandResult = null;
		
		try {			
			SocketConnect s = new SocketConnect(connectionTimeout);
			
			s.createSocket(connectionIP, connectionPort);	
			
			theClientSocket = s.socket;
			
			//theClientSocket = new Socket(OAMPManagerIP, OAMPManagerPort);						
			theClientOutputStream = new DataOutputStream(new BufferedOutputStream(theClientSocket.getOutputStream()));			
			theClientInputStream = new DataInputStream(new BufferedInputStream(theClientSocket.getInputStream()));
			bResult = true;
		}
		catch (UnknownHostException e) {
			System.err.println(e);	
			bLastConnect = false;
		}
		catch (IOException e) {
			//System.err.println(e);	
			//OAMPOut.println(e);
			bLastConnect = false;
			throw new IOException("Connection Fail(" + connectionIP + ":" + connectionPort + ")");
		}	
		
		bLastConnect = true;
		return bResult;
	}
	
	public boolean disconnect() {
		boolean bResult = false;		
		
		try {
			if(theClientOutputStream != null){
				theClientOutputStream.close();
			}
			theClientOutputStream = null;
			
			if(theClientInputStream != null){
				theClientInputStream.close();
			}
			theClientInputStream = null;
			
			if(theClientSocket != null){
				theClientSocket.close();
			}			
			theClientSocket = null;
			
			bResult = true;
		}catch (IOException e) {
			System.err.println(e);
		}
		
		return bResult;
	}


	public String getLastUserCommandResult() {
		// TODO Auto-generated method stub
		return lastUserCommandResult;
	}


	public Socket getClientSocket() {
		// TODO Auto-generated method stub
		return theClientSocket;
	}


	public void setConnectionTimeout(int timeout) {
		connectionTimeout = timeout;
	}


	public boolean isLastConnect() {
		// TODO Auto-generated method stub
		return bLastConnect;
	}


	public void clearLastUserCommandResult() {
		lastUserCommandResult = null;		
	}


}