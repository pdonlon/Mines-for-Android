package com.pdonlon.mines2;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Timer;
import java.util.TimerTask;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences.Editor;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader.TileMode;
import android.os.Bundle;
import android.os.Vibrator;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;
import android.graphics.Shader;
import android.content.SharedPreferences;

public class DrawPanel extends View implements View.OnTouchListener {
	Paint paint = new Paint();
	int x = 0;
	int y = 0;
	Board playBoard;
	String difficulty = "Easy";
	boolean gameOver = false;
	boolean dragging;
	boolean flagMode;
	boolean vibration = true;
	MainActivity mactivity;
	float pressX;
	float pressY;
	boolean justFlagged;
	boolean justPressedBar;
	boolean longPressed = false;

	Timer timer;
	TimerTask tt;
	float timeCounter;
	boolean showNewHighScore = false;
	boolean hints;

	Context ctx;
	ArrayList<Integer> mSelectedItems;
	boolean[] selected;
	String[] myStringArray = {"Vibration","Hints"};
	public static Context context;

	public boolean getFlagMode()
	{
		return flagMode;
	}

	public void setFlagMode(boolean a)
	{        
		flagMode = a;
	}

	public boolean getVibration()
	{
		return vibration;
	}

	public void setVibration(boolean a)
	{        
		vibration = a;
	}

	public DrawPanel(Context context, MainActivity mactivity) 
	{
		super(context);      
		setOnTouchListener(this);
		ctx = context;
		this.mactivity = mactivity;

		startTimer();

		if(difficulty.contains("Easy")){
			playBoard = new Board(9,9,this);
			playBoard.setTotalBombs(10);

		}

		else if(difficulty.contains("Medium")){
			playBoard = new Board(16,16,this);
			playBoard.setTotalBombs(40);
		}

		else if(difficulty.contains("Hard")){
			playBoard = new Board(30,16,this);
			playBoard.setTotalBombs(99);

		}
		playBoard.setUp();
		
		selected = getSettings();
		mSelectedItems = getInitialSelectedItems(); 

		this.playBoard.initializeBoard();
		updateSettings();
	}

	public void setDifficulty(String a){

		difficulty = a;
	}

	public void onDraw(Canvas g) {

		playBoard.paintBoard(g);

	}

	public boolean onTouch(View v, MotionEvent e) 
	{                
		float x = (e.getX()-playBoard.getOffX())/(playBoard.tileSize);
		float y = (e.getY()-playBoard.getOffY())/(playBoard.tileSize);

		float x2 = (e.getX());
		float y2 = (e.getY());

		if (e.getAction() == MotionEvent.ACTION_DOWN && Board.doneAnimating && y2 >= playBoard.realBarHeight){

			justPressedBar = true;

			if(x2 >= (MainActivity.screenWidth*4)/5)
				playBoard.zoomIn((float) playBoard.getHeight()/2, (float) playBoard.getWidth()/2);
			else if(x2 >= (MainActivity.screenWidth*3)/5)
				playBoard.zoomOut((float) playBoard.getHeight()/2, (float) playBoard.getWidth()/2);
			else if(x2 >= (MainActivity.screenWidth*2)/5)
				flagMode = !flagMode;
			else
				return true;

			invalidate();

			return true;
		}

		if(Board.doneAnimating && playBoard.isValid((int)x, (int)y)){

			if (e.getAction() == MotionEvent.ACTION_DOWN){ //pressed
				//Log.v("Pressed here: ", ""+e.getX()+ " "+e.getY()); //takes label and text

				justPressedBar = false;
				justFlagged = false;
				timeCounter = 0;

				Log.v("Pressed: ", ""+timeCounter); //takes label and text

				dragging = false;
				pressX = (e.getX()) - playBoard.getOffX();
				pressY = (e.getY()) - playBoard.getOffY();

				playBoard.removeHint();

				playBoard.setPressed(false);

				if(playBoard.isValid((int)x,(int)y))
				{
					playBoard.setPressedCords((int)x, (int)y);
					playBoard.setPressed(true);
					invalidate();
				}

				float pressX = e.getX()-playBoard.getOffX();
				float pressY = e.getY()-playBoard.getOffY();

			}
			else if(e.getAction() == MotionEvent.ACTION_UP)
			{//released
				Log.v("Released: ", ""+timeCounter); //takes label and text

				if(!dragging && !justFlagged && !justPressedBar){ 

					x = (int) playBoard.getPressedCords()[0];
					y = (int) playBoard.getPressedCords()[1];

					if(playBoard.isValid((int)x, (int)y) && playBoard.beingPressed){

						if(gameOver)
							resetGame();

						else if(!playBoard.isOpen((int)x, (int)y)&&!flagMode)
							playBoard.open((int)x, (int)y);

						else if(playBoard.isOpen((int)x, (int)y))
							playBoard.fastClick((int)x, (int)y);

						else if(!playBoard.isOpen((int)x, (int)y)&&flagMode){
							playBoard.markFlagged((int)x, (int)y);
							Log.v("Flagged here: ", ""+e.getX()+ " "+e.getY());
						}

						if(playBoard.lose){
							playBoard.setPressed(false);
							bombAnimation();

						}
					}
					playBoard.setPressed(false);
					invalidate();
				}
				else
					dragging = false;
			}

			else if(!justFlagged && !justPressedBar)
			{
				x = (int) playBoard.getPressedCords()[0];
				y = (int) playBoard.getPressedCords()[1];

				if(playBoard.getZoom()>-5)
				{
					Log.v("dragging: ", ""+timeCounter); //takes label and text

					x = (e.getX());
					y = (e.getY());

					playBoard.setDiffX(playBoard.getOffX() - x);
					playBoard.setDiffY(playBoard.getOffY() - y);

					if(!dragging && (Math.abs(playBoard.getDiffX() + pressX) > playBoard.getTileSize() || Math.abs(playBoard.getDiffY() + pressY) > playBoard.getTileSize() )){
						Log.v(" X: ", ""+Math.abs(playBoard.getDiffX() + pressX));
						Log.v(" Y: ", ""+Math.abs(playBoard.getDiffY() + pressY));
						dragging = true;
						playBoard.setPressed(false);
					}

					if(dragging){
						playBoard.setOffX(playBoard.getOffX() - playBoard.getDiffX() - pressX);
						playBoard.setOffY(playBoard.getOffY() - playBoard.getDiffY() - pressY);
					}


					invalidate();
				}
			}
			return true;

		}
		else
			return true;
	}

