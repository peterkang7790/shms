/*
 * PropertiesExtend.java 1.0, 2009. 7. 25.
 * 
 * Copyright (c) 2009 by LSware Inc. All rights reserved.
 */
package com.lsware.utils; 

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import com.teesoft.stringEncode;

public class PropertiesExt extends Properties{
	@Override
	public synchronized void load(InputStream inStream) throws IOException {
		
		InputStream in = StringUtils.getInputStreamFromString(stringEncode.native2ascii(StringUtils.getStringFromStream(inStream)));
		
		super.load(in);
	}
}
