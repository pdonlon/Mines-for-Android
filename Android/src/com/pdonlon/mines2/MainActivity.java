package com.pdonlon.mines2;
import com.google.ads.AdRequest;
import com.google.ads.AdSize;
import com.google.ads.AdView;
import com.pdonlon.mines2.R;

import android.app.Activity;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Point;
import android.os.Build;
import android.os.Bundle;
import android.text.Html;
import android.util.Log;
import android.util.TypedValue;
import android.view.Display;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.Toast;


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
	static boolean pro = false;

	static int screenWidth, screenHeight;

	protected void onPause()
	{
		super.onPause();
		drawView.pauseGame();
		//call pause function (stops timer and dims screen)
		//same thing for pressing the clock
	}
	protected void onResume()
	{
		super.onResume();

		if(drawView.paused && !drawView.pauseAlertDialogUp)
			drawView.pauseMenu();
		//call pause function (stops timer and dims screen)
		//same thing for pressing the clock
	}
	
	public boolean onCreateOptionsMenu(Menu menu) {
		
		mens1 = menu.add(0, 1, 2, drawView.context.getString(R.string.Settings));
		mens2 = menu.add(0, 2, 2,drawView.context.getString(R.string.Reset));
		mens3 = menu.add(0, 3, 2,drawView.context.getString(R.string.Easy));
		mens4 = menu.add(0, 4, 2, drawView.context.getString(R.string.Medium));
		mens5 = menu.add(0, 5, 2,drawView.context.getString(R.string.Hard));
		mens6 = menu.add(0, 6, 2,drawView.context.getString(R.string.High_Scores));
		mens7 = menu.add(0, 7, 2,drawView.context.getString(R.string.Multiplayer));

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
				//drawView.saveGame();
				
			}

		case KeyEvent.KEYCODE_BACK:
			if(action == KeyEvent.ACTION_DOWN)
			{
				drawView.quitMenu();
				//drawView.saveGame();
			}
			
			return super.dispatchKeyEvent(event);
		}
		return super.dispatchKeyEvent(event);
	}

	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		default:
			return false;
			
		case 1: 
			drawView.showSettings();
			return true;
		case 2:
			drawView.resetGame();
			drawView.playBoard.readjust();
			return true;

		case 3:
			easyGame();
			return true;
		case 4:
			mediumGame();
			return true;
		case 5:
			hardGame();
			return true;
			
		case 6:
			drawView.showAllHighScores();
			return true;
			
		case 7:
			drawView.startMultiplayer();
			return true;
			
		case 8:
			Board.proToggle();
			runOnUiThread(new Runnable(){ public void run() {
				drawView.invalidate();}});
			return true;


		}

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

		int actionBarHeight;

		try
		{
			actionBarHeight = getActionBar().getHeight(); //TODO
			if (actionBarHeight != 0)
				return actionBarHeight;
		}
		catch(NoSuchMethodError e)
		{
			return (int) (getStatusBarHeight());
		}

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
	
	public void easyGame()
	{
		drawView.playBoard.setWidth(9);
		drawView.playBoard.setHeight(9);
		drawView.setDifficulty(drawView.context.getString(R.string.Easy));
		drawView.playBoard.setTotalBombs(10);
		startingUp();
		drawView.playBoard.readjust();
	}

	public void mediumGame()
	{
		drawView.playBoard.setWidth(16);
		drawView.playBoard.setHeight(16);
		drawView.setDifficulty(drawView.context.getString(R.string.Medium));
		drawView.playBoard.setTotalBombs(40);
		startingUp();
		drawView.playBoard.readjust();
	}
	
	public void hardGame()
	{
		drawView.playBoard.setWidth(16);
		drawView.playBoard.setHeight(30);
		drawView.setDifficulty(drawView.context.getString(R.string.Hard));
		drawView.playBoard.setTotalBombs(99);
		startingUp();
		drawView.playBoard.readjust();
	}
	
	public void updateTitleColor(boolean gold)
	{
		if(gold) //gold font
			getActionBar().setTitle(Html.fromHtml("<font color=\"#FFD700\">"+ getString(R.string.app_name)+"</font>"));
		else
			getActionBar().setTitle(getString(R.string.app_name));
	}
	
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);


		Display display = getWindowManager().getDefaultDisplay();

		screenWidth = display.getWidth();  // deprecated
		screenHeight = display.getHeight();  // deprecated

		drawView = new DrawPanel(this, this);
		drawView.setBackgroundColor(Color.LTGRAY);

		setContentView(R.layout.activity_main);

		RelativeLayout layout2 = (RelativeLayout)findViewById(R.id.surface_home); 

		layout2.addView(drawView);

		
		if (drawView.save.getBoolean("gold",this.pro)) //gold font
			getActionBar().setTitle(Html.fromHtml("<font color=\"#FFD700\">"+ getString(R.string.app_name)+"</font>"));

		if(!pro)
		{
			// Create the adView     
			AdView adView = new AdView(this, AdSize.BANNER, "7f4b6aa604824d54");     
			// Lookup your RelativeLayoutLayout assuming it's been given     
			// the attribute android:id="@+id/ad"     
			RelativeLayout layout = (RelativeLayout)findViewById(R.id.ad); 	

			RelativeLayout.LayoutParams lp=(RelativeLayout.LayoutParams)layout.getLayoutParams();
			int barHeight = (int) (.1*MainActivity.screenHeight);

			lp.bottomMargin = barHeight; //+ (int) (.01*MainActivity.screenHeight); 
			layout.setLayoutParams(lp);

			// Add the adView to it
			layout.addView(adView);  

			// Initiate a generic request to load it with an ad     
			adView.loadAd(new AdRequest());
		}
		if(drawView.save.getBoolean("saveGame",false))
		{
			drawView.pauseGame();
			runOnUiThread(new Runnable(){ public void run() {
				drawView.invalidate();}});
			drawView.pauseMenu();
		}
		
	}
}