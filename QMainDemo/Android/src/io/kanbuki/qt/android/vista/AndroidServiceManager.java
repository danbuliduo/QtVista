package io.kanbuki.qt.android.vista;

import android.content.Context;
import android.os.Vibrator;
import android.os.BatteryManager;
public class AndroidServiceManager {
    //震动服务
    public static void startVibratorService(Context context){
        Vibrator m_Vibrator = (Vibrator) context.getSystemService(Context.VIBRATOR_SERVICE);
        long[] pattern = {200, 200};
        m_Vibrator.vibrate(pattern, -1);
    }
    //电池服务 
}
