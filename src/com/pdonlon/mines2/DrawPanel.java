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
	boolean winMessage = false;
	boolean animations = true;	

	Context ctx;
	ArrayList<Integer> mSelectedItems;
	boolean[] selected;
	String[] myStringArray = {"Vibration","Animations"};
	public static Context context;
	boolean paused;
	AlertDialog.Builder builder;
	SharedPreferences scores;
	SharedPreferences bombsSurrounding;
	SharedPreferences flags;
	SharedPreferences cellStatus;
	SharedPreferences save;
	SharedPreferences settings;
	SharedPreferences cellFlag;
	SharedPreferences cellBomb;
	SharedPreferences cellOpen;

	boolean pauseAlertDialogUp = false;

	public boolean getFlagMode()
	{
		return flagMode;
	}

	public void setFlagMode(boolean a)
	{        
		flagMode = a;
	}

	public void setWinMessage(boolean a)
	{        
		winMessage = a;
	}

	public DrawPanel(Context context, MainActivity mactivity) 
	{
		super(context);      
		setOnTouchListener(this);
		ctx = context;
		this.mactivity = mactivity;

		initializeSharedPreferences();
		if(save.getBoolean("save", false))
		{
			difficulty = save.getString("difficulty", "Easy");
			if(!save.getBoolean("gold", true))
				playBoard.proToggle();
		}
		startTimer();

		if(difficulty.contains("Easy"))
		{
			playBoard = new Board(9,9,this);
			playBoard.setTotalBombs(10);
		}
		else if(difficulty.contains("Medium"))
		{
			playBoard = new Board(16,16,this);
			playBoard.setTotalBombs(40);
		}

		else if(difficulty.contains("Hard"))
		{
			playBoard = new Board(30,16,this);
			playBoard.setTotalBombs(99);
		}
		playBoard.setUp();

		selected = getSettings();
		mSelectedItems = getInitialSelectedItems(); 

		if(!save.getBoolean("saveGame", false))
			this.playBoard.initializeBoard();
		else
			loadGame();

		updateFlagMode();
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

		if (e.getAction() == MotionEvent.ACTION_DOWN && Board.doneAnimating && y2 >= playBoard.realBarHeight)
		{

			justPressedBar = true;

			if(x2 >= (MainActivity.screenWidth*4)/5)
				playBoard.zoomIn((float) playBoard.getWidth()/2, (float) playBoard.getHeight()/2);
			else if(x2 >= (MainActivity.screenWidth*3)/5)
				playBoard.zoomOut((float) playBoard.getWidth()/2, (float) playBoard.getHeight()/2);
			else if(x2 >= (MainActivity.screenWidth*2)/5)
			{
				flagMode = !flagMode;
				saveFlagMode();
			}

			else if(x2 < (MainActivity.screenWidth*1)/5)
			{
				pauseMenu();
			}
			else
				return true;

			invalidate();

			return true;
		}

		if (e.getAction() == MotionEvent.ACTION_DOWN && Board.doneAnimating && paused)
		{
			resumeGame();
			return true;
		}

		if(Board.doneAnimating && playBoard.isValid((int)x, (int)y))
		{
			if (e.getAction() == MotionEvent.ACTION_DOWN)
			{ //pressed
				//Log.v("Pressed here: ", ""+e.getX()+ " "+e.getY()); //takes label and text

				justPressedBar = false;
				justFlagged = false;
				timeCounter = 0;

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

				if(!dragging && !justFlagged && !justPressedBar){ 

					x = (int) playBoard.getPressedCords()[0];
					y = (int) playBoard.getPressedCords()[1];

					if(playBoard.isValid((int)x, (int)y) && playBoard.beingPressed)
					{
						if(gameOver)
							resetGame();

						else if(!playBoard.isThis((int)x, (int)y,"open")&&!flagMode)
							playBoard.open((int)x, (int)y);

						else if(playBoard.isThis((int)x, (int)y,"open"))
							playBoard.fastClick((int)x, (int)y);

						else if(!playBoard.isThis((int)x, (int)y,"open")&&flagMode)
						{
							playBoard.markFlagged((int)x, (int)y);
							Log.v("Flagged here: ", ""+e.getX()+ " "+e.getY());
						}

						playBoard.checkWin();

						if(playBoard.win){
							if(showNewHighScore)
								showNewHighScore();
							if(winMessage)
								winMessage();
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
		if(score < scores.getInt(difficulty, 0) || scores.getInt(difficulty, 0) == 0)
		{
			showNewHighScore = true;
			Editor editor = scores.edit();
			editor.putInt(difficulty, score);
			editor.commit();
		}
	}

	public void saveGame()
	{
		Editor saveEditor = save.edit();
		saveEditor.putString("difficulty", difficulty);
		saveEditor.putBoolean("gold", playBoard.pro);
		saveEditor.putInt("time", playBoard.getTimeCounter());

		if(gameOver || !(playBoard.getTimeCounter()>0))
		{
			saveEditor.putBoolean("saveGame", false);
			saveEditor.commit();
			return;
		}
		makeToast("Saving Game");
		saveEditor.putBoolean("saveGame", true);

		Editor bsEditor = bombsSurrounding.edit();
		Editor coEditor = cellOpen.edit();
		Editor cbEditor = cellBomb.edit();
		Editor cfEditor = cellFlag.edit();

		int counter = 0;
		saveEditor.putBoolean("save", true);
		saveEditor.putInt("total bombs", playBoard.getTotalBombs());

		for(int y=0; y<playBoard.getHeight(); y++)
			for(int x=0; x<playBoard.getWidth(); x++)
			{
				bsEditor.putInt(counter+"",playBoard.getBombsSurrounding(x,y));
				cbEditor.putBoolean(counter+"",playBoard.isThis(x, y,"bomb"));
				coEditor.putBoolean(counter+"",playBoard.isThis(x, y,"open"));
				cfEditor.putBoolean(counter+"",playBoard.isThis(x, y,"flag"));

				counter++;
			}
		bsEditor.commit();
		coEditor.commit();
		cbEditor.commit();
		cfEditor.commit();
		saveEditor.commit();

	}

	public void loadGame()
	{
		makeToast("Loading Game");
		int counter = 0;
		
		playBoard.setTimeCounter(save.getInt("time", 0));
		
		for(int y=0; y<playBoard.getHeight(); y++)
			for(int x=0; x<playBoard.getWidth(); x++)
			{
				String key = counter+"";
				int bs = bombsSurrounding.getInt(key, 0);
				boolean open = cellOpen.getBoolean(key,false);
				boolean bomb = cellBomb.getBoolean(key,false);
				boolean flagged = cellFlag.getBoolean(key,false);

				playBoard.createMine(x,y,bs,open,bomb,flagged);
				//csEditor.putInt(counter+"",); //lookup
				counter++;
			}
		invalidate();
		
	}

	public void initializeSharedPreferences()
	{
		flags = mactivity.getSharedPreferences("flags", Context.MODE_PRIVATE);
		cellFlag = mactivity.getSharedPreferences("flag", Context.MODE_PRIVATE);
		cellOpen = mactivity.getSharedPreferences("open", Context.MODE_PRIVATE);
		cellBomb = mactivity.getSharedPreferences("bomb", Context.MODE_PRIVATE);

		bombsSurrounding = mactivity.getSharedPreferences("bombsSurrounding", Context.MODE_PRIVATE); //number of bombs surrounding
		settings = mactivity.getSharedPreferences("settings", Context.MODE_PRIVATE);
		scores = mactivity.getSharedPreferences("scores", Context.MODE_PRIVATE);
		cellStatus = mactivity.getSharedPreferences("cellStatus", Context.MODE_PRIVATE); //opened, not opened, flagged
		save = mactivity.getSharedPreferences("save", Context.MODE_PRIVATE); //opened, not opened, flagged

	}

	public void saveFlagMode()
	{
		Editor editor = flags.edit();
		editor.putBoolean("flagMode", flagMode); // string is where it is stored
		editor.commit();

	}

	public void updateFlagMode()
	{
		flagMode = flags.getBoolean("flagMode", false); //false is the default value

	}

	public boolean[] getSettings()
	{
		boolean[] chosen = new boolean[myStringArray.length];
		for (int i=0; i<myStringArray.length; i++)
			chosen[i] = settings.getBoolean(myStringArray[i], (i<2)? true : false); //ternary statement

		//chosen[i] = settings.getBoolean(myStringArray[i], (i==0)? true : false); //ternary statement

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

		int highScore = scores.getInt(difficulty, 0); //0 is the default value

		return highScore;
	}

	public void saveChecks()
	{
		Editor editor = settings.edit();
		for (int i=0; i<selected.length; i++)
			editor.putBoolean(myStringArray[i], selected[i]);
		editor.commit();
	}

	public void updateSettings()
	{
		vibration = selected[0];
		animations = selected[1];
	}

	public void pauseMenu()
	{
		pauseGame();
		pauseAlertDialogUp = true;
		builder = new AlertDialog.Builder(mactivity);
		// Set the dialog title
		builder.setTitle("Paused")

		.setPositiveButton("Resume", new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface dialog, int id) {
				resumeGame();
			}
		})
		.setNegativeButton("Reset", new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface dialog, int id) {
				resetGame();
			}
		});

		builder.setCancelable(false);
		builder.show();
		//return builder.create();
	}

	public void quitMenu()
	{
		pauseGame();
		pauseAlertDialogUp = true;
		builder = new AlertDialog.Builder(mactivity);
		// Set the dialog title
		builder.setTitle("Are you sure you want to quit?")
		.setPositiveButton("Yes", new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface dialog, int id) {
				saveGame();
				mactivity.finish();
			}
		})
		.setNegativeButton("No", new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface dialog, int id) {
				resumeGame();
			}
		});

		builder.setCancelable(false);
		builder.show();

		//return builder.create();
	}

	public void showSettings()
	{
		pauseAlertDialogUp = true;
		pauseGame();		

		for (int i=0; i<selected.length; i++)
			selected[i] = false;

		for (Integer e : mSelectedItems)
			selected[e.intValue()] = true;

		AlertDialog.Builder builder = new AlertDialog.Builder(mactivity);
		// Set the dialog title
		builder.setTitle("Settings")
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
				resumeGame();
			}
		})
		.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface dialog, int id) {
				resumeGame();			}
		});

		builder.setCancelable(false);
		builder.show();
		//return builder.create();
	}

	public void pauseGame()
	{
		if(!paused && playBoard.getTimeCounter() > 0)
		{
			playBoard.endTimer();
			paused = true;
			invalidate();
		}
	}

	public void resumeGame()
	{
		if(!gameOver && playBoard.getTimeCounter() > 0)
		{
			pauseAlertDialogUp = false;
			playBoard.startTimer();
			paused = false;
			invalidate();

		}
	}

	public void showNewHighScore()
	{
		AlertDialog.Builder builder = new AlertDialog.Builder(mactivity);
		builder.setMessage(playBoard.getTimeCounter()+" seconds").setTitle("New High Score!")

		.setPositiveButton("Okay", new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface dialog, int id) {

			}
		});
		//		.setNegativeButton("Reset", new DialogInterface.OnClickListener() {
		//			@Override
		//			public void onClick(DialogInterface dialog, int id) {
		//				resetGame();
		//			}
		//		});

		// 3. Get the AlertDialog from create()
		AlertDialog dialog = builder.create();
		dialog.show();
		showNewHighScore = false;
	}

	public void winMessage()
	{
		AlertDialog.Builder builder = new AlertDialog.Builder(mactivity);
		builder.setMessage(playBoard.getTimeCounter()+" seconds").setTitle("You Win!")

		.setPositiveButton("Okay", new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface dialog, int id) {

			}
		})
		.setNegativeButton("Reset", new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface dialog, int id) {
				resetGame();
			}
		});

		// 3. Get the AlertDialog from create()
		AlertDialog dialog = builder.create();
		dialog.show();
		winMessage = false;
	}

	public void showAllHighScores()
	{
		pauseAlertDialogUp = true;
		pauseGame();		

		AlertDialog.Builder builder = new AlertDialog.Builder(mactivity);

		builder.setMessage("Easy: "+ scores.getInt("Easy", 0)+" seconds\n\n"+"Medium: "+scores.getInt("Medium", 0)+" seconds\n\n"+"Hard: "+ scores.getInt("Hard", 0)+" seconds").setTitle("High Scores")

		.setNegativeButton("Ok", new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface dialog, int id) {
				resumeGame();
			}
		});

		AlertDialog dialog = builder.create();
		dialog.setCancelable(false);
		dialog.show();
	}

	public void makeToast(String message)
	{
		Context context = mactivity.getApplicationContext();
		CharSequence text = message;
		int duration = Toast.LENGTH_SHORT;

		Toast toast = Toast.makeText(context, text, duration);
		//toast.setGravity(Gravity.TOP|Gravity.LEFT, 0, 0); //position of toast
		toast.show();
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
					if(!playBoard.isThis(x,y,"open"))
					{
						Vibrator v = (Vibrator) mactivity.getSystemService(Context.VIBRATOR_SERVICE);

						v.vibrate(20);
						if(!flagMode)
							playBoard.markFlagged((int)x,(int)y);
						else
							playBoard.open((int)x,(int)y);

						playBoard.setPressed(false);
						justFlagged = true;

						if(flagMode && playBoard.isThis(x, y,"bomb") && Board.doneAnimating)
						{
							playBoard.bombs.remove(x, y); 
							playBoard.endOfGameSetWrong();
							playBoard.setLose(true);
							gameOver = true;
							playBoard.endTimer();
							bombAnimation();
						} //TODO FIX WINNING AND LOSING FROM THIS SCREEN
						else if(flagMode && playBoard.win){

							//winMessage();

							//playBoard.checkWin();
							//							if(playBoard.win)
							//							{
							//								gameOver = true;
							//								playBoard.endTimer();
							//								invalidate();
							//							}
						}
					}
					mactivity.runOnUiThread(new Runnable() {
						public void run() {
							invalidate();
							if(showNewHighScore)
								showNewHighScore();
							if(winMessage)
								winMessage();
						}
					});
				}
			}

		}, 0, 10);

	}

	public boolean gameOver(){

		if(playBoard.getWin() || playBoard.getLose())
		{
			gameOver = true;

			//			if(winMessage)
			//				winMessage();
			//			
			//			if(showNewHighScore)
			//				showNewHighScore();

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
			playBoard.setTimeCounter(0);
			playBoard.startup();
			playBoard.wipeBoard();
			gameOver = false;

			playBoard.endTimer();
			paused = false;
			//playBoard.readjust();
			invalidate();
		}
	}

	public void bombAnimation()
	{
		final String tempDifficulty = difficulty;

		int vibrationTime; 

		//TODO
		if(!animations)
			vibrationTime = 0;
		else if(tempDifficulty.contains("Easy"))
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

				while(bombsLeft>0)
				{
					try {
						Thread.sleep(tempVibration);
					} catch(InterruptedException ex) {
						Thread.currentThread().interrupt();
					}

					explosion();
					// Vibration in milliseconds
					if(vibration){
						v.vibrate(tempVibration);
						if(!animations)
							v.vibrate(100);

					}
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