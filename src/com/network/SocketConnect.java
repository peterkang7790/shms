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
     
       //Timeout���� ��ٸ� ������ ������ �ߴ�
       //Thread t�� ������ ���� ��ٸ�(Timeout �ð� ����)
       //�� run �޼ҵ尡 ����� �� ��ٸ��µ� �������� ��� �־��� 3�ʾȿ�
       //���� ������ �̷�� ������ �����ϴ� ��쿣 socket�� null ��
       try {
           t.join(timeout);
       }
       catch(InterruptedException ie) {
           t.interrupt();
       }

       //TimeOut �Ⱓ���� Socket ������ ���� ���
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