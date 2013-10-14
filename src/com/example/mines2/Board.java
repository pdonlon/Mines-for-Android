package com.example.mines2;

import java.util.Timer;
import java.util.TimerTask;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Point;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Shader.TileMode;
import android.graphics.Typeface;
import android.util.Log;


public class Board {

	//		  	size	mines	opened
	//	beg 	8x8 	10		54
	//	med 	16x16 	40		216
	//	exp 	30x16 	99		381

	static Typeface tf;
	
	boolean doneAnimating = true;
	DrawPanel game;
	CheckList pressed;
	CheckList bombs;
	CheckList zeros;
	CheckList fast;
	Mine board[][];
	Thread t;
	Thread f;

	int width; 
	int height;

	int flagCount;
	int unsafeBombCount;
	int zeroCount;
	int fastCount;

	int flagLimit;
	int totalBombs;
	int totalBoxes;

	int startX;
	int startY;

	int tileSize = 80;
	boolean win = false;
	boolean lose = false;

	boolean firstTurn = true;
	boolean touchedBomb = false;
	boolean speedTrick = false;

	boolean checkBoard = false; 
	boolean showHint = false; 
	boolean hintColorYellow = false;
	boolean showCheck = false;
	boolean questionMarks = false;
	boolean compactMode = false;

	int timeCounter;

	int windowSizeY = 1100;

	Timer timer;
	TimerTask tt;

	//Font font = new Font("SANS_SERIF", Font.BOLD,10);
	//Font compactFont = new Font("SANS_SERIF", Font.BOLD,8);

	public Mine[][] getBoard(){

		return board;
	}

	public Board(int width, int height, DrawPanel g){

		game = g;
		this.width = width;
		this.height = height;
		bombs = new CheckList();

		tf = Typeface.create("Font Name",Typeface.BOLD);
		
		startup();
	}

	public int getWidth(){

		return width;
	}

	public void setWidth(int a){

		width = a;
	}

	public int getHeight(){

		return height;
	}

	public void setHeight(int a){

		height = a;
	}

	public int getTotalBombs(){

		return totalBombs;
	}

	public void setTotalBombs(int a){

		totalBombs = a;
	}

	public int getTotalBoxes(){

		return totalBoxes;
	}

	public boolean getTouchedBomb(){

		return touchedBomb;
	}

	public int getFlagCount(){ //Let's play access flags

		return flagCount;
	}

	public boolean getWin(){

		return win;
	}

	public boolean getLose(){

		return lose;
	}

	public int getWindowX(){

		int windowX = (tileSize+1)*getWidth()+1;

		return windowX;
	}

	public int getWindowY(){

		int windowY = (tileSize+1)*getHeight()+80;

		return windowY;
	}

	public boolean getFirstTurn(){

		return firstTurn;
	}

	public int getStartX(){

		return startX;
	}

	public int getStartY(){

		return startY;
	}

	public void setUp(){

		flagCount = totalBombs;
		unsafeBombCount = totalBombs;
		flagLimit=flagCount;

	}

	public void check(){

		checkBoard = true;

	}

	public boolean doneAnimating()
	{
		return doneAnimating;
	}

	public void setDoneAnimating(boolean a)
	{
		doneAnimating = a;
	}

	public boolean checkBoard(){

		boolean correct = true;		

		for(int y =0; y<height; y++){
			for(int x=0; x<width; x++){

				if(board[x][y].isFlagged()&&!board[x][y].isBomb())
					correct = false;
			}
		}

		return correct;

	}

	public boolean alreadyThere(int x, int y){

		return pressed.alreadyHead(x, y);

	}

	public void replace(int x, int y){

		pressed.replaceHead(x, y);

	}

	public void add(int x, int y){

		pressed = new CheckList();
		pressed.enque(x, y);

	}

	public void press(int x, int y){

		board[x][y].setPressed(true);
	}

	public void resetPressed(){

		try{
			if(pressed.getHead()!=null)
				board[pressed.getHead().getXCord()][pressed.getHead().getYCord()].setPressed(false);
		}
		catch(Exception e){

		}
	}

