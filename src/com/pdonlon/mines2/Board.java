package com.pdonlon.mines2;

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
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;


public class Board {

	//		  	size	mines	opened
	//	beg 	8x8 	10		54
	//	med 	16x16 	40		216
	//	exp 	30x16 	99		381

	public static boolean pro = false;
	public static boolean readjust = false;

	static Typeface tf;

	static boolean doneAnimating = true;
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
	float diffX;
	float diffY;

	int flagLimit;
	int totalBombs;
	int totalBoxes;

	int startX;
	int startY;
	int zoom;

	float tileSize = 70;
	boolean win = false;
	boolean lose = false;

	boolean firstTurn = true;
	boolean touchedBomb = false;
	boolean speedTrick = false;
	boolean beingPressed = false;

	boolean checkBoard = false; 
	boolean showHint = false; 
	boolean hintColorYellow = false;
	boolean showCheck = false;
	boolean questionMarks = false;


	int timeCounter;

	int windowSizeY = 1100;
	float offX;
	float offY;

	Timer timer;
	TimerTask tt;

	int [] pressedCords = new int[2];

	int barHeight = 120;
	int actionAndStatus = -1;
	float realBarHeight;
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

		adjustTiles();
		//		game.startTimer();
		startup();
	}

	public static void proToggle(){

		pro = !pro;

	}

	public void readjust(){
		offX = 0;
		offY = 0;
		adjustTiles();
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

	public float getTileSize()
	{
		return tileSize;
	}

	public int getZoom()
	{
		return zoom;
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

	public void setWin(boolean a){

		win = a;
	}

	public boolean getLose(){

		return lose;
	}

	public void setLose(boolean a){

		lose = a;
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

	public float getOffX()
	{
		return offX;
	}

	public void setOffX(float a)
	{
		offX = a;
	}

	public float getDiffX()
	{
		return diffX;
	}

	public void setDiffX(float a)
	{
		diffX = a;
	}

	public float getOffY()
	{
		return offY;
	}

	public void setOffY(float a)
	{
		offY = a;
	}

	public float getDiffY()
	{
		return diffY;
	}

	public void setDiffY(float a)
	{
		diffY = a;
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

	public boolean isUntouched(int x, int y)
	{
		boolean untouched = false;
		try{
			if(!board[x][y].isOpened() && !board[x][y].isFlagged() && !board[x][y].isQuestionMarked() && !board[x][y].isWrong())
				untouched = true;
		}
		catch(Exception e){

		}
		return untouched;
	}

	public boolean alreadyThere(int x, int y){

		if(pressed!= null)
			return pressed.alreadyHead(x, y);

		return true;

	}

	public void replace(int x, int y){

		pressed.replaceHead(x, y);

	}

	public void add(int x, int y){

		pressed = new CheckList();
		pressed.enque(x, y);

	}

	public void setPressedCords(int a, int b)
	{
		pressedCords[0] = a;
		pressedCords[1] = b;

	}

	public int[] getPressedCords(){

		return pressedCords;  

	}

	public boolean beingPressed(){

		return beingPressed;
	}

	public void setPressed(boolean a){

		beingPressed = a;

	}

	public int getUnsafeBombCount(){

		return unsafeBombCount;
	}

	public void wipeBoard(){

		for(int y=0; y<height; y++ ){
			for(int x=0; x<width; x++){

				board[x][y] = new Mine (false, 0, false, false, false, false, false);

			}
		}

	}

	public void adjustTiles(){

		if (MainActivity.screenWidth < MainActivity.screenHeight)
			tileSize = MainActivity.screenWidth / width;
		else
			tileSize = (MainActivity.screenHeight-200) / height;

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

	public boolean isBomb(int x, int y)
	{
		if(board[x][y].isBomb())
			return true;
		else
			return false;
	}

	public boolean bomb(int x, int y){ //Play can't access Mines so it is a double method

		return board[x][y].isBomb();
	}

	public void initializeBoard(){

		for(int y=0; y<height; y++){
			for(int x=0; x<width; x++){

				board[x][y] = new Mine (false, 0, false, false, false, false, false); 

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
							game.setGameOver(true);
							endTimer();
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

		if(flagCount >=0){

			for(int y=0; y<height; y++){
				for(int x=0; x<width; x++){

					if(!board[x][y].isOpened()&&!board[x][y].flagged)
						board[x][y].setFlagged(true);
				}
			}

		}

		game.setGameOver(true);
		endTimer();

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

	//	public boolean isEmpty(){
	//
	//		boolean empty = false;
	//
	//		try{
	//			if(pressed.getHead()==null)
	//				empty = true;
	//		}
	//		catch(Exception e){
	//
	//		}
	//
	//		return empty;
	//	}


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
						game.setGameOver(true);
						endTimer();


					}

					else if(board[x][y].getBombsSurrounding()==0){
						openZeros(x, y);

						tileAnimation();

					}
					else;
				}
			}
		checkWin();
	}

	public void checkWin(){

		if(getOpenedBoxCount() == totalBoxes - totalBombs){
			win = true;
			//			if(flagCount >=0){
			finishFlagging();
			//}

		}
		checkBoard();

	}

	public boolean lost(){

		for(int y=0; y<height; y++){
			for(int x=0; x<width; x++){

				if(board[x][y].isBomb() && board[x][y].isOpened())
					return true;
			}
		}
		return false;
	}

	public int getOpenedBoxCount(){

		int opened = 0;

		for(int y=0; y<height; y++){
			for(int x=0; x<width; x++){

				if(board[x][y].isOpened()&&!board[x][y].isBomb())
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
					unsafeBombCount--;
				}

				else if(board[k][i].isFlagged()&&!board[k][i].isBomb()){
					board[k][i].setWrong(true);
				}

			}
		}
	}

	public void endOfGameSetWrong(){

		for(int i=0; i<height; i++){
			for(int k=0; k<width; k++){

				if(board[k][i].isFlagged()&&!board[k][i].isBomb()){
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

	public String gameOverMessage(){ //TODO

		String gameOver = "";
		//
		//		if(win)
		//		{
		//			if(!compactMode)
		//				gameOver = "Game Over! You win! Time: "+timeCounter; //timer*1000;
		//			else
		//				gameOver = "Game over you win! Time: "+timeCounter; //timer*1000;
		//		}
		//		else
		//		{
		//			if(!compactMode)
		//				gameOver = "Game Over! You Lose! "+timeCounter;
		//			else
		//				gameOver = "Game over you lose! Time: "+timeCounter; //timer*1000;
		//		}

		return gameOver;
	}

	public void zoomIn(float x, float y)
	{	
		if(tileSize*2 > 250)
			return;
		tileSize = tileSize*2;

		offX = -tileSize*x/2;
		offY = -tileSize*y/2;

		float difference;



		if(width*tileSize+offX <= MainActivity.screenWidth){
			difference = MainActivity.screenWidth - (width*tileSize+offX);
			offX = offX + difference/2;
		}

		if(height*tileSize+offY <= MainActivity.screenHeight){
			difference = MainActivity.screenHeight - (height*tileSize+offY);
			offY = offY + difference/2;
		}



		zoom++;

	}

	public void zoomOut(float x, float y){

		if(tileSize/2 < 20)
			return;

		tileSize = tileSize/2;

		offX = -tileSize/x;
		offY = -tileSize/y;

		float difference;

		if(width*tileSize+offX <= MainActivity.screenWidth){
			difference = MainActivity.screenWidth - (width*tileSize+offX);
			offX = offX + difference/2;
		}

		if(height*tileSize+offY <= MainActivity.screenHeight){
			difference = MainActivity.screenHeight - (height*tileSize+offY);
			offY = offY + difference/2;
		}

		zoom--;

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
		if(pro)
			gray.setColor(Color.argb(255, 255, 215, 0)); //gold - mid
		Paint darkGray = new Paint();
		darkGray.setColor(Color.argb(255, 100, 100, 100));
		if(pro)
			darkGray.setColor(Color.argb(255, 218, 165, 32)); //goldenrod - darkest
		Paint thickDarkGray = new Paint();
		thickDarkGray.setColor(Color.argb(255, 100, 100, 100));
		if(pro)
			thickDarkGray.setColor(Color.argb(255, 218, 165, 32)); //goldenrod - darkest
		Paint lightGray = new Paint();
		lightGray.setColor(Color.argb(255, 170, 170, 170));
		if(pro)
			lightGray.setColor(Color.argb(255, 240, 230, 140)); //khaki - lightest


		float gap = tileSize/6; //originally 15

		Paint paint = new Paint();
		paint.setColor(Color.BLACK);
		paint.setTypeface(tf);
		paint.setTextSize(tileSize/3);

		if(speedTrick)
			g.drawText("", 1, 1, paint);
		else
			speedTrick = true;

		//FAST DRAW
		g.drawRect(offX, offY, tileSize*width + offX, tileSize*height + offY, darkGray);

		thickDarkGray.setStrokeWidth(tileSize/6);				

		float ySpacing = offY; 

		for(int y=0; y<height; y++){

			float xSpacing = offX;

			for(int x=0; x<width; x++){

				if(!board[x][y].isOpened()&&!board[x][y].isWrong()){

					// draw cheese rectangles
					g.drawRect(xSpacing, ySpacing, gap + xSpacing, tileSize + ySpacing, lightGray);
					g.drawRect(xSpacing, ySpacing, tileSize + xSpacing, gap + ySpacing, lightGray);

					// draw cheese lines
					g.drawLine((gap/3) + xSpacing, tileSize+(gap/3) + ySpacing, tileSize+(gap/3) + xSpacing, (gap/3) + ySpacing, thickDarkGray);

					// draw inner square
					g.drawRect(gap + xSpacing, gap + ySpacing, tileSize-gap + xSpacing, tileSize-gap + ySpacing, gray);

				}

				else{
					paint.setColor(Color.LTGRAY);
					if(pro)
						paint.setColor(Color.argb(255, 240, 230, 140)); //khaki - lightest
					paint.setStyle(Paint.Style.FILL);
					g.drawRect(xSpacing, ySpacing, (tileSize)+xSpacing, (tileSize)+ySpacing,paint);
				}

				xSpacing+=(tileSize);
			}
			ySpacing+=(tileSize);
		}

		// cover up excess with white triangles
		g.drawRect((width)*tileSize+offX, 0+offY, (width)*tileSize+tileSize/5+offX, (height)*tileSize+offY, background);
		g.drawRect(0+offX, (height)*tileSize+offY, (width)*tileSize+offX, (height)*tileSize+tileSize/5+offY, background);

		int color1 =Color.argb(128,140,140,140);
		int color2 = Color.argb(128,39,39,39);
		int color3 = Color.argb(127,200,200,200);;


		int colors1 = Color.argb(0, 0, 0, 0);

		int colors2 = Color.argb(100, 0, 0, 0);
		if (pro)
			colors2 = Color.argb(0, 0, 0, 0);


		Shader shader = new LinearGradient(offX, offY, (width)*tileSize+offX, (height)*tileSize+offY, colors1, colors2, TileMode.CLAMP);
		//Paint paint = new Paint(); 
		paint.setShader(shader); 

		g.drawRect(new RectF(offX, offY, (width)*tileSize+offX, (height)*tileSize+offY), paint);

		paint.setShader(null);
		//		Graphics2D g2d = (Graphics2D)g;
		//		GradientPaint gp = new GradientPaint(0, 0, color1, getWindowX(), getWindowY()-78, color2);
		//		g2d.setPaint(gp);

		paint.setStyle(Paint.Style.FILL);
		//g.drawRect( 0, 0, getWindowX(), getWindowY()-78,paint);	#1

		//g2d.fillRect(xSpacing+1, ySpacing+1, (tileSize), (tileSize));

		ySpacing = offY;

		for(int y=0; y<height; y++){

			float xSpacing = offX;

			for(int x=0; x<width; x++){

				paint.setColor(board[x][y].determineColor());

				if(!board[x][y].isOpened()){

					if(board[x][y].isWrong()){ //draws X					
						paint.setColor(color1);
						g.drawRect(xSpacing+1, ySpacing+1, (tileSize+1)+xSpacing+1, (tileSize+1)+ySpacing+1,paint);
						paint.setColor(Color.GRAY);
						if(pro)
							paint.setColor(Color.argb(255, 255, 215, 0)); //gold - mid
						g.drawRect(xSpacing+1, ySpacing+1, (tileSize)+xSpacing+1, (tileSize)+ySpacing+1,paint);
						paint.setColor(Color.WHITE);

						paint.setStrokeWidth(tileSize/14);
						paint.setStyle(Style.STROKE);

						g.drawLine(xSpacing+(tileSize/4), ySpacing+(tileSize/4), xSpacing+tileSize-(tileSize/4), ySpacing+tileSize-(tileSize/4),paint); //top left/bottom right
						g.drawLine(xSpacing+tileSize-(tileSize/4), ySpacing+(tileSize/4), xSpacing+(tileSize/4), ySpacing+tileSize-(tileSize/4),paint);//top right/bottom left


					}

					else if(board[x][y].isFlagged()){

						paint.setStyle(Style.FILL);

						g.drawRect(xSpacing+tileSize/3, ySpacing+(tileSize)/3, xSpacing+(tileSize*2)/3, ySpacing+(tileSize)/2, paint); //flag

						paint.setColor(Color.BLACK);
						paint.setStrokeWidth(tileSize/23);
						g.drawLine(xSpacing+(tileSize)/3, ySpacing+(tileSize)/3, xSpacing+(tileSize)/3, ySpacing+(tileSize*3)/4, paint); //flag pole

						paint.setColor(Color.RED);
						//g.fillPolygon(xArray,yArray, 3);
						paint.setColor(color3);
						//g.fillPolygon(xArray,yArray, 3);
						paint.setColor(Color.BLACK);

					}

				}
				else{

					if(board[x][y].isBomb()){

						paint.setStyle(Style.FILL);
						//							paint.setColor(Color.RED);
						//							g.drawRect(xSpacing, ySpacing, (tileSize)+xSpacing, (tileSize)+ySpacing,paint);
						paint.setColor(Color.BLACK);
						g.drawCircle(xSpacing+(tileSize/2), ySpacing+(tileSize/2), (tileSize/4),paint);

						paint.setStrokeWidth(tileSize/14);
						paint.setStyle(Style.STROKE);
						g.drawLine(xSpacing+(tileSize/4), ySpacing+(tileSize/4), xSpacing+tileSize-(tileSize/4), ySpacing+tileSize-(tileSize/4),paint); //top left/bottom right
						g.drawLine(xSpacing+(tileSize/8), ySpacing+(tileSize/2), xSpacing+tileSize-(tileSize/8), ySpacing+(tileSize/2),paint);//mid 
						g.drawLine(xSpacing+tileSize-(tileSize/4), ySpacing+(tileSize/4), xSpacing+(tileSize/4), ySpacing+tileSize-(tileSize/4),paint);//top right/bottom left
						g.drawLine(xSpacing+(tileSize/2), ySpacing+(tileSize/8), xSpacing+(tileSize/2), ySpacing+tileSize-(tileSize/8),paint);//top/down

						//paint.setColor(color1); 
						paint.setStyle(Paint.Style.STROKE); 
						//						g.drawRect(xSpacing, ySpacing, (tileSize)+xSpacing, (tileSize)+ySpacing,paint);
						paint.setColor(Color.GRAY);
						if(pro)
							paint.setColor(Color.argb(255, 255, 215, 0)); //gold - mid
						paint.setStrokeWidth(3);
						g.drawRect(xSpacing, ySpacing, (tileSize)+xSpacing, (tileSize)+ySpacing,paint);

					}
					else if(board[x][y].getBombsSurrounding()==0)
					{
						paint.setStyle(Paint.Style.STROKE);
						paint.setColor(Color.GRAY);
						if(pro)
							paint.setColor(Color.argb(255, 255, 215, 0)); //gold - mid
						paint.setStrokeWidth(3);
						g.drawRect(xSpacing, ySpacing, (tileSize)+xSpacing, (tileSize)+ySpacing,paint);

					}

					else{
						paint.setStyle(Paint.Style.FILL);
						g.drawRect(xSpacing, ySpacing, (tileSize)+xSpacing, (tileSize)+ySpacing,paint);
						paint.setColor(color3); 
						g.drawRect(xSpacing, ySpacing, (tileSize)+xSpacing, (tileSize)+ySpacing,paint);
						paint.setColor(Color.WHITE);

						g.drawText(""+board[x][y].getBombsSurrounding(), xSpacing+((tileSize*2)/5), ySpacing+((tileSize*2)/3),paint);

						paint.setColor(Color.GRAY);
						if(pro)
							paint.setColor(Color.argb(255, 255, 215, 0)); //gold - mid
						paint.setStyle(Paint.Style.STROKE);
						paint.setStrokeWidth(3);
						g.drawRect(xSpacing, ySpacing, (tileSize)+xSpacing, (tileSize)+ySpacing,paint);
					}

				}

				xSpacing += (tileSize);
			}
			ySpacing+= (tileSize);
		}

		if(beingPressed&&!(game.getFlagMode())&&isUntouched(pressedCords[0],pressedCords[1])){
			paint.setStyle(Paint.Style.FILL);
			g.drawRect(pressedCords[0]*tileSize+offX, pressedCords[1]*tileSize+offY, pressedCords[0]*tileSize+offX+(tileSize), pressedCords[1]*tileSize+offY+(tileSize),gray);
		}

		paint.setStyle(Paint.Style.FILL);
		paint.setColor(Color.BLACK);		

		if (actionAndStatus == -1)
			actionAndStatus = game.mactivity.getActionBarHeight() + game.mactivity.getStatusBarHeight();

		if (actionAndStatus > 0)
		{
			realBarHeight = (MainActivity.screenHeight - actionAndStatus) - barHeight;
			g.drawRect(0, realBarHeight, (MainActivity.screenWidth), (MainActivity.screenHeight),paint);
			//		if(win){
			//			paint.setColor(color3);
			//			g.drawRect(0, realBarHeight, (MainActivity.screenWidth), (MainActivity.screenHeight),paint);

			//}


			paint.setStrokeWidth(1);

			paint.setColor(Color.WHITE);
			g.drawLine((MainActivity.screenWidth*1)/5, realBarHeight, (MainActivity.screenWidth*1)/5, (MainActivity.screenHeight), paint);
			g.drawLine((MainActivity.screenWidth*2)/5, realBarHeight, (MainActivity.screenWidth*2)/5, (MainActivity.screenHeight), paint);
			g.drawLine((MainActivity.screenWidth*3)/5, realBarHeight, (MainActivity.screenWidth*3)/5, (MainActivity.screenHeight), paint);
			g.drawLine((MainActivity.screenWidth*4)/5, realBarHeight, (MainActivity.screenWidth*4)/5, (MainActivity.screenHeight), paint);

			//paint.setColor(Color.RED);
			//g.drawLine((MainActivity.screenWidth*1)/10, realBarHeight, (MainActivity.screenWidth*1)/10, (MainActivity.screenHeight), paint);
			//g.drawLine((MainActivity.screenWidth*7)/10, realBarHeight, (MainActivity.screenWidth*7)/10, (MainActivity.screenHeight), paint);
			//g.drawLine((MainActivity.screenWidth*9)/10, realBarHeight, (MainActivity.screenWidth*9)/10, (MainActivity.screenHeight), paint);

			paint.setStyle(Style.STROKE);
			paint.setStrokeWidth(6);

			paint.setColor(Color.argb(255, 190, 190, 190));
			if(win)
				paint.setColor(Color.GREEN);
			else if(pro)
				paint.setColor(Color.argb(255,255,215,0));

			//MAGNIFINE GLASSES
			g.drawCircle((MainActivity.screenWidth*7)/10, realBarHeight+58, 24, paint);
			g.drawLine((MainActivity.screenWidth*72)/100, realBarHeight+74, (MainActivity.screenWidth*76)/100, realBarHeight+99, paint);

			g.drawCircle((MainActivity.screenWidth*9)/10, realBarHeight+58, 24, paint);
			g.drawLine((MainActivity.screenWidth*92)/100, realBarHeight+74, (MainActivity.screenWidth*96)/100, realBarHeight+99, paint);
			//PLUS
			g.drawLine((MainActivity.screenWidth*9)/10, realBarHeight+46, (MainActivity.screenWidth*9)/10, realBarHeight+69, paint);
			//MINUS
			g.drawLine((MainActivity.screenWidth*7)/10-10, realBarHeight+58, (MainActivity.screenWidth*7)/10+10, realBarHeight+58, paint);
			g.drawLine((MainActivity.screenWidth*9)/10-11, realBarHeight+58, (MainActivity.screenWidth*9)/10+11, realBarHeight+58, paint);



			//FLAG
			float bSize = 150;
			float sX = ((MainActivity.screenWidth*3)/10)-75;
			float sY = realBarHeight-20;

			paint.setStyle(Style.FILL);
			paint.setTypeface(tf);
			paint.setTextSize(bSize/5);
			g.drawText(""+flagCount, sX+(bSize)/3+40, sY+(bSize*3)/4+10, paint); //count
			g.drawRect(sX+bSize/3, sY+(bSize)/3, sX+(bSize*2)/3, sY+(bSize)/2, paint); //flag

			paint.setStyle(Style.STROKE);
			paint.setStrokeWidth(bSize/23);
			g.drawLine(sX+(bSize)/3, sY+(bSize)/3-7, sX+(bSize)/3, sY+(bSize*3)/4, paint); //flag pole


			//CLOCK
			g.drawCircle((MainActivity.screenWidth*1)/10-20, realBarHeight+58, 32, paint);
			paint.setStrokeWidth(bSize/40);
			g.drawLine((MainActivity.screenWidth*1)/10-20, realBarHeight+40, (MainActivity.screenWidth*1)/10-20, realBarHeight+60, paint);
			g.drawLine((MainActivity.screenWidth*1)/10-20, realBarHeight+60, (MainActivity.screenWidth*1)/10, realBarHeight+69, paint);

			paint.setStyle(Style.FILL);
			paint.setTextSize(bSize/5);
			sX = ((MainActivity.screenWidth*1)/10)-75;
			int push = 15;
			if(timeCounter>=10)
				push = 8;
			else if(timeCounter>=100)
				push = 2;
			else if(timeCounter>=1000)
				timeCounter = 999;
			g.drawText(""+timeCounter, sX+(bSize)/3+40+push, sY+(bSize*3)/4+10, paint); //count

			//MINE
			if(!game.flagMode){

				float bombSize = 100;
				float startingX = ((MainActivity.screenWidth*5)/10)-50;
				float startingY = realBarHeight+10;
				paint.setStyle(Style.FILL);
				g.drawCircle(startingX+(bombSize/2), startingY+(bombSize/2), (bombSize/4),paint);

				paint.setStrokeWidth(bombSize/14);
				paint.setStyle(Style.STROKE);
				//top left/bottom right
				g.drawLine(startingX+(bombSize/4), startingY+(bombSize/4), startingX+bombSize-(bombSize/4), startingY+bombSize-(bombSize/4),paint); 
				//mid 
				g.drawLine(startingX+(bombSize/8), startingY+(bombSize/2), startingX+bombSize-(bombSize/8), startingY+(bombSize/2),paint);
				//top right/bottom left
				g.drawLine(startingX+bombSize-(bombSize/4), startingY+(bombSize/4), startingX+(bombSize/4), startingY+bombSize-(bombSize/4),paint);
				//top/down
				g.drawLine(startingX+(bombSize/2), startingY+(bombSize/8), startingX+(bombSize/2), startingY+bombSize-(bombSize/8),paint);

			}
			//FLAG
			else{
				bSize = 150;
				sX = ((MainActivity.screenWidth*5)/10)-68;
				sY = realBarHeight-12;

				paint.setStyle(Style.FILL);
				g.drawRect(sX+bSize/3, sY+(bSize)/3-2, sX+(bSize*2)/3, sY+(bSize)/2-2, paint); //flag

				paint.setStyle(Style.STROKE);
				paint.setStrokeWidth(bSize/23);
				g.drawLine(sX+(bSize)/3, sY+(bSize)/3-7, sX+(bSize)/3, sY+(bSize*3)/4-3, paint); //flag pole
			}
		}

		if(showCheck){

			if(checkBoard())
				paint.setColor(Color.argb(80, 0, 255, 0));

			else
				paint.setColor(Color.argb(80, 255, 0, 0));

			paint.setStyle(Paint.Style.FILL);
			g.drawRect(0, 0, MainActivity.screenWidth, MainActivity.screenHeight,paint);

		}

		if(showHint && (getHint()[0]>=0 && getHint()[1]>=0)){
			getHint();
			int color = Color.argb(255,255,0,0);
			if(hintColorYellow)
				color = Color.argb(255,255,255,0);

			paint.setColor(color);
			paint.setStrokeWidth(tileSize/12);
			paint.setStyle(Paint.Style.STROKE);

			g.drawRect(getHint()[0]*(tileSize)+offX, getHint()[1]*(tileSize)+offY, getHint()[0]*(tileSize)+tileSize+offX, getHint()[1]*(tileSize)+tileSize+offY,paint);
		}


		//Log.v("RBH",""+realBarHeight);

		//Log.v("hi",""+(MainActivity.screenWidth*5)/10);
		//g.setColor(Color.);
		//getwindowy -36
	}
}



