package com.pdonlon.mines2;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Timer;
import java.util.TimerTask;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
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
import android.text.Html;
import android.text.InputType;
import android.util.Log;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import android.graphics.Shader;
import android.content.SharedPreferences;

import com.google.android.gms.games.Games;

public class DrawPanel extends View implements View.OnTouchListener {
	Paint paint = new Paint();
	int x = 0;
	int y = 0;
	int selection;
	Board playBoard;
	String difficulty;
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
	boolean leaderboardPressed = false;

	Context ctx;
	ArrayList<Integer> mSelectedItems;
	boolean[] selected;
	public static Context context;
	String[] myStringArray = new String[2]; //TODO CHANGE PRO
	String[] myDifficultiesArray;
	String[] myHighScoresArray;
	//String Vibration = new String(context.getString(R.string.Vibration));
	//String[] myStringArray = {"vibration", "animation", "gold" };
	int difficultySelect;
	boolean paused;
	HashMap difficultyMap;
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
	SharedPreferences bombLocationX;
	SharedPreferences bombLocationY;
	Editor settingsEditor;
	Editor saveEditor;
	Editor bombXEditor;
	Editor bombYEditor;
	com.google.android.gms.common.SignInButton signInButton;

	Thread s;
	Thread l;

	boolean pauseAlertDialogUp = false;

	public boolean isLeaderboardPressed()
	{
		return leaderboardPressed;
	}

	public void setLeaderboardPressed(boolean pressed)
	{
		leaderboardPressed = pressed;
	}

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