	public int getUnsafeBombCount(){

		return unsafeBombCount;
	}

	public void wipeBoard(){

		for(int y=0; y<height; y++ ){
			for(int x=0; x<width; x++){

				board[x][y] = new Mine (false, 0, false, false, false, false, false, false);

			}
		}

	}

	public void startup(){

		bombs.empty();

		board = new Mine[width][height];

		totalBoxes = width*height;

		flagCount = totalBombs;
		unsafeBombCount = totalBombs;
		flagLimit=flagCount;

		timeCounter = 0;


		win = false;
		lose = false;

		firstTurn = true;
		touchedBomb = false;

	}

	public boolean flagged(int x, int y){

		boolean flag = false;
		if(board[x][y].isFlagged())
			flag = true;

		return flag;

	}

	public void open(int x, int y){ //Play can't access Mines so it is a double method

		openBox(x,y);

	}

	public boolean bomb(int x, int y){ //Play can't access Mines so it is a double method

		return board[x][y].isBomb();
	}

	public void initializeBoard(){

		for(int y=0; y<height; y++){
			for(int x=0; x<width; x++){

				board[x][y] = new Mine (false, 0, false, false, false, false, false, false); 

			}
		}


	}



	public void setStartXandY(int x, int y){

		startX = x;
		startY = y;

		placeBombs();
		placeBombsSurrounding();


		timer = new Timer();

		timer.scheduleAtFixedRate(new TimerTask() {
			@Override
			public void run() {
				timeCounter++;
				game.mactivity.runOnUiThread(new Runnable() {
					public void run() {

						game.invalidate();

					}
				});
			}

		}, 0, 1000);
	}


	public void endTimer()
	{
		if(timer != null)
		{
			timer.cancel();
			timer.purge();
		}
	}

	public void placeBombs(){

		//bombs = new CheckList();

		int count = totalBombs;

		while(count > 0){
			int rand1 = (int) (Math.random() * width); 
			int rand2 = (int) (Math.random() * height); //to get the y (rectangle ones)

			if(!board[rand1][rand2].isBomb() && notSurroundingStart(rand1,rand2)){
				board[rand1][rand2].setBomb(true);
				bombs.enque(rand1,rand2);
				count--;
			}
		}
	}

	public void placeBombsSurrounding(){

		for(int y=0; y<height; y++){
			for(int x=0; x<width; x++){

				if(board[x][y].isBomb()){

					for(int j=-1; j<2; j++){			
						for(int i=-1; i<2; i++){

							if(isValid(x+j,y+i)&& !board[x+j][y+i].isBomb())
								board[x+j][y+i].addOneBombSurrounding();
						}
					}
				}
			}
		}
	}

	public boolean isValid(int x, int y){

		boolean valid = false;

		try{
			if(board[x][y]!=null)
				valid = true;
		}
		catch(Exception e){

		}
		return valid;
	}

	public boolean isOpen(int x,int y){

		boolean open = false;

		if(board[x][y].isOpened())
			open = true;

		return open;
	}

	public boolean unopenedAround(int x, int y){

		boolean unopened = false;

		for(int i=-1; i<2; i++){			
			for(int j=-1; j<2; j++){

				if(isValid(x+j,y+i) && !board[x+j][y+i].isOpened())
					unopened = true;

			}
		}

		return unopened;
	}

	public boolean unopenedAndUnflaggedAround(int x, int y){

		boolean unopened = false;

		for(int i=-1; i<2; i++){			
			for(int j=-1; j<2; j++){

				if(isValid(x+j,y+i) && !board[x+j][y+i].isOpened() && !board[x+j][y+i].isFlagged() )
					unopened = true;

			}
		}

		return unopened;
	}

