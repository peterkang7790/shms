package com.network;

import java.io.IOException;
import java.net.Socket;

public class SocketConnect implements Runnable {
   long timeout;
   String hostname;
   int port;
   Socket socket = null;
   boolean isTimeOut = false;

   public SocketConnect (long timeout) {
       this.timeout = timeout;
   }

   public Socket createSocket(String hostname, int port) throws IOException {
       this.hostname = hostname;
       this.port = port;
       this.socket = null;

       Thread t = new Thread(this);
       t.setDaemon(true);
       t.start();
     
       //Timeout까지 기다림 끝나지 않으면 중단
       //Thread t가 끝날때 까지 기다림(Timeout 시간 동안)
       //즉 run 메소드가 수행된 후 기다리는데 정상적인 경우 주어진 3초안에
       //소켓 접속이 이루어 지지만 실패하는 경우엔 socket이 null 임
       try {
           t.join(timeout);
       }
       catch(InterruptedException ie) {
           t.interrupt();
       }

       //TimeOut 기간동안 Socket 접속을 못한 경우
       if (socket == null) {
           isTimeOut = true;
           throw new IOException("socket time out! ");
       }

       return socket;

   }
   
   public void run() {
       try {
           socket = new Socket(hostname, port);
       }
       catch(IOException ioe) {            
       }     

       if (isTimeOut) {
           try {
               if (socket != null) socket.close();
           }
           catch(IOException ioe) {            
           }
       
           socket = null;
       }
       
       return;    
   }    

}