	public DrawPanel(Context cont, MainActivity mactivity)
	{
		super(cont);
		setOnTouchListener(this);
		context = mactivity.getApplicationContext();

		//difficulty = context.getString(R.string.Easy);

		myDifficultiesArray = new String[]{context.getString(R.string.Easy),context.getString(R.string.Medium),context.getString(R.string.Hard)};
		difficultyMap = new HashMap<String, String>();
		difficultyMap.put(context.getString(R.string.Easy), 0);
		difficultyMap.put(context.getString(R.string.Medium),1);
		difficultyMap.put(context.getString(R.string.Hard),2);


		myStringArray[0]=context.getString(R.string.Vibration);
		myStringArray[1] = context.getString(R.string.Animations);
		//myStringArray[2] = context.getString(R.string.Gold); //TODO CHANGE FOR PRO

		ctx = cont;
		this.mactivity = mactivity;
		initializeSharedPreferences();

		while(!save.getBoolean("done saving", true)){
			try {
				Thread.sleep(1);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}

		if(!save.getBoolean("save", false))
			difficulty = context.getString(R.string.Easy);
		else
			difficulty = save.getString("difficulty", context.getString(R.string.Medium));

		if(!difficulty.contains(context.getString(R.string.Easy)) && !difficulty.contains(context.getString(R.string.Medium)) && !difficulty.contains(context.getString(R.string.Hard)))
		{
			difficulty = context.getString(R.string.Easy);
			saveEditor.putBoolean("saveGame", false);
			saveEditor.putInt("time", -1);
			saveEditor.commit();
		}
		startTimer();
		if(difficulty.contains(context.getString(R.string.Easy)))
		{
			playBoard = new Board(9,9,this);
			playBoard.setTotalBombs(10);
		}
		else if(difficulty.contains(context.getString(R.string.Medium)))
		{
			playBoard = new Board(16,16,this);
			playBoard.setTotalBombs(40);
		}

		else if(difficulty.contains(context.getString(R.string.Hard)))
		{
			playBoard = new Board(16,30,this);
			playBoard.setTotalBombs(99);
		}


		playBoard.setUp();
		selected = getSettings();
		mSelectedItems = getInitialSelectedItems();
		updateFlagMode();
		updateSettings();

		if(!save.getBoolean("saveGame", false))
			this.playBoard.initializeBoard();
		else{
			playBoard.setTimeCounter(save.getInt("time", -1));
			loadGame();
		}
		myHighScoresArray = new String[]{context.getString(R.string.Easy)+": "+ scores.getLong(context.getString(R.string.Easy), 0)/1000+" "+context.getString(R.string.seconds),context.getString(R.string.Medium)+": "+scores.getLong(context.getString(R.string.Medium), 0)/1000+" "+context.getString(R.string.seconds),context.getString(R.string.Hard)+": "+ scores.getLong(context.getString(R.string.Hard), 0)/1000+" "+context.getString(R.string.seconds)};
		//TODO popup for new/old users telling them about new features/highscores

//		if(settings.getInt("Version", 0) == 0)
//		{
//			displayNewMessage
//		}
//		else
//			displayLoyaltyMessage

		settingsEditor.putInt("Version", BuildConfig.VERSION_CODE);
	}

	public void setDifficulty(String a){

		difficulty = a;
	}

	public String getDifficulty()
	{
		return difficulty;
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
				if(save.getBoolean("gameInProgress", false))
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

					x = playBoard.getPressedCords()[0];
					y = playBoard.getPressedCords()[1];

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
							//Log.v("Flagged here: ", ""+e.getX()+ " "+e.getY());
						}

						playBoard.checkWin();

						if(playBoard.win){

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
				x = playBoard.getPressedCords()[0];
				y = playBoard.getPressedCords()[1];

				if(playBoard.getZoom()>-5)
				{
					x = (e.getX());
					y = (e.getY());

					playBoard.setDiffX(playBoard.getOffX() - x);
					playBoard.setDiffY(playBoard.getOffY() - y);

					if(!dragging && (Math.abs(playBoard.getDiffX() + pressX) > playBoard.getTileSize() || Math.abs(playBoard.getDiffY() + pressY) > playBoard.getTileSize() )){
						//Log.v(" X: ", ""+Math.abs(playBoard.getDiffX() + pressX));
						//Log.v(" Y: ", ""+Math.abs(playBoard.getDiffY() + pressY));
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

	public void startMultiplayer()
	{
		pauseAlertDialogUp = true;
		pauseGame();
		gameLobby();
	}

	public void gameLobby()
	{
		String[] choices = {context.getString(R.string.host_new_game),context.getString(R.string.join_existing_game)};



		builder = new AlertDialog.Builder(mactivity);
		builder.setTitle(context.getString(R.string.Multiplayer))
				.setSingleChoiceItems(choices, 0,
						new DialogInterface.OnClickListener() {
							@Override
							public void onClick(DialogInterface dialog, int which) {
								selection = which;
							}
						}
				)

		.setNegativeButton(context.getString(R.string.Cancel), new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface dialog, int id) {
				resumeGame();
			}
		})

		.setPositiveButton(context.getString(R.string.Next), new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface dialog, int id) {
				if (selection == 0)
					hostGame();
				else if (selection == 1)
					joinGame();
		}
	});

		builder.setCancelable(false);
		builder.show();
	}

	public void hostGame()
	{
			// Creating alert Dialog with one Button
			builder = new AlertDialog.Builder(mactivity);
			final int randomSeed = (int) (Math.random()*1000);

			// Setting Dialog Title
			builder.setTitle(context.getString(R.string.Host_Game)).setMessage(Html.fromHtml(context.getString(R.string.Give_your_opponents_the_code)+"<br><br><h1>"+getGameNumber()+""+randomSeed+"</h1>"+context.getString(R.string.When_all_players_are_ready)));

			// Setting Positive "Yes" Button
			builder.setPositiveButton("Start",
					new DialogInterface.OnClickListener() {
				public void onClick(DialogInterface dialog,int which) {
					// Write your code here to execute after dialog

						gameSelect(getGameNumber());
						playBoard.setSeed(randomSeed);

					mactivity.runOnUiThread(new Runnable(){ public void run() {
						playBoard.open(playBoard.width/2, playBoard.height/2);
					}});
					pauseAlertDialogUp = false;

				}
			});
			// Setting Negative "NO" Button
			builder.setNegativeButton("Cancel",
					new DialogInterface.OnClickListener() {
				public void onClick(DialogInterface dialog, int which) {
					// Write your code here to execute after dialog
					resumeGame();
				}
			});
			// closed
			builder.setCancelable(false);
			Dialog d = builder.show();
			TextView messageText = (TextView)d.findViewById(android.R.id.message);
			messageText.setGravity(Gravity.CENTER);
		}