	public void fastClick(int x, int y){

		fast = new CheckList();
		fastCount =0;

		if(flagsSurrounding(x,y) == board[x][y].getBombsSurrounding()){

			for(int i=-1; i<2; i++){			
				for(int j=-1; j<2; j++){

					if(isValid(x+j,y+i) && !board[x+j][y+i].isOpened() && !board[x+j][y+i].isFlagged()){


						if(board[x+j][y+i].isBomb()){
							bombs.remove(x+j,y+i);
							lose = true;
							endOfGame();
						}
						fast.enque(x+j, y+i);
						fastCount++;

					}
				}
			}
		}
		fastAnimation();
		checkWin();
	}

	public void fastAnimation(){

		f = new Thread( new Runnable(){
			public void run(){

				int acceleration = 25;

				while(fastCount>0){
					try {
						Thread.sleep(acceleration);
					} catch(InterruptedException ex) {
						Thread.currentThread().interrupt();
					}

					tileOpen();
					fastCount--;
				}
			}
		});

		f.start();

	}

	public void tileOpen(){

		openBox(fast.getValues()[0],fast.getValues()[1]);

		fast.deque();

		game.mactivity.runOnUiThread(new Runnable(){ public void run() {
			game.invalidate();}});	
	}

	public void finishFlagging(){

		for(int y=0; y<height; y++){
			for(int x=0; x<width; x++){

				if(!board[x][y].isOpened()&&!board[x][y].flagged)
					board[x][y].setFlagged(true);
			}
		}

		flagCount = 0; 

	}

	public void openZeros(int x, int y){

		int tempX = x;
		int tempY = y;

		zeros = new CheckList();
		CheckList check = new CheckList();
		check.enque(x,y);

		FullList full = new FullList();
		full.add(x,y);

		while (check.getHead()!=null){

			check.deque();

			for(int i=-1; i<2; i++){			
				for(int j=-1; j<2; j++){

					if(isValid(tempX+i,tempY+j)&& 
							!full.alreadyInFullList(tempX+i, tempY+j)&&
							!board[tempX+i][tempY+j].isOpened()&&
							!board[tempX+i][tempY+j].isFlagged()){

						zeros.enque(tempX+i,tempY+j);
						zeroCount++;
						;

						full.add(tempX+i, tempY+j); //add coordinates to not repeat

						if((board[tempX+i][tempY+j].getBombsSurrounding()==0)){ 

							check.enque(tempX+i,tempY+j);

						}
					}
				}

			}
			if(check.getHead()!=null){

				tempX = check.getValues()[0];
				tempY = check.getValues()[1];
			}
		}
	}

	public void tileAnimation(){

		//		runOnUiThread(new Runnable(){
		//		t = new Thread( new Runnable()
		t =  new Thread(new Runnable(){
			public void run(){

				doneAnimating = false;

				int acceleration = 2;

				while(zeroCount>0){

					try {
						Thread.sleep(acceleration);
					} catch(InterruptedException ex) {
						Thread.currentThread().interrupt();
					}

					tileTurn();

					zeroCount--;
				}
				doneAnimating = true;
			}
		});

		t.start();
	}

	public void tileTurn(){
		try{
			board[zeros.getValues()[0]][zeros.getValues()[1]].setOpened(true);

			zeros.deque();
		}
		catch(Exception e){

		}

		game.mactivity.runOnUiThread(new Runnable(){ public void run() {
			game.invalidate();}});
	}

	public void markFlagged(int x, int y){

		if(!board[x][y].opened){
			if(board[x][y].isFlagged()){

				removeFlag(x,y);
				if(questionMarks)
					questionMark(x,y);
				else
					removeQuestionMark(x,y);

			}

			else if(board[x][y].isQuestionMarked()&& questionMarks){

				removeQuestionMark(x,y);

			}

			else{ //flagCount>0 && 

				board[x][y].setFlagged(true);

				flagCount--;
			}
		}

	}

	public boolean notSurroundingStart(int x, int y){

		boolean notSurrounded = true;

		for(int i=-1; i<2; i++){
			for(int j=-1; j<2; j++){

				if(x+j==startX && y+i==startY){

					notSurrounded = false;
					break;
				}

			}
			if(!notSurrounded)
				break;
		}

		return notSurrounded;
	}

