package com.pdonlon.mines2;

import java.util.Timer;
import java.util.TimerTask;

import android.app.Activity;
import android.content.Context;
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
import android.widget.Toast;
import android.graphics.Shader;

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
	
	Timer timer;
	TimerTask tt;
	float timeCounter;

	Context ctx;

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

		this.playBoard.initializeBoard();

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

	public void startTimer(){

		timer = new Timer();

		timer.scheduleAtFixedRate(new TimerTask() {
			@Override
			public void run() {
				
				timeCounter+=.1;
				
				if(timeCounter > 3.5 && !dragging && playBoard.beingPressed){
					x = (int) playBoard.getPressedCords()[0];
					y = (int) playBoard.getPressedCords()[1];
					if(!playBoard.isOpen(x,y)){
					Vibrator v = (Vibrator) mactivity.getSystemService(Context.VIBRATOR_SERVICE);
					
					v.vibrate(20);
					if(!flagMode)
						playBoard.markFlagged((int)x,(int)y);
					else
						playBoard.open((int)x,(int)y);
						
					playBoard.setPressed(false);
					justFlagged = true;
					
					if(flagMode && playBoard.isBomb(x, y) && Board.doneAnimating){
						playBoard.bombs.remove(x, y);
						playBoard.endOfGameSetWrong();
						playBoard.setLose(true);
						gameOver = true;
						playBoard.endTimer();
						bombAnimation();

					} //TODO FIX WINNING AND LOSING FROM THIS SCREEN
					else{
						playBoard.checkWin();
						if(playBoard.win){
							gameOver = true;
							playBoard.endTimer();
						}
					}
					}
				}
				mactivity.runOnUiThread(new Runnable() {
					public void run() {
						invalidate();
					}
				});
			}

		}, 0, 10);

	}

	public boolean gameOver(){

		if(playBoard.getWin() || playBoard.getLose())
		{
			gameOver = true;
			Log.v("Pressed here: ", "WIN"); //takes label and text
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
			invalidate();}});	}

}