	public void gameSelect(int select)
	{
		if(select == 0)
			mactivity.easyGame();
		else if(select == 1)
			mactivity.mediumGame();
		else
			mactivity.hardGame();
	}

	public int getGameNumber()
	{
		return (int)difficultyMap.get(difficulty);
	}

	public void joinGame()
	{
		// Creating alert Dialog with one Button
		builder = new AlertDialog.Builder(mactivity);

		// Setting Dialog Title
		//builder.setTitle("Game Code: "+(getGameNumber())+""+randomSeed).setMessage("Give your opponent this game code then click start");

		builder.setTitle(context.getString(R.string.join_game)).setMessage(context.getString(R.string.enter_code_below));

		final EditText input = new EditText(mactivity);
		input.setInputType(InputType.TYPE_CLASS_NUMBER);
		input.setFocusableInTouchMode(true);
		input.setFocusable(true);
		input.requestFocus();
		input.setHint(context.getString(R.string.hint_code)+"...");

		LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
				LinearLayout.LayoutParams.MATCH_PARENT,
				LinearLayout.LayoutParams.MATCH_PARENT);
		input.setLayoutParams(lp);
		builder.setView(input);




		// Setting Positive "Yes" Button
		builder.setPositiveButton("Start",
				new DialogInterface.OnClickListener() {
			public void onClick(DialogInterface dialog,int which) {
				// Write your code here to execute after dialog

					int seedValue = 0;
					int d = 0;
					try{
						seedValue = Integer.parseInt(input.getText().toString().substring(1, input.length()));
						d = Integer.parseInt(input.getText().toString().charAt(0) + "");
					}
					catch(Exception e)
					{
						//builder.setMessage("Please enter a valid game code");
						resumeGame();
						return;
					}

					if(seedValue<1 || d>3){
						resumeGame();
						return;
					}
					gameSelect(d);
					playBoard.setSeed(seedValue);


				mactivity.runOnUiThread(new Runnable(){ public void run() {
					playBoard.open(playBoard.width/2, playBoard.height/2);
				}});
				pauseAlertDialogUp = false;
				//start game
				//				saveEditor.putBoolean("multiplayer", true);
				//				saveEditor.commit();
			}
		});
		// Setting Negative "NO" Button
		builder.setNegativeButton("Cancel",
				new DialogInterface.OnClickListener() {
			public void onClick(DialogInterface dialog, int which) {
				// Write your code here to execute after dialog
				resumeGame();
			}
		});

		// closed