	public void removeFlag(int x, int y){

		if(flagCount<flagLimit){

			board[x][y].setFlagged(false);

			flagCount++;


		}
	}

	public void setQuestionMarks(boolean a){

		questionMarks = a;
	}

	public boolean questionMarksEnabled(){

		return questionMarks;

	}

	public void questionMark(int x, int y){

		board[x][y].setQuestionMarked(true);

	}

	public void removeQuestionMark(int x, int y){

		board[x][y].setQuestionMarked(false);
	}

	public boolean compactModeEnabled(){

		return compactMode;

	}

	public void setCompactMode(boolean a){

		compactMode = a;
	}

	public void setTileSize(int a){

		tileSize = a;
	}

	public int flagsSurrounding(int x, int y){

		int flags = 0;

		for(int i=-1; i<2; i++){			
			for(int j=-1; j<2; j++){

				if(isValid(x+j,y+i) && !board[x+j][y+i].isOpened()){

					if(board[x+j][y+i].isFlagged())
						flags++;
				}
			}
		}
		return flags;
	}


	public int unopenedSurrounding(int x, int y){

		int unopened = 0;

		for(int i=-1; i<2; i++){			
			for(int j=-1; j<2; j++){

				if(isValid(x+j,y+i) && !board[x+j][y+i].isOpened()){

					if(!board[x+j][y+i].isOpened())
						unopened++;
				}
			}
		}
		return unopened;
	}


	public int[] getHint(){

		int xHint =-1; 
		int yHint =-1;

		for(int y=0; y<height; y++){
			for(int x=0; x<width; x++){

				Mine b = board[x][y];

				if(b.isOpened() && b.getBombsSurrounding()>0)
				{
					if (flagsSurrounding(x,y)== b.getBombsSurrounding()&&unopenedAndUnflaggedAround(x, y)
							|| ((unopenedSurrounding(x,y) == board[x][y].getBombsSurrounding())
									&& flagsSurrounding(x,y) != board[x][y].getBombsSurrounding())){
						xHint = x;
						yHint = y;

						if(flagsSurrounding(x,y)== b.getBombsSurrounding()&&unopenedAndUnflaggedAround(x, y))
							hintColorYellow = true;
						else
							hintColorYellow = false;
					}
				}
			}
		}

		int[] hint = {xHint, yHint};
		return hint;

	}

	public void hint(){

		showHint = true;

	}

	public void removeHint(){

		showHint = false;
	}

	public void setCheck(boolean a)
	{
		showCheck = a;
	}

	public void openBomb(){

		if(board[bombs.getValues()[0]][bombs.getValues()[1]].isBomb())
			board[bombs.getValues()[0]][bombs.getValues()[1]].setOpened(true);

		//		else
		//			board[bombs.getValues()[0]][bombs.getValues()[1]].setWrong(true);

		bombs.deque();


	}

	public boolean isEmpty(){

		boolean empty = false;

		try{
			if(pressed.getHead()==null)
				empty = true;
		}
		catch(Exception e){

		}

		return empty;
	}


	public void openBox(int x, int y){

		if(t!=null){

			try {
				t.join();
			} catch (InterruptedException e) {

				e.printStackTrace();
			}
		}
		if(board[x][y].isFlagged())
			removeFlag(x,y);

		else 
			if(firstTurn){

				setStartXandY(x,y);

				firstTurn = false;
				openBox(x,y);

			}
			else{

				if(!board[x][y].isOpened()){

					board[x][y].setOpened(true);

					if(board[x][y].isBomb()){

						touchedBomb = true;
						lose = true;

						bombs.remove(x,y); //so it won't print twice
						bombs.enque(x, y); //first to print

						endOfGame();


					}

					else if(board[x][y].getBombsSurrounding()==0){
						openZeros(x, y);

						// TODO this crashes and shouldn't instead should animate and shit
						tileAnimation();

					}
					else;
				}
			}
		checkWin();
	}

