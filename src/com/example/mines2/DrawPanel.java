package com.example.mines2;

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
	MainActivity mactivity;
	float pressX;
	float pressY;

	Context ctx;

	public boolean getFlagMode()
	{
		return flagMode;
	}

	public void setFlagMode(boolean a)
	{	
		flagMode = a;
	}

	public DrawPanel(Context context, MainActivity mactivity) {

		super(context);      
		setOnTouchListener(this);
		ctx = context;
		this.mactivity = mactivity;



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

	// paintComponent()
	public void onDraw(Canvas g) {

		//
		//		// set width of thick cheese lines
		//		thickDarkGray.setStrokeWidth(15);
		//		
		//		// set dimensions of squares
		//		int NumberOfSquaresAcross = 5;
		//		int NumberOfSquaresDown = 9;
		//
		//
		//		for (int xOff=0; xOff < NumberOfSquaresAcross*100; xOff += 100)
		//			for (int yOff=0; yOff < NumberOfSquaresDown*100; yOff += 100)
		//			{
		//
		//				// draw background square
		//				g.drawRect(100 + xOff, 100 + yOff, 200 + xOff, 200 + yOff, darkGray);
		//
		//				// draw cheese rectangles
		//				g.drawRect(100 + xOff, 100 + yOff, 115 + xOff, 200 + yOff, lightGray);
		//				g.drawRect(100 + xOff, 100 + yOff, 200 + xOff, 115 + yOff, lightGray);
		//
		//				// draw cheese lines
		//				g.drawLine(105 + xOff, 205 + yOff, 205 + xOff, 105 + yOff, thickDarkGray);
		//
		//				// draw inner square
		//				g.drawRect(115 + xOff, 115 + yOff, 185 + xOff, 185 + yOff, gray);
		//
		//			}
		//		
		//		// cover up excess with white triangles
		//		g.drawRect((NumberOfSquaresAcross+1)*100, 100, (NumberOfSquaresAcross+1)*100 + 20, (NumberOfSquaresDown+1)*100, background);
		//		g.drawRect(100, (NumberOfSquaresDown+1)*100, (NumberOfSquaresAcross+1)*100, (NumberOfSquaresDown+1)*100 + 20, background);
		//
		//		// gradient stuff
		//		int color1 = Color.argb(0, 0, 0, 0);
		//		int color2 = Color.argb(100, 0, 0, 0);
		//
		//		
		//		Shader shader = new LinearGradient(0, 0, (NumberOfSquaresAcross+1)*100, (NumberOfSquaresDown+1)*100, color1, color2, TileMode.CLAMP);
		//		Paint paint = new Paint(); 
		//		paint.setShader(shader); 
		//		
		//		g.drawRect(new RectF(100, 100, (NumberOfSquaresAcross+1)*100, (NumberOfSquaresDown+1)*100), paint); 


		playBoard.paintBoard(g);

		//paint.setColor(Color.BLUE);

		// getHeight() and getWidth() size of screen

		// paint.setShader(new LinearGradient(x, y, x+100, y+100, Color.BLACK, Color.WHITE, Shader.TileMode.MIRROR));

		//g.drawRect(x,y,x+10,y+10, paint);

	}

	@Override
	public boolean onTouch(View v, MotionEvent e) 
	{		
		if(Board.doneAnimating){
			// check e.getAction() == MotionEvent.ACTION_DOWN
			if (e.getAction() == MotionEvent.ACTION_DOWN){ //pressed
				//Log.v("Pressed here: ", ""+e.getX()+ " "+e.getY()); //takes label and text

				dragging = false;
				pressX = (e.getX()) - playBoard.getOffX();
				pressY = (e.getY()) - playBoard.getOffY();

				playBoard.removeHint();

				float x = (e.getX()-2-playBoard.getOffX())/(playBoard.tileSize+1);
				float y = (e.getY()-4-playBoard.getOffY())/(playBoard.tileSize+1);

				float pressX = e.getX()-playBoard.getOffX();
				float pressY = e.getY()-playBoard.getOffY();

				if(pressY > MainActivity.screenHeight*5/7){
					if(pressX>350){
						flagMode = false; //TODO
						Log.v("Flagged On: ", ""+e.getX()+ " "+e.getY());
					}
					else{
						flagMode = false;
						Log.v("Flagged Off: ", ""+e.getX()+ " "+e.getY());
					}
					y = pressY;
					x = pressX;
					return true;
				}

				if ((x >= playBoard.getWidth() || y >= playBoard.getHeight()))
					return true;

				if (e.getY() < 0)
					return true;

				//playBoard.add((int)x, (int)y);
				if(playBoard.isUntouched((int)x,(int)y))
				{
					playBoard.setPressedCords((int)x, (int)y);
					playBoard.setPressed(true);
					invalidate();
				}
			}
			else if(e.getAction() == MotionEvent.ACTION_UP)
			{//released
				//Log.v("Released here: ", ""+e.getX()+ " "+e.getY());
				if(!dragging){
					//				float x = (e.getX()-50-playBoard.getOffX());
					//				float y = (e.getY()-50-playBoard.getOffY());


					x = (int) playBoard.getPressedCords()[0];
					y = (int) playBoard.getPressedCords()[1];
					//
					//				if (e.getY() < 0)
					//					return true;
					//
					//				if (x >= playBoard.getWidth() || y >= playBoard.getHeight())
					//					return true;


					if(playBoard.isValid((int)x, (int)y)){

						if(gameOver)
							resetGame();

						else if(!playBoard.isOpen((int)x, (int)y)&&!flagMode)
							playBoard.open((int)x, (int)y);
						else if(!flagMode)
							playBoard.fastClick((int)x, (int)y);

						if(!gameOver()&&flagMode){

							playBoard.markFlagged((int)x, (int)y);
							Log.v("Flagged here: ", ""+e.getX()+ " "+e.getY());

						}
						if(playBoard.lose){

							bombAnimation();

						}
					}
					playBoard.setPressed(false);
					invalidate();
				}
				else
					dragging = false;
			}

			else
			{

				if(playBoard.getZoom()>-5)
				{
					float x = (e.getX());
					float y = (e.getY());

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

	public boolean gameOver(){

		if(playBoard.getWin() || playBoard.getLose())
		{
			gameOver = true;

			playBoard.endTimer();
		}		
		return gameOver;
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