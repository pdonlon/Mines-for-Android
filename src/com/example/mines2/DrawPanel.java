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
	public static boolean flagMode;
	MainActivity mactivity;

	Context ctx;

	public DrawPanel(Context context, MainActivity mactivity) {

		super(context);      
		setOnTouchListener(this);
		ctx = context;
		this.mactivity = mactivity;


		this.difficulty = difficulty;

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
		// check e.getAction() == MotionEvent.ACTION_DOWN
		if (e.getAction() == MotionEvent.ACTION_DOWN){ //pressed
			//Log.v("Pressed here: ", ""+e.getX()+ " "+e.getY()); //takes label and text
			playBoard.removeHint();

			int x = ((int) e.getX()-2)/(playBoard.tileSize+1);
			int y = ((int) e.getY()-4)/(playBoard.tileSize+1);

			int pressX = (int) e.getX();
			int pressY = (int) e.getY();

			if(pressY > playBoard.windowSizeY-49){
				if(pressX>350){
					flagMode = true;
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

			playBoard.add(x, y);
			playBoard.press(x,y);
			invalidate();

		}
		else if(e.getAction() == MotionEvent.ACTION_UP)
		{//released
			//Log.v("Released here: ", ""+e.getX()+ " "+e.getY());
			x = ((int) e.getX()-50);
			y = ((int) e.getY()-50);
			invalidate(); //repaint()

			if(!playBoard.isEmpty())
				playBoard.resetPressed();

			int x = ((int)e.getX()-2)/(playBoard.tileSize+1);
			int y = ((int)e.getY()-4)/(playBoard.tileSize+1);

			if (e.getY() < 0)
				return true;

			if (x >= playBoard.getWidth() || y >= playBoard.getHeight())
				return true;


			if(playBoard.isValid(x, y)){

				if(gameOver)
					resetGame();

				else if(!playBoard.isOpen(x,y)&&!flagMode)
					playBoard.open(x, y);
				else if(!flagMode)
					playBoard.fastClick(x,y);

				if(!gameOver()&&flagMode){

					playBoard.markFlagged(x, y);
					Log.v("Flagged here: ", ""+e.getX()+ " "+e.getY());

				}

			}
			else

				if(playBoard.lose){

					bombAnimation();

				}
			invalidate();
		}

		else
		{
			//			Log.v("Dragging here: ", ""+e.getX()+ " "+e.getY());
			//			x = ((int) e.getX()-50);
			//			y = ((int) e.getY()-50);
			//			invalidate(); //repaint()

			int x = ((int) e.getX()-2)/(playBoard.tileSize+1);
			int y = ((int) e.getY()-4)/(playBoard.tileSize+1);

			if (x >= playBoard.getWidth() || y >= playBoard.getHeight())
				return true;

			invalidate();

			if(!playBoard.alreadyThere(x,y)&&playBoard.isValid(x, y)){
				playBoard.resetPressed();
				playBoard.replace(x, y);
				playBoard.press(x,y);
				invalidate();
			}
			invalidate();
		}
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

		Thread b;
		b = new Thread( new Runnable(){
			public void run(){

				int bombsLeft = playBoard.getTotalBombs()-1;

				while(bombsLeft>0){

					try {
						Thread.sleep(5);
					} catch(InterruptedException ex) {
						Thread.currentThread().interrupt();
					}

					explosion();

					bombsLeft--;
				}

			}
		});

		b.start();
	}

	public void explosion(){

		playBoard.openBomb();
		this.mactivity.runOnUiThread(new Runnable(){ public void run() {
			invalidate();}});	}

}