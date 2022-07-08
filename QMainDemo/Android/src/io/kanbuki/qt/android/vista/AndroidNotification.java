package io.kanbuki.qt.android.vista;

import android.app.Activity;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.BitmapFactory;
import android.os.Build;

public class AndroidNotification
{
    private Notification.Builder m_NotificationBuilder;
    private NotificationManager m_NotificationManager;
    private NotificationChannel m_NotificationChannel;
    private final String NOTIFICATION_CHANNEL_ID;
    private final Activity m_Activity;
    private final int m_NotificationID;

    public AndroidNotification(Activity activity, String channelName, int instanceID){
        m_Activity = activity;
        m_NotificationID = instanceID + 1;
        NOTIFICATION_CHANNEL_ID = (activity.getClass().getName() + Integer.toString(instanceID));
        m_NotificationManager = (NotificationManager) activity.getSystemService(activity.NOTIFICATION_SERVICE);
        m_NotificationChannel = new NotificationChannel(NOTIFICATION_CHANNEL_ID, channelName, NotificationManager.IMPORTANCE_DEFAULT);
        m_NotificationManager.createNotificationChannel(m_NotificationChannel);
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            m_NotificationBuilder = new  Notification.Builder(activity, NOTIFICATION_CHANNEL_ID);
        }
        PendingIntent pendingIntent = PendingIntent.getActivity(activity, m_NotificationID,
                new Intent(activity, activity.getClass()), PendingIntent.FLAG_UPDATE_CURRENT);
        m_NotificationBuilder.setContentIntent(pendingIntent)
                             .setOnlyAlertOnce(true)
                             .setAutoCancel(true);
    }
    public void startNotify(){
        m_NotificationBuilder.setPriority(Notification.PRIORITY_DEFAULT);
        m_NotificationManager.notify(m_NotificationID, m_NotificationBuilder.build());
    }
    public void initNotification(String title, String text){
        String packageName = m_Activity.getPackageName();
        Resources resources = m_Activity.getResources();
        int smallIconResourceId = resources.getIdentifier("icon","drawable", packageName);
        m_NotificationBuilder.setSmallIcon(smallIconResourceId)
                             .setContentTitle(title)
                             .setContentText(text);
    }
    public void initNotification(String smallIconName, String title, String text){
        String packageName = m_Activity.getPackageName();
        Resources resources = m_Activity.getResources();
        int smallIconResourceId = resources.getIdentifier(smallIconName,"drawable", packageName);
        m_NotificationBuilder.setSmallIcon(smallIconResourceId)
                             .setContentTitle(title)
                             .setContentText(text);
    }
    public void setLargeIcon(String largeIconName){
        String packageName = m_Activity.getPackageName();
        Resources resources = m_Activity.getResources();
        int smallIconResourceId = resources.getIdentifier(largeIconName,"drawable", packageName);
        Bitmap icon = BitmapFactory.decodeResource(resources, smallIconResourceId);
        m_NotificationBuilder.setLargeIcon(icon);
    }
    public void setWhen(){
        m_NotificationBuilder.setShowWhen(true);
        m_NotificationBuilder.setWhen(System.currentTimeMillis());
    }
    
}
