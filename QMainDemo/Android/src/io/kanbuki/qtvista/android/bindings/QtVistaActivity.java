package io.kanbuki.qtvista.android.bindings;


import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.Window;
import org.qtproject.qt.android.bindings.QtActivity;

public class QtVistaActivity extends QtActivity{
    @Override
    public void onCreate(Bundle savedInstanceState){
       super.onCreate(savedInstanceState);
        //getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
    }
    
}
