package com.nbreds.projectPlanning.common.util;

import java.io.*;
import java.net.*;
public class IOUtil {
	public static void close(Closeable  c){
		if(c!=null){
			try {
				c.close();
			} catch (Exception e) {
			}
		}
	}
	public static void close(Socket  c){
		if(c!=null){
			try {
				c.close();
			} catch (Exception e) {
			}
		}
	}
	public static void close(ServerSocket  c){
		if(c!=null){
			try {
				c.close();
			} catch (Exception e) {
			}
		}
	}
}
