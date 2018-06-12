package com.fantai.util;

import java.net.DatagramPacket;

public class UDPThreadServerSocket implements Runnable {
    private DatagramPacket packet;
    public UDPThreadServerSocket(DatagramPacket packet) {
        this.packet = packet;
    }

    private DataMsgUdp dataMsgUdp = new DataMsgUdp();

    @Override
    public void run() {
        try {
            dataMsgUdp.RecieveDataMsgUDP(0, packet);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}