	void checkWin(){

		if(getOpenedBoxCount() == totalBoxes - totalBombs){
			win = true;
			if(flagCount >0){
				finishFlagging();
			}

		}

	}

	public int getOpenedBoxCount(){

		int opened = 0;

		for(int y=0; y<height; y++){
			for(int x=0; x<width; x++){

				if(board[x][y].isOpened())
					opened++;
			}
		}

		return opened;
	}

	public void endOfGame(){

		for(int i=0; i<height; i++){
			for(int k=0; k<width; k++){



				if(board[k][i].isFlagged()&&board[k][i].isBomb()){
					bombs.remove(k,i);
					//					unsafeBombCount--;
				}

				else if(board[k][i].isFlagged()&&!board[k][i].isBomb()){
					board[k][i].setWrong(true);
				}

			}
		}
	}

	public boolean gameOver(){

		boolean gameOver = false;

		if(lose || win)
			gameOver = true;

		return gameOver;
	}

	public String gameOverMessage(){

		String gameOver;

		if(win)
		{
			if(!compactMode)
				gameOver = "Game Over! You win! Time: "+timeCounter; //timer*1000;
			else
				gameOver = "Game over you win! Time: "+timeCounter; //timer*1000;
		}
		else
		{
			if(!compactMode)
				gameOver = "Game Over! You Lose! "+timeCounter;
			else
				gameOver = "Game over you lose! Time: "+timeCounter; //timer*1000;
		}

		return gameOver;
	}