	public void updateScores(int score)
	{
		//setting preferences
		//int keyNumber = generateKeyNumber(difficulty);

		SharedPreferences scores = mactivity.getSharedPreferences("myPrefsKey", Context.MODE_PRIVATE);
		if(score < scores.getInt(difficulty, 0) || scores.getInt(difficulty, 0) == 0)
		{
			showNewHighScore = true;
			Editor editor = scores.edit();
			editor.putInt(difficulty, score);
			editor.commit();
		}
	}
	
	public boolean[] getSettings()
	{
		SharedPreferences settings = mactivity.getSharedPreferences("settings", Context.MODE_PRIVATE);
		
		boolean[] chosen = new boolean[myStringArray.length];
		for (int i=0; i<myStringArray.length; i++)
			chosen[i] = settings.getBoolean(myStringArray[i], (i==0)? true : false); //ternary statement
		
		return chosen;
	}
	
	public ArrayList<Integer> getInitialSelectedItems()
	{
		ArrayList<Integer> theChosen = new ArrayList<Integer>();
		
		for (int i=0; i<selected.length; i++)
			if (selected[i])
				theChosen.add(i);
			
		return theChosen;
		
	}

	public int getScore()
	{
		//getting preferences
		//int keyNumber = generateKeyNumber(difficulty);

		SharedPreferences scores = mactivity.getSharedPreferences("myPrefsKey", Context.MODE_PRIVATE);
		int highScore = scores.getInt(difficulty, 0); //0 is the default value

		return highScore;
	}

//	public boolean getConvertSelectedItems(int index)
//	{	
//		boolean [] copy = new boolean[2];
//
//		if(mSelectedItems == null){
//			copy[0] = true;
//			copy[1] = false;
//		}
//		else{
//			copy[0] = getSelectedBoolean(0);
//			copy[1] = getSelectedBoolean(1);
//		}
//		return copy[index];
//	}

//	public boolean getSelectedBoolean(int index)
//	{
//		Log.v("TEST", ""+mSelectedItems.get(index));
//		if((Boolean) mSelectedItems.get(index) == true)
//
//			return true;
//
//		else
//			return false;
//	}

	public void saveChecks()
	{
		SharedPreferences settings = mactivity.getSharedPreferences("settings", Context.MODE_PRIVATE);
		Editor editor = settings.edit();
		for (int i=0; i<selected.length; i++)
			editor.putBoolean(myStringArray[i], selected[i]);
		editor.commit();
	}
	
	public void updateSettings()
	{
		vibration = selected[0];
		hints = selected[1];
	}

