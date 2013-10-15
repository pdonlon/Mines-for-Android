package com.example.mines2;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.Point;
import android.os.Bundle;
import android.view.Display;
import android.view.Menu;
import android.view.MenuItem;



public class MainActivity extends Activity {
    DrawPanel drawView;
	
	static MenuItem mens1;
	static MenuItem mens2;
	
	static int screenWidth, screenHeight;

	
	public boolean onCreateOptionsMenu(Menu menu) {
		mens1 = menu.add(0, 1, 2, "Hint");
		mens2 = menu.add(0, 2, 2,"Reset");
		return true;
	}
	
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case 1:
			drawView.playBoard.showHint = true;
			return true;
		case 2:
			drawView.resetGame();
			return true;
		}
		return false;
	}
	
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        drawView = new DrawPanel(this, this);
        drawView.setBackgroundColor(Color.LTGRAY);
        setContentView(drawView);
        
		
		Display display = getWindowManager().getDefaultDisplay();
		
		screenWidth = display.getWidth();  // deprecated
		screenHeight = display.getHeight();  // deprecated

    }
}