	public void paintBoard(Canvas g){


		//		Paint pgray = new Paint();
		//		pgray.setColor(android.graphics.Color.DKGRAY);
		//		//g.drawRect(0, 0, (tileSize)*getWidth(), (tileSize*getHeight()), pgray);


		Paint black = new Paint();
		black.setColor(Color.BLACK);
		
		Paint background = new Paint();
		background.setColor(Color.LTGRAY);

		Paint gray = new Paint();
		gray.setColor(Color.GRAY);
		Paint darkGray = new Paint();
		darkGray.setColor(Color.argb(255, 100, 100, 100));
		Paint thickDarkGray = new Paint();
		thickDarkGray.setColor(Color.argb(255, 100, 100, 100));
		Paint lightGray = new Paint();
		lightGray.setColor(Color.argb(255, 170, 170, 170));
		
		int gap = tileSize/6; //originally 15
		
		Paint paint = new Paint();
		paint.setColor(Color.BLACK);
		paint.setTypeface(tf);
		paint.setTextSize(30);
		
		if(speedTrick)
			g.drawText("", 1, 1, paint);
		else
			speedTrick = true;

		int[] xArray = new int[3];
		int[] yArray = new int[3];

		int ySpacing = 0; 

		for(int y=0; y<height; y++){

			int xSpacing = 0;

			for(int x=0; x<width; x++){

				if(!board[x][y].isOpened()&&!board[x][y].isWrong()){

					// set width of thick cheese lines
					thickDarkGray.setStrokeWidth(15);				

							// draw background square
							g.drawRect(xSpacing, ySpacing, tileSize + xSpacing, tileSize + ySpacing, darkGray);

							// draw cheese rectangles
							g.drawRect(xSpacing, ySpacing, gap + xSpacing, tileSize + ySpacing, lightGray);
							g.drawRect(xSpacing, ySpacing, tileSize + xSpacing, gap + ySpacing, lightGray);

							// draw cheese lines
							g.drawLine((gap/3) + xSpacing, tileSize+(gap/3) + ySpacing, tileSize+5 + xSpacing, 5 + ySpacing, thickDarkGray);

							// draw inner square
							g.drawRect(gap + xSpacing, gap + ySpacing, tileSize-gap + xSpacing, tileSize-gap + ySpacing, gray);

						
					
					// cover up excess with white triangles
					//g.drawRect((width+1)*100, 100, (width+1)*100 + 20, (height+1)*100, background);
					//g.drawRect(100, (height+1)*100, (width+1)*100, (height+1)*100 + 20, background);

					// gradient stuff
//					int color1 = Color.argb(0, 0, 0, 0);
//					int color2 = Color.argb(100, 0, 0, 0);
//
//					
//					Shader shader = new LinearGradient(0, 0, (width)*tileSize, (height)*tileSize, color1, color2, TileMode.CLAMP);
//					//Paint paint = new Paint(); 
//					paint.setShader(shader); 
//					
//					g.drawRect(new RectF(0, 0, (width)*tileSize, (height)*tileSize), paint); 
					
//					Paint lightGray = new Paint();
//					lightGray.setColor(android.graphics.Color.LTGRAY);
//					lightGray.setStyle(Paint.Style.FILL_AND_STROKE);
//
//					Paint darkGray = new Paint();
//					darkGray.setColor(android.graphics.Color.DKGRAY);
//					darkGray.setStyle(Paint.Style.FILL_AND_STROKE);
//					//lightGray.setStrokeWidth(3);
//					g.drawRect(xSpacing,  ySpacing, xSpacing+tileSize, ySpacing+tileSize, darkGray);
//
//					g.drawLine(xSpacing,  ySpacing, xSpacing+tileSize, ySpacing+tileSize, lightGray);
//					g.drawLine(xSpacing+tileSize, ySpacing, xSpacing,  ySpacing+tileSize, lightGray);

					
					
//					paint.setColor(Color.GRAY);
//					paint.setStyle(Paint.Style.FILL);
//					//g.drawRect(xSpacing+4, ySpacing+4, (tileSize)+(xSpacing), (tileSize)+(ySpacing),paint);
//					g.drawRect(xSpacing+tileSize/8, ySpacing+tileSize/8, (tileSize)+(xSpacing)-tileSize/8, (tileSize)+(ySpacing)-tileSize/8,paint);

				}

				xSpacing+=(tileSize);
			}
			ySpacing+=(tileSize);
		}

		int color1 =Color.argb(128,140,140,140);
		int color2 = Color.argb(128,39,39,39);
		int color3 = Color.argb(127,200,200,200);;

		//		Graphics2D g2d = (Graphics2D)g;
		//		GradientPaint gp = new GradientPaint(0, 0, color1, getWindowX(), getWindowY()-78, color2);
		//		g2d.setPaint(gp);

		paint.setStyle(Paint.Style.FILL);
		//g.drawRect( 0, 0, getWindowX(), getWindowY()-78,paint);	#1

		//g2d.fillRect(xSpacing+1, ySpacing+1, (tileSize), (tileSize));

		ySpacing =0;

		for(int y=0; y<height; y++){

			int xSpacing = 0;

			for(int x=0; x<width; x++){

				paint.setColor(board[x][y].determineColor());

				if(!board[x][y].isOpened()){

					if(board[x][y].isWrong()){ //draws X					
						paint.setColor(color1);
						g.drawRect(xSpacing+1, ySpacing+1, (tileSize+1)+xSpacing+1, (tileSize+1)+ySpacing+1,paint);
						paint.setColor(Color.GRAY);
						g.drawRect(xSpacing+1, ySpacing+1, (tileSize)+xSpacing+1, (tileSize)+ySpacing+1,paint);
						paint.setColor(Color.WHITE);
						//g.setFont(font);
						if(compactMode)
							g.drawText("X", xSpacing+8, ySpacing+17,paint);
						else
							g.drawText("X", xSpacing+11, ySpacing+19,paint);
					}

					else if(board[x][y].isFlagged()){

						if(compactMode){
							xArray[0] = xSpacing+8; //top left
							yArray[0] = ySpacing+6;

							xArray[1] = xSpacing+17; //top mid
							yArray[1] = ySpacing+9;

							xArray[2] = xSpacing+7; //bottom right
							yArray[2] = ySpacing+13;
						}

						else{
							xArray[0] = xSpacing+10; //top left
							yArray[0] = ySpacing+8;

							xArray[1] = xSpacing+23; //top mid
							yArray[1] = ySpacing+13;

							xArray[2] = xSpacing+10; //bottom right
							yArray[2] = ySpacing+16;
						}

						paint.setColor(Color.RED);
						//g.fillPolygon(xArray,yArray, 3);
						paint.setColor(color3);
						//g.fillPolygon(xArray,yArray, 3);
						paint.setColor(Color.BLACK);
						if(compactMode)
						{
							g.drawLine(xSpacing+7, ySpacing+6, xSpacing+7, ySpacing+17,paint);
							g.drawLine(xSpacing+8, ySpacing+6, xSpacing+8, ySpacing+17,paint);
						}
						else{
							g.drawLine(xSpacing+9, ySpacing+8, xSpacing+9, ySpacing+22,paint);
							g.drawLine(xSpacing+10, ySpacing+8, xSpacing+10, ySpacing+22,paint);

						}
					}

					else if(board[x][y].beingPressed()){
						paint.setStyle(Paint.Style.FILL);
						g.drawRect(xSpacing, ySpacing, (tileSize)+xSpacing, (tileSize)+ySpacing,gray);
					}

					else if(board[x][y].isQuestionMarked()){
						paint.setColor(Color.WHITE);
						//g.setFont(font);
						if(compactMode)
							g.drawText("?", xSpacing+8, ySpacing+16,paint);
						else
							g.drawText("?", xSpacing+11, ySpacing+19,paint);
					}

				}
				else{

					if(board[x][y].isBomb()){

							paint.setStyle(Style.FILL);
							paint.setColor(Color.RED);
							g.drawRect(xSpacing, ySpacing, (tileSize)+xSpacing, (tileSize)+ySpacing,paint);
							paint.setColor(Color.BLACK);
							g.drawCircle(xSpacing+(tileSize/2), ySpacing+(tileSize/2), (tileSize/4),paint);

							paint.setStrokeWidth(5);
							paint.setStyle(Style.STROKE);
							g.drawLine(xSpacing+(tileSize/4), ySpacing+(tileSize/4), xSpacing+tileSize-(tileSize/4), ySpacing+tileSize-(tileSize/4),paint); //top left/bottom right
							g.drawLine(xSpacing+(tileSize/8), ySpacing+(tileSize/2), xSpacing+tileSize-(tileSize/8), ySpacing+(tileSize/2),paint);//mid 
							g.drawLine(xSpacing+tileSize-(tileSize/4), ySpacing+(tileSize/4), xSpacing+(tileSize/4), ySpacing+tileSize-(tileSize/4),paint);//top right/bottom left
							g.drawLine(xSpacing+(tileSize/2), ySpacing+(tileSize/8), xSpacing+(tileSize/2), ySpacing+tileSize-(tileSize/8),paint);//top/down

							paint.setColor(color1);
							paint.setStyle(Paint.Style.STROKE); 
							g.drawRect(xSpacing, ySpacing, (tileSize)+xSpacing, (tileSize)+ySpacing,paint);
							paint.setColor(Color.GRAY);
							paint.setStrokeWidth(3);
							g.drawRect(xSpacing, ySpacing, (tileSize)+xSpacing, (tileSize)+ySpacing,paint);
							
						}
					else if(board[x][y].getBombsSurrounding()==0)
					{
						paint.setColor(color1);
						paint.setStyle(Paint.Style.STROKE);
						g.drawRect(xSpacing, ySpacing, (tileSize)+xSpacing, (tileSize)+ySpacing,paint);
						paint.setColor(Color.GRAY);
						paint.setStrokeWidth(3);
						g.drawRect(xSpacing, ySpacing, (tileSize)+xSpacing, (tileSize)+ySpacing,paint);

					}

					else{
						paint.setStyle(Paint.Style.FILL);
						g.drawRect(xSpacing, ySpacing, (tileSize)+xSpacing, (tileSize)+ySpacing,paint);
						paint.setColor(color3);
						g.drawRect(xSpacing, ySpacing, (tileSize)+xSpacing, (tileSize)+ySpacing,paint);
						paint.setColor(Color.WHITE);
						//g.setFont(font);
//						if(compactMode)
//							g.drawText(""+board[x][y].getBombsSurrounding(), xSpacing+((tileSize*2)/3), ySpacing+((tileSize*2)/3),paint);
//						else
						g.drawText(""+board[x][y].getBombsSurrounding(), xSpacing+((tileSize*2)/5), ySpacing+((tileSize*2)/3),paint);
						paint.setColor(Color.GRAY);
						paint.setStyle(Paint.Style.STROKE);
						g.drawRect(xSpacing, ySpacing, (tileSize)+xSpacing, (tileSize)+ySpacing,paint);

						paint.setColor(color1);
						paint.setStyle(Paint.Style.STROKE); 
						g.drawRect(xSpacing, ySpacing, (tileSize)+xSpacing, (tileSize)+ySpacing,paint);
						paint.setColor(Color.GRAY);
						paint.setStrokeWidth(3);
						g.drawRect(xSpacing, ySpacing, (tileSize)+xSpacing, (tileSize)+ySpacing,paint);
					}

				}

				xSpacing += (tileSize);
			}
			ySpacing+= (tileSize);
		}

		paint.setColor(Color.GRAY);
		paint.setStyle(Paint.Style.STROKE);
		g.drawRect(0, getWindowY()-79, getWindowX(), 22,paint);
		paint.setColor(Color.WHITE);
		paint.setStyle(Paint.Style.FILL);
		g.drawRect(0, getWindowY()-78, getWindowX(), 21,paint);
		paint.setColor(Color.BLACK);
		//g.setFont(new Font("Arial", Font.BOLD,13)); // like the little mermaid
		g.drawText("Flags: "+getFlagCount(), 25, getWindowY()-63,paint);
		g.drawText("Time: "+timeCounter, getWindowX()-75, getWindowY()-63,paint);

		g.drawText("___________________________________________________________________________________________________________________________________________________", 
				0, windowSizeY-50,paint);

		g.drawText("Open Mode: ", 60, windowSizeY,paint);
		g.drawText("|: ", 350, windowSizeY,paint);
		g.drawText("Flag Mode: ", getWindowX()+40, windowSizeY,paint);

		if(showCheck){

			if(checkBoard())
				paint.setColor(Color.argb(80, 0, 255, 0));

			else
				paint.setColor(Color.argb(80, 255, 0, 0));

			paint.setStyle(Paint.Style.FILL);
			g.drawRect(0, 0, getWindowX(), getWindowY()-78,paint);

		}

		if(showHint){
			getHint();
			int color = Color.argb(255,255,0,0);
			if(hintColorYellow)
				color = Color.argb(255,255,255,0);

			paint.setColor(color);
			//			g2d.setStroke(new BasicStroke(3));
			paint.setStyle(Paint.Style.STROKE);
			if(!compactMode)
				g.drawRect(getHint()[0]*(tileSize+1)+2, getHint()[1]*(tileSize+1)+2, 25, 25,paint);
			else

				g.drawRect(getHint()[0]*(tileSize+1)+2, getHint()[1]*(tileSize+1)+2, 20, 20,paint);
		}

		int colors1 = Color.argb(0, 0, 0, 0);
		int colors2 = Color.argb(100, 0, 0, 0);

		
		Shader shader = new LinearGradient(0, 0, (width)*tileSize, (height)*tileSize, colors1, colors2, TileMode.CLAMP);
		//Paint paint = new Paint(); 
		paint.setShader(shader); 
		
		g.drawRect(new RectF(0, 0, (width)*tileSize, (height)*tileSize), paint);
		
		if(gameOver()){
			paint.setColor(Color.WHITE);
			paint.setStyle(Paint.Style.STROKE);
			g.drawRect(0, getWindowY()-78, getWindowX(), 21,paint);
			paint.setColor(Color.BLACK);
			g.drawText(gameOverMessage(), 2, getWindowY()-63,paint);
		}
		
		//g.setColor(Color.);
		//getwindowy -36
	}
}


