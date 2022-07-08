package io.kanbuki.qtvista.android.cores;

import android.content.Context;
import android.os.Vibrator;
import android.os.BatteryManager;

public class AndroidSystemService {
    //震动服务
    public static void setVibratorService(Context context){
        Vibrator vibrator = (Vibrator) context.getSystemService(Context.VIBRATOR_SERVICE);
        long[] pattern = {200, 200};
        vibrator.vibrate(pattern, -1);
    }
    //电池服务 
    public static int getBatteryInfo(Context context){
        BatteryManager manager = (BatteryManager) context.getSystemService(Context.BATTERY_SERVICE);
        System.out.println(manager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY));
        System.out.println(manager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CHARGE_COUNTER));
        System.out.println(manager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CURRENT_AVERAGE));
        System.out.println(manager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CURRENT_NOW));
        System.out.println(manager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY));
        System.out.println(manager.getIntProperty(BatteryManager.BATTERY_PROPERTY_STATUS));
        return manager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
    }
}
