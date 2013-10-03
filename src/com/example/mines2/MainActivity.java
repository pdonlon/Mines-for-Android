package com.example.mines2;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;

public class MainActivity extends Activity {
    DrawPanel drawView;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        drawView = new DrawPanel(this, this);
        drawView.setBackgroundColor(Color.WHITE);
        setContentView(drawView);

    }
}