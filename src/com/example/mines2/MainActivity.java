package com.example.mines2;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.Point;
import android.os.Bundle;
import android.util.Log;
import android.view.Display;
import android.view.Menu;
import android.view.MenuItem;



public class MainActivity extends Activity {
	DrawPanel drawView;

	static MenuItem mens1;
	static MenuItem mens2;
	static MenuItem mens3;
	static MenuItem mens4;

	static int screenWidth, screenHeight;


	public boolean onCreateOptionsMenu(Menu menu) {
		mens1 = menu.add(0, 1, 2, "Hint");
		mens2 = menu.add(0, 2, 2,"Reset");
		mens3 = menu.add(0, 3, 2, "Zoom In");
		mens4 = menu.add(0, 4, 2,"Zoom Out");
		return true;
	}

	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case 1:
			drawView.playBoard.hint();
			runOnUiThread(new Runnable(){ public void run() {
				drawView.invalidate();}});	
			return true;
		case 2:
			drawView.resetGame();
			return true;
		case 3:
			drawView.playBoard.zoomIn();
			runOnUiThread(new Runnable(){ public void run() {
				drawView.invalidate();}});
			return true;
		case 4:
			drawView.playBoard.zoomOut();
			runOnUiThread(new Runnable(){ public void run() {
				drawView.invalidate();}});
			return true;
		}
		return false;
	}

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);


		Display display = getWindowManager().getDefaultDisplay();

		screenWidth = display.getWidth();  // deprecated
		screenHeight = display.getHeight();  // deprecated

		drawView = new DrawPanel(this, this);
		drawView.setBackgroundColor(Color.LTGRAY);
		setContentView(drawView);




	}
}