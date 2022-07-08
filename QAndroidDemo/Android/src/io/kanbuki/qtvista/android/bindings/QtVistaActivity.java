package io.kanbuki.qtvista.android.bindings;


import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.graphics.Color;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;

import org.qtproject.qt.android.bindings.QtActivity;

public class QtVistaActivity extends QtActivity{
    @Override
    public void onCreate(Bundle savedInstanceState){
       super.onCreate(savedInstanceState);
       setFullscreen();
    }
    public void setFullscreen(){
        //getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,WindowManager.LayoutParams.FLAG_FULLSCREEN);
        WindowManager.LayoutParams wmlp = getWindow().getAttributes();
        wmlp.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
        getWindow().setAttributes(wmlp);
        View view = getWindow().getDecorView();
        view.setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE);
    }

}
