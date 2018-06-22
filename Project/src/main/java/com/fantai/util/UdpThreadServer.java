package com.fantai.util;

import java.net.DatagramPacket;
import java.net.DatagramSocket;

public class UdpThreadServer {
    private static final int PORT = 6010;

    public void start() throws Exception{
        int buff = 1024;
        DatagramSocket socket = new DatagramSocket(PORT);
        DatagramPacket packet = new DatagramPacket(new byte[buff], buff);

        while (true) {
            socket.receive(packet);
            Thread t = new Thread(new UDPThreadServerSocket(packet));
            t.start();
        }
    }

    public static void main(String[] args) {
        int count = 0;
        int buff = 1024;
        try {
            // 1. 构建DatagramSocket实例，指定本地端口。
            DatagramSocket socket = new DatagramSocket(PORT);

            // 2. 构建需要收发的DatagramPacket报文
            DatagramPacket packet = new DatagramPacket(new byte[buff], buff);
            while (true) {
                // 3. 收报文
                socket.receive(packet);
                System.out.println("第" + ++count + "个连接,IP地址是：" + packet.getAddress());
                Thread t = new Thread(new UDPThreadServerSocket(packet));
                t.start();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
