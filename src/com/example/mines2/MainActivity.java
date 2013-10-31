package com.example.mines2;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.Point;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.util.TypedValue;
import android.view.Display;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;



public class MainActivity extends Activity {
	DrawPanel drawView;

	static MenuItem mens1;
	static MenuItem mens2;
	static MenuItem mens3;
	static MenuItem mens4;
	static MenuItem mens5;
	static MenuItem mens6;
	static MenuItem mens7;
	static MenuItem mens8;
	static MenuItem mens9;


	static int screenWidth, screenHeight;


	public boolean onCreateOptionsMenu(Menu menu) {
		mens1 = menu.add(0, 1, 2, "Hint");
		mens2 = menu.add(0, 2, 2,"Reset");
		mens3 = menu.add(0, 3, 2, "Zoom In");
		mens4 = menu.add(0, 4, 2,"Zoom Out");
		mens5 = menu.add(0, 5, 2,"Easy");
		mens6 = menu.add(0, 6, 2, "Medium");
		mens7 = menu.add(0, 7, 2,"Hard");
		mens8 = menu.add(0, 8, 2,"Vibration");
		mens9 = menu.add(0, 9, 2,"Flag Toggle");
		return true;
	}

	public boolean dispatchKeyEvent(KeyEvent event) {
		       int action = event.getAction();
		       int keyCode = event.getKeyCode();
		 
		           switch (keyCode) {
		           case KeyEvent.KEYCODE_VOLUME_UP:
		               if (action == KeyEvent.ACTION_UP) {
		            	   drawView.setFlagMode(!drawView.getFlagMode());
		               }
//		               if (action == KeyEvent.ACTION_DOWN) {
//		                 iview.setImageDrawable(constants.open);
//		                 //if (Build.VERSION.SDK_INT>=11)
//		             //getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LOW_PROFILE);
//		               }
		               return true;
		           case KeyEvent.KEYCODE_VOLUME_DOWN:
		             if (action == KeyEvent.ACTION_UP) {
		            	   drawView.setFlagMode(!drawView.getFlagMode());

		             }
//		               if (action == KeyEvent.ACTION_DOWN) {
//		                 iview.setImageDrawable(constants.open);
//		                 //if (Build.VERSION.SDK_INT>=11)
//		             //getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LOW_PROFILE);
//		               }
//		               return true;
//		           case KeyEvent.KEYCODE_CAMERA:
//		               if (action == KeyEvent.ACTION_UP) {
//		                 iview.setImageDrawable(constants.closed);
//		               }
//		               if (action == KeyEvent.ACTION_DOWN) {
//		                 iview.setImageDrawable(constants.open);
//		                 //if (Build.VERSION.SDK_INT>=11)
//		             //getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LOW_PROFILE);
//		               }
//		               return true;
		           
		               return super.dispatchKeyEvent(event);
		           }
	               return super.dispatchKeyEvent(event);
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
			drawView.playBoard.zoomIn(8,8);
			runOnUiThread(new Runnable(){ public void run() {
				drawView.invalidate();}});
			return true;
		case 4:
			drawView.playBoard.zoomOut(8,8);
			runOnUiThread(new Runnable(){ public void run() {
				drawView.invalidate();}});
			return true;
		case 5:
			drawView.playBoard.setWidth(9);
			drawView.playBoard.setHeight(9);
			drawView.setDifficulty("Easy");
			drawView.playBoard.setTotalBombs(10);
			startingUp();
			return true;
		case 6:
			drawView.playBoard.setWidth(16);
			drawView.playBoard.setHeight(16);
			drawView.setDifficulty("Medium");
			drawView.playBoard.setTotalBombs(40);
			startingUp();
			return true;
		case 7:
			drawView.playBoard.setWidth(16);
			drawView.playBoard.setHeight(30);
			drawView.setDifficulty("Hard");
			drawView.playBoard.setTotalBombs(99);
			startingUp();
			return true;
		case 8:
			drawView.setVibration(!drawView.getVibration());
			return true;
		case 9:
			drawView.setFlagMode(!drawView.getFlagMode());
			runOnUiThread(new Runnable(){ public void run() {
				drawView.invalidate();}});
			return true;
		}
		return false;
	}

	public void startingUp()
	{
		drawView.playBoard.setUp();
		drawView.resetGame();
		drawView.playBoard.initializeBoard();
		drawView.playBoard.adjustTiles();
		runOnUiThread(new Runnable(){ public void run() {
			drawView.invalidate();}});
	}
	
	public int getActionBarHeight() {
	    int actionBarHeight = getActionBar().getHeight();
	    if (actionBarHeight != 0)
	        return actionBarHeight;
	    
	  	return 0;
	}
	
	public int getStatusBarHeight() {
	      int result = 0;
	      int resourceId = getResources().getIdentifier("status_bar_height", "dimen", "android");
	      if (resourceId > 0) {
	          result = getResources().getDimensionPixelSize(resourceId);
	      }
	      return result;
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