		builder.setCancelable(false);
		AlertDialog ad = builder.show();
		ad.getWindow().setSoftInputMode (WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);


	}

	public void updateScores(long score)
	{
		//setting preferences
		//int keyNumber = generateKeyNumber(difficulty);
		if(score < scores.getLong(difficulty, 0) || scores.getLong(difficulty, 0) == 0)
		{
			showNewHighScore = true;
			Editor editor = scores.edit();
			editor.putLong(difficulty, score);
			editor.commit();
			myHighScoresArray[getGameNumber()] = myDifficultiesArray[getGameNumber()]+": "+ scores.getLong(myDifficultiesArray[getGameNumber()], 0)/1000+" "+context.getString(R.string.seconds);
		}
		//fish
	}

	public void saveGame()
	{
		saveEditor.putBoolean("done saving", false);
		saveEditor.commit();

		Thread s;
		s = new Thread( new Runnable(){
			public void run()
			{
				synchronized(this){
					saveEditor.putString("difficulty", difficulty);
					saveEditor.putBoolean("gold", Board.pro);
					playBoard.endTimer();
					saveEditor.putInt("time", playBoard.getTimeCounter());

					if(gameOver || !(playBoard.getTimeCounter()>0))
					{
						saveEditor.putBoolean("saveGame", false);
						saveEditor.putBoolean("done saving", true);
						saveEditor.commit();
						return;
					}

					saveEditor.putBoolean("saveGame", true);

					Editor bsEditor = bombsSurrounding.edit();
					Editor coEditor = cellOpen.edit();
					Editor cbEditor = cellBomb.edit();
					Editor cfEditor = cellFlag.edit();

					int counter = 0;
					saveEditor.putBoolean("save", true);
					saveEditor.putFloat("theta", (float) playBoard.getTheta());
					saveEditor.putInt("total bombs", playBoard.getTotalBombs());
					saveEditor.putInt("flag count", playBoard.getFlagCount());

					for(int y=0; y<playBoard.getHeight(); y++)
						for(int x=0; x<playBoard.getWidth(); x++)
						{
							String key = counter+"";

							bsEditor.putInt(key,playBoard.getBombsSurrounding(x,y));
							cbEditor.putBoolean(key,playBoard.isThis(x, y,"bomb"));
							coEditor.putBoolean(key,playBoard.isThis(x, y,"open"));
							cfEditor.putBoolean(key,playBoard.isThis(x, y,"flag"));

							//Log.v("saving "+x+" "+y,key);

							counter++;
						}
					playBoard.saveBombLocations();

					bsEditor.commit();
					coEditor.commit();
					cbEditor.commit();
					cfEditor.commit();

					saveEditor.putBoolean("done saving", true);
					saveEditor.commit();
					mactivity.finish();
				}
			}
		});

		s.start();
	}

	public void save(Editor editor, String key, int value)
	{
		editor.putInt(key, value);
		editor.commit();
	}

	public void loadGame()
	{
		//makeToast("Loading Game");
		//startTimer();

		l = new Thread( new Runnable(){
			public void run()
			{

				int counter = 0;
				playBoard.setTheta((double)save.getFloat("theta", (float)Math.toRadians(270)));
				playBoard.setFlagCount(save.getInt("flag count", playBoard.getFlagCount()));
				Board.setPro(save.getBoolean("gold", MainActivity.pro));

				for(int y=0; y<playBoard.getHeight(); y++)
					for(int x=0; x<playBoard.getWidth(); x++)
					{
						String key = counter+"";
						int bs = bombsSurrounding.getInt(key, 0);
						boolean open = cellOpen.getBoolean(key,false);
						boolean bomb = cellBomb.getBoolean(key,false);
						boolean flagged = cellFlag.getBoolean(key,false);

						playBoard.createMine(x,y,bs,open,bomb,flagged);
						//Log.v("loading "+x+" "+y,key);

						counter++;
					}

				for(int x=0; x<save.getInt("total bombs", 0); x++)//place loaded bombs in the bomb linked list
				{
					playBoard.placeBombLocation(bombLocationX.getInt(x+"", 0),bombLocationY.getInt(x+"", 0));
					//Log.v("load:",""+bombLocationX.getInt(x+"", 0)+bombLocationY.getInt(x+"", 0));
				}
				//				notify();
			}
		});

		l.start();
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
		bombLocationX = mactivity.getSharedPreferences("bombLocationX", Context.MODE_PRIVATE);
		bombLocationY = mactivity.getSharedPreferences("bombLocationY", Context.MODE_PRIVATE);

		settingsEditor = settings.edit();
		saveEditor = save.edit();
		bombXEditor = bombLocationX.edit();
		bombYEditor = bombLocationY.edit();
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

	public void saveChecks()
	{
		for (int i=0; i<selected.length; i++)
			settingsEditor.putBoolean(myStringArray[i], selected[i]);
		settingsEditor.commit();
	}

	public void updateSettings()
	{
		vibration = selected[0];
		animations = selected[1];
//		playBoard.setPro(selected[2]); TODO PRO CHANGE
//		mactivity.updateTitleColor(selected[2]);wn on me
		invalidate();
	}

	public void pauseMenu()
	{
		if(playBoard.getOpenedBoxCount() == 0)
			return;
		//Log.v("PAUSED"," GAME");
		pauseGame();
		pauseAlertDialogUp = true;
		builder = new AlertDialog.Builder(mactivity);
		// Set the dialog title
		builder.setTitle(context.getString(R.string.Paused))

		.setPositiveButton(context.getString(R.string.Resume), new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface dialog, int id) {
				resumeGame();
			}
		})
		.setNegativeButton(context.getString(R.string.Reset), new DialogInterface.OnClickListener() {
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
		saveGame();
	}

	public void showSettings()
	{
		pauseAlertDialogUp = true;
		pauseGame();

		for (int i=0; i<selected.length; i++)
			selected[i] = false;

		for (Integer e : mSelectedItems)
			selected[e.intValue()] = true;

		builder = new AlertDialog.Builder(mactivity);
		// Set the dialog title
		builder.setTitle(context.getString(R.string.Settings))
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
		.setPositiveButton(context.getString(R.string.Save), new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface dialog, int id) {
				// User clicked OK, so save the mSelectedItems results somewhere
				// or return them to the component that opened the dialog
				saveChecks();
				updateSettings();
				resumeGame();
			}
		})
		.setNegativeButton(context.getString(R.string.Cancel), new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface dialog, int id) {
				resumeGame();
			}
		});

		builder.setCancelable(false);
		builder.show();
		//return builder.create();
	}

	public void showNewGame()
	{
		pauseAlertDialogUp = true;
		pauseGame();

		difficultySelect = getGameNumber();

		builder = new AlertDialog.Builder(mactivity);
		// Set the dialog title
		builder.setTitle(context.getString(R.string.New_Game))
				// Specify the list array, the items to be selected by default (null for none),
				// and the listener through which to receive callbacks when items are selected
				.setSingleChoiceItems(myDifficultiesArray, difficultySelect,
						new DialogInterface.OnClickListener() {
							@Override
							public void onClick(DialogInterface dialog, int which) {
								difficultySelect = which;
							}
						}
				)
						// Set the action buttons
				.setPositiveButton(context.getString(R.string.Start), new DialogInterface.OnClickListener() {
					@Override
					public void onClick(DialogInterface dialog, int id) {
						// User clicked OK, so save the mSelectedItems results somewhere
						// or return them to the component that opened the dialog
						gameSelect(difficultySelect);
					}
				})
				.setNegativeButton(context.getString(R.string.Cancel), new DialogInterface.OnClickListener() {
					@Override
					public void onClick(DialogInterface dialog, int id) {
						resumeGame();
					}
				});

		builder.setCancelable(false);
		builder.show();
		//return builder.create();
	}

	public void pauseGame()
	{
		if(!paused && save.getBoolean("gameInProgress", false) && !gameOver)
		{
			saveEditor.putInt("time", playBoard.getTimeCounter());
			saveEditor.commit();
			playBoard.endTimer();
			paused = true;
			invalidate();
		}
	}

	public void resumeGame()
	{
		if(!gameOver && save.getBoolean("gameInProgress", false))
		{
			pauseAlertDialogUp = false;
			playBoard.startTimer();
			paused = false;
			invalidate();
		}
	}

	public void saveGameInProgress(boolean inProgress)
	{
		saveEditor.putBoolean("gameInProgress", inProgress);
		saveEditor.commit();
		//Log.v("Game in Progress =",""+inProgress);
	}

	public void alertTitleAndMessage(String title, String message, final String button)
	{
		builder = new AlertDialog.Builder(mactivity);
		builder.setMessage(message).setTitle(title)

		.setPositiveButton(button, new DialogInterface.OnClickListener() {
			@Override
			public void onClick(DialogInterface dialog, int id) {
				resumeGame();
				if (button.contains(context.getString(R.string.Start)))
					playBoard.openBox(playBoard.width / 2, playBoard.height / 2);
			}
		});

		AlertDialog dialog = builder.create();
		dialog.show();
		showNewHighScore = false;
	}

	public void winMessage()
	{
		builder = new AlertDialog.Builder(mactivity);

		String title;

		if(showNewHighScore)
			title = (context.getString(R.string.New_High_Score));
		else

			title = (context.getString(R.string.You_Win));

		builder.setMessage(playBoard.getTimeCounter()+" "+context.getString(R.string.seconds)+" "+playBoard.getMillisecondsCounter()+" ms").setTitle(title)

				.setPositiveButton(context.getString(R.string.Okay), new DialogInterface.OnClickListener() {
					@Override
					public void onClick(DialogInterface dialog, int id) {

					}
				})

				.setNeutralButton(context.getString(R.string.Leaderboard), new DialogInterface.OnClickListener() {
					@Override
					public void onClick(DialogInterface dialog, int id) {
						if (!mactivity.isUserConnected()) {
							leaderboardPressed = true;
							mactivity.onSignInClicked();
						} else
							mactivity.submitScore(scores.getLong(difficulty, 0));
					}
				})

				.setNegativeButton(context.getString(R.string.Reset), new DialogInterface.OnClickListener() {
					@Override
					public void onClick(DialogInterface dialog, int id) {
						resetGame();
					}
				});
		builder.setCancelable(false);
		// 3. Get the AlertDialog frfom create()
		AlertDialog dialog = builder.create();
		dialog.show();
		winMessage = false;
	}

	public void showAllHighScores()
	{
		pauseAlertDialogUp = true;
		pauseGame();

		difficultySelect = getGameNumber();

		builder = new AlertDialog.Builder(mactivity);

		builder.setTitle(context.getString(R.string.High_Scores))

				.setSingleChoiceItems(myHighScoresArray, difficultySelect,
						new DialogInterface.OnClickListener() {
							@Override
							public void onClick(DialogInterface dialog, int which) {
								difficultySelect = which;
							}
						}
				)

				.setNegativeButton(context.getString(R.string.Cancel), new DialogInterface.OnClickListener() {
					@Override
					public void onClick(DialogInterface dialog, int id) {
						resumeGame();
					}
				})

				.setPositiveButton(context.getString(R.string.Online_Leaderboard), new DialogInterface.OnClickListener() {
					@Override
					public void onClick(DialogInterface dialog, int id) {
						pauseGame();
						if (!mactivity.isUserConnected()) {
							leaderboardPressed = true;
							mactivity.onSignInClicked();
						} else {
							mactivity.submitScore(scores.getLong(myDifficultiesArray[difficultySelect], 0));
						}
					}
				});

		AlertDialog dialog = builder.create();
		dialog.setCancelable(false);

		dialog.show();
	}

	public void makeToast(String message)
	{
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
					x = playBoard.getPressedCords()[0];
					y = playBoard.getPressedCords()[1];
					if(!playBoard.isThis(x,y,"open"))
					{
						Vibrator v = (Vibrator) mactivity.getSystemService(Context.VIBRATOR_SERVICE);

						v.vibrate(20);
						if(!flagMode)
							playBoard.markFlagged(x, y);
						else
							playBoard.open(x, y);

						playBoard.setPressed(false);
						justFlagged = true;

						if(flagMode && playBoard.isThis(x, y,"bomb") && Board.doneAnimating)
						{
							playBoard.bombs.remove(x, y);
							playBoard.bombs.enque(x, y);
							playBoard.endOfGameSetWrong();
							playBoard.setLose(true);
							gameOver = true;
							playBoard.endTimer();
							bombAnimation();
						}
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

	public void resetGame()
	{
		if(playBoard.doneAnimating())
		{
			playBoard.setTheta(Math.toRadians(270));
			playBoard.setTimeCounter(0);
			playBoard.setSeed(-1);
			playBoard.startup();
			playBoard.wipeBoard();
			gameOver = false;

			playBoard.endTimer();
			paused = false;
			saveEditor.putBoolean("gameInProgress", false);
			saveEditor.putBoolean("saveGame", false);
			saveEditor.commit();
			invalidate();
		}
	}

	public void bombAnimation()
	{
		final String tempDifficulty = difficulty;

		int vibrationTime;

		if(!animations)
			vibrationTime = 0;
		else if(tempDifficulty.contains(context.getString(R.string.Easy)))
			vibrationTime = 50;
		else if(tempDifficulty.contains(context.getString(R.string.Medium)))
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
				//				if(playBoard.getUnsafeBombCount()==0)
				//					bombsLeft = 1;

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

	public void explosion()
	{
		playBoard.openBomb();
		this.mactivity.runOnUiThread(new Runnable(){ public void run() {
			invalidate();}});        }

}