package com.fantai.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by fantai-xyz on 2017/10/16.
 * 心跳检测类
 */
public class HeartCheck extends Thread {

    public void setRunning(boolean running) {
        isRunning = running;
    }

    private boolean isRunning = true;
    private String code;
    private int time;
    private byte codeId;

    public HeartCheck(byte codeId, String code, int time) {
        this.code = code;
        this.time = time;
        this.codeId = codeId;
        this.isRunning = true;
    }


    @Override
    public void run() {
        System.out.println(code + "已经登录,开始检测心跳命令");
        while (isRunning) {
            try {
                Thread.sleep(time* 60 * 1000);  //按分钟为单文
                Timestamp recentTime = DatabaseUtil.getHeartTimeByCode(code);
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
                String endTime = df.format(new Date());  //获取当前时间
                long milltime = Timestamp.valueOf(endTime).getTime() - recentTime.getTime();
                double hTime = milltime / 1000.0 / 60.0 ;  //计算分钟
                if(hTime > time) {
                    System.out.println(code+":offline");
                    DatabaseUtil.updateDeviceState(codeId,code,0); //离线
                    isRunning = false;
                }

            } catch (Exception e) {
                isRunning = false;
                System.out.println("线程异常结束");
                return;
            }
            System.out.println("线程结束");
        }
    }
}