	public void showSettings()
	{
		// converted selected		
		
		for (int i=0; i<selected.length; i++)
			selected[i] = false;
		
		for (Integer e : mSelectedItems)
			selected[e.intValue()] = true;
		
	    AlertDialog.Builder builder = new AlertDialog.Builder(mactivity);
	    // Set the dialog title
	    builder.setTitle("settings")
	    // Specify the list array, the items to be selected by default (null for none),
	    // and the listener through which to receive callbacks when items are selected
	           .setMultiChoiceItems(myStringArray, selected,
	                      new DialogInterface.OnMultiChoiceClickListener() {
	               @Override
	               public void onClick(DialogInterface dialog, int which,
	                       boolean isChecked) {
	                   if (isChecked) {
	                       // If the user checked the item, add it to the selected items
	                       mSelectedItems.add(which);
	                   } else if (mSelectedItems.contains(which)) {
	                       // Else, if the item is already in the array, remove it 
	                       mSelectedItems.remove(Integer.valueOf(which));
	                   }
	               }
	           })
	    // Set the action buttons
	           .setPositiveButton("Ok", new DialogInterface.OnClickListener() {
	               @Override
	               public void onClick(DialogInterface dialog, int id) {
	                   // User clicked OK, so save the mSelectedItems results somewhere
	                   // or return them to the component that opened the dialog
	            	   saveChecks();
	            	   updateSettings();
	            	   
	                  // ...
	               }
	           })
	           .setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
	               @Override
	               public void onClick(DialogInterface dialog, int id) {
	                   //...
	               }
	           });

		builder.show();
		//return builder.create();
	}

	public void showNewHighScore()
	{
		AlertDialog.Builder builder = new AlertDialog.Builder(mactivity);
		builder.setMessage(playBoard.getTimeCounter()+" seconds").setTitle("New High Score!");

		// 3. Get the AlertDialog from create()
		AlertDialog dialog = builder.create();
		dialog.show();
		showNewHighScore = false;
	}

	public void showAllHighScores()
	{
		AlertDialog.Builder builder = new AlertDialog.Builder(mactivity);
		SharedPreferences scores = mactivity.getSharedPreferences("myPrefsKey", Context.MODE_PRIVATE);

		builder.setMessage("Easy: "+ scores.getInt("Easy", 0)+" seconds\n\n"+"Medium: "+scores.getInt("Medium", 0)+" seconds\n\n"+"Hard: "+ scores.getInt("Hard", 0)+" seconds").setTitle("High Scores");

		AlertDialog dialog = builder.create();
		dialog.show();
	}

	public void startTimer(){

		timer = new Timer();

		timer.scheduleAtFixedRate(new TimerTask() 
		{
			@Override
			public void run() 
			{

				timeCounter+=.1;
				if(gameOver){
					return;
				}
				if(timeCounter > 3.5 && !dragging && playBoard.beingPressed)
				{
					x = (int) playBoard.getPressedCords()[0];
					y = (int) playBoard.getPressedCords()[1];
					if(!playBoard.isOpen(x,y))
					{
						Vibrator v = (Vibrator) mactivity.getSystemService(Context.VIBRATOR_SERVICE);

						v.vibrate(20);
						if(!flagMode)
							playBoard.markFlagged((int)x,(int)y);
						else
							playBoard.open((int)x,(int)y);

						playBoard.setPressed(false);
						justFlagged = true;

						if(flagMode && playBoard.isBomb(x, y) && Board.doneAnimating)
						{
							playBoard.bombs.remove(x, y); 
							playBoard.endOfGameSetWrong();
							playBoard.setLose(true);
							gameOver = true;
							playBoard.endTimer();
							bombAnimation();


						} //TODO FIX WINNING AND LOSING FROM THIS SCREEN
						else{
							playBoard.checkWin();
							if(playBoard.win)
							{
								gameOver = true;
								playBoard.endTimer();
								invalidate();
							}
						}
					}
					mactivity.runOnUiThread(new Runnable() {
						public void run() {
							invalidate();
						}
					});
				}
				mactivity.runOnUiThread(new Runnable() {
					public void run() {
						if(showNewHighScore)
							showNewHighScore();
					}
				});
			}

		}, 0, 10);

	}

	public boolean gameOver(){

		if(playBoard.getWin() || playBoard.getLose())
		{
			gameOver = true;

			if(showNewHighScore)
				showNewHighScore();

			playBoard.endTimer();
		}                
		return gameOver;
	}

	public void setGameOver(boolean a){

		gameOver = a;
	}

	public void resetGame(){

		if(playBoard.doneAnimating())
		{        
			playBoard.startup();
			playBoard.wipeBoard();
			gameOver = false;

			playBoard.endTimer();
			invalidate();
		}
	}

	public void bombAnimation(){

		final String tempDifficulty = difficulty;

		int vibrationTime; 

		if(tempDifficulty.contains("Easy"))
			vibrationTime = 50;
		else if(tempDifficulty.contains("Medium"))
			vibrationTime = 25;
		else 
			vibrationTime = 10;

		final int tempVibration = vibrationTime;

		Thread b;
		b = new Thread( new Runnable(){
			public void run(){

				Vibrator v = (Vibrator) mactivity.getSystemService(Context.VIBRATOR_SERVICE);
				Board.doneAnimating = false;

				int bombsLeft = playBoard.getUnsafeBombCount()-1;

				while(bombsLeft>0){

					try {
						Thread.sleep(tempVibration);
					} catch(InterruptedException ex) {
						Thread.currentThread().interrupt();
					}

					explosion();
					// Vibration in milliseconds
					if(vibration)
						v.vibrate(tempVibration);
					bombsLeft--;
				}
				Board.doneAnimating = true;
			}
		});

		b.start();
	}

	public void explosion(){

		playBoard.openBomb();
		this.mactivity.runOnUiThread(new Runnable(){ public void run() {
			invalidate();}});        }

}