/*
 * DBUtils.java 1.0, 2009. 7. 23.
 * 
 * Copyright (c) 2009 by LSware Inc. All rights reserved.
 */
package com.lsware.utils; 

import java.io.DataInputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;

public class DBUtils {

	public static byte[] getBytesFromBlob(Blob blob) throws SQLException, IOException {
		
		byte [] bytes  = null;
		if(blob != null){
			DataInputStream inData = new DataInputStream(blob.getBinaryStream());
			bytes = new byte[(int)blob.length()];
			inData.read(bytes);
		}
		
		return bytes;
	}

	public static String getStringFromBlob(Blob blob) throws SQLException, IOException {
		// TODO Auto-generated method stub
		String string = null;
		
		if(blob != null){
			string = new String(getBytesFromBlob(blob));
		}
		
		return string;
	}

}
