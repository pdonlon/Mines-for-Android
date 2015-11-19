package com.pdonlon.mines2;

import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.AdView;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Status;

import android.Manifest;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentSender;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;
import android.support.v4.app.ActivityCompat;

import android.app.Activity;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Point;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
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
import com.google.android.gms.plus.Plus;
import com.google.android.gms.games.Games;
import android.widget.Toast;

import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.HashMap;

import android.Manifest;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentSender;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.util.Log;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.common.Scopes;
import com.google.android.gms.common.SignInButton;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.plus.Plus;
import com.google.android.gms.plus.model.people.Person;

import javax.xml.transform.Result;


public class MainActivity extends Activity implements
		GoogleApiClient.ConnectionCallbacks,
		GoogleApiClient.OnConnectionFailedListener,
		View.OnClickListener,
		ResultCallback
{
	DrawPanel drawView;

	private static final String TAG = "MainActivity";

	HashMap<String, String> hmap;

	/* RequestCode for resolutions involving sign-in */
	private static final int RC_SIGN_IN = 1;

	/* RequestCode for resolutions to get GET_ACCOUNTS permission on M */
	private static final int RC_PERM_GET_ACCOUNTS = 2;

	/* Keys for persisting instance variables in savedInstanceState */
	private static final String KEY_IS_RESOLVING = "is_resolving";
	private static final String KEY_SHOULD_RESOLVE = "should_resolve";

	/* Client for accessing Google APIs */
	public GoogleApiClient mGoogleApiClient;

	/* View to display current status (signed-in, signed-out, disconnected, etc) */
	private TextView mStatus;

	// [START resolution_variables]
    /* Is there a ConnectionResult resolution in progress? */
	private boolean mIsResolving = false;

	/* Should we automatically resolve ConnectionResults when possible? */
	private boolean mShouldResolve = false;

	static MenuItem mens1;
	static MenuItem mens2; 
	static MenuItem mens3;
	static MenuItem mens4;
	static MenuItem mens5;
	static MenuItem mens6;
	static MenuItem mens7;
	static MenuItem mens8;
	static boolean pro = false;

	//com.google.android.gms.common.SignInButton realButton;

	static int screenWidth, screenHeight;

	@Override
	public void onConnectionSuspended(int i) {
		mGoogleApiClient.connect();
	}

	private void updateUI(boolean isSignedIn) {
		if (isSignedIn) {
			Person currentPerson = Plus.PeopleApi.getCurrentPerson(mGoogleApiClient);
			if (currentPerson != null) {
				// Show signed-in user's name
				String name = currentPerson.getDisplayName();
//				mStatus.setText("Ricky");

				// Show users' email address (which requires GET_ACCOUNTS permission)
				if (checkAccountsPermission()) {
//					String currentAccount = Plus.AccountApi.getAccountName(mGoogleApiClient);
//					((TextView) findViewById(R.id.email)).setText(currentAccount);
				}
			} else {
				// If getCurrentPerson returns null there is generally some error with the
				// configuration of the application (invalid Client ID, Plus API not enabled, etc).
				//Log.w(TAG, getString(R.string.error_null_person));
//				mStatus.setText(getString(R.string.signed_in_err));
			}

			// Set button visibility
//			findViewById(R.id.sign_in_button).setVisibility(View.GONE);
//			findViewById(R.id.sign_out_and_disconnect).setVisibility(View.VISIBLE);
		} else {
			// Show signed-out message and clear email field
//			mStatus.setText(getText(R.string.signed_out));
//			((TextView) findViewById(R.id.email)).setText("");

			// Set button visibility
//			findViewById(R.id.sign_in_button).setEnabled(true);
//			findViewById(R.id.sign_in_button).setVisibility(View.VISIBLE);
//			findViewById(R.id.sign_out_and_disconnect).setVisibility(View.GONE);
		}
	}

	private void showSignedInUI() {
		updateUI(true);
	}

	public void displayLeaderboard(String difficulty)
	{
		startActivityForResult(Games.Leaderboards.getLeaderboardIntent(mGoogleApiClient, hmap.get(difficulty)), 0);
	}

	private void showSignedOutUI() {
		updateUI(false);
	}

	private boolean checkAccountsPermission() {
//		final String perm = Manifest.permission.GET_ACCOUNTS;
//		int permissionCheck = ContextCompat.checkSelfPermission(this, perm);
//		if (permissionCheck == PackageManager.PERMISSION_GRANTED) {
//			// We have the permission
//			return true;
//		} else if (ActivityCompat.shouldShowRequestPermissionRationale(this, perm)) {
//			// Need to show permission rationale, display a snackbar and then request
//			// the permission again when the snackbar is dismissed.
//			Snackbar.make(findViewById(R.id.main_layout),
//					R.string.contacts_permission_rationale,
//					Snackbar.LENGTH_INDEFINITE)
//					.setAction(android.R.string.ok, new View.OnClickListener() {
//						@Override
//						public void onClick(View v) {
//							// Request the permission again.
//							ActivityCompat.requestPermissions(MainActivity.this,
//									new String[]{perm},
//									RC_PERM_GET_ACCOUNTS);
//						}
//					}).show();
//			return false;
//		} else {
//			// No explanation needed, we can request the permission.
//			ActivityCompat.requestPermissions(this,
//					new String[]{perm},
//					RC_PERM_GET_ACCOUNTS);
//			return false;
//		}
		return true;
	}

	public void onSignOutClicked() {
		// Clear the default account so that GoogleApiClient will not automatically
		// connect in the future.
		if (mGoogleApiClient.isConnected()) {
			Plus.AccountApi.clearDefaultAccount(mGoogleApiClient);
			mGoogleApiClient.disconnect();
		}
		showSignedOutUI();
	}

	public void submitScore(Long score)
	{
		Games.Leaderboards.submitScore(mGoogleApiClient, hmap.get(drawView.getDifficulty()), score);
		displayLeaderboard(drawView.getDifficulty());
		drawView.setLeaderboardPressed(false);
		drawView.determineDifficulty();
		//TODO display pause menu
	}

	@Override
	public void onConnected(Bundle bundle) {
		// onConnected indicates that an account was selected on the device, that the selected
		// account has granted any requested permissions to our app and that we were able to
		// establish a service connection to Google Play services.
		Log.d(TAG, "onConnected:" + bundle);
		mShouldResolve = false;

		// Show the signed-in UI
		showSignedInUI();
		if(drawView.isLeaderboardPressed())
			submitScore(drawView.scores.getLong(drawView.getDifficulty(), 0));
	}

	@Override
	public void onClick(View v) {

//		if (v.getId() == realButton.getId()) {
//			onSignInClicked();
//		}

	}

	public void onSignInClicked() {
		// User clicked the sign-in button, so begin the sign-in process and automatically
		// attempt to resolve any errors that occur.
		mShouldResolve = true;
		mGoogleApiClient.connect();

		// Show a message to the user that we are signing in.
//		mStatus.setText(R.string.signing_in);
	}

	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		super.onActivityResult(requestCode, resultCode, data);
		Log.d(TAG, "onActivityResult:" + requestCode + ":" + resultCode + ":" + data);

		if (requestCode == RC_SIGN_IN) {
			// If the error resolution was not successful we should not resolve further.
			if (resultCode != RESULT_OK) {
				mShouldResolve = false;
			}

			mIsResolving = false;
			mGoogleApiClient.connect();
		}
	}

	protected void onPause()
	{
		super.onPause();
//		Log.v(TAG, "++ ON PAUSE ++");
		drawView.pauseGame();
		//call pause function (stops timer and dims screen)
		//same thing for pressing the clock
	}
	protected void onResume()
	{
		super.onResume();
//		Log.v(TAG, "++ ON RESUME ++");
		if(drawView.paused && !drawView.pauseAlertDialogUp)
			drawView.pauseMenu();
		//call pause function (stops timer and dims screen)
		//same thing for pressing the clock
	}

	protected void onStart()
	{
		super.onStart();
//		Log.v(TAG, "++ ON START ++");
		mGoogleApiClient.connect();
	}

	protected void onStop() {
		super.onStop();
		//drawView.saveGame();
//		Log.v(TAG, "++ ON STOP ++");

		//drawView.pauseGame();
		if (mGoogleApiClient.isConnected()) {
			mGoogleApiClient.disconnect();
		}	}

	public boolean isUserConnected()
	{
		return mGoogleApiClient.isConnected();
	}

	@Override
	public void onConnectionFailed(ConnectionResult connectionResult) {
		// Could not connect to Google Play Services.  The user needs to select an account,
		// grant permissions or resolve an error in order to sign in. Refer to the javadoc for
		// ConnectionResult to see possible error codes.
//		Log.d(TAG, "onConnectionFailed:" + connectionResult);

		if (!mIsResolving && mShouldResolve) {
			if (connectionResult.hasResolution()) {
				try {
					connectionResult.startResolutionForResult(this, RC_SIGN_IN);
					mIsResolving = true;
				} catch (IntentSender.SendIntentException e) {
					mIsResolving = false;
					mGoogleApiClient.connect();
				}
			} else {
				// Could not resolve the connection result, show the user an
				// error dialog.
				//showErrorDialog(connectionResult);
			}
		} else {
			// Show the signed-out UI
			showSignedOutUI();
		}
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
//		Log.v(TAG, "++ ON DESTROY ++");
		//drawView.saveGame();
	}

	public boolean onCreateOptionsMenu(Menu menu) {

		mens1 = menu.add(0, 1, 2, DrawPanel.context.getString(R.string.Settings));
		mens2 = menu.add(0, 2, 2, DrawPanel.context.getString(R.string.Reset));
		mens3 = menu.add(0, 3, 2, DrawPanel.context.getString(R.string.New_Game));
		mens4 = menu.add(0, 4, 2, DrawPanel.context.getString(R.string.High_Scores));
		mens5 = menu.add(0, 5, 2, DrawPanel.context.getString(R.string.Multiplayer));
		//mens6 = menu.add(0, 6, 2, DrawPanel.context.getString(R.string.Gold));

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

		case KeyEvent.KEYCODE_BACK:
			if(action == KeyEvent.ACTION_DOWN)
			{
				drawView.quitMenu();
				//System.exit(0);
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
			drawView.showNewGame();
			return true;
		case 4:
			drawView.showAllHighScores();
			return true;
			
		case 5:
			drawView.startMultiplayer();
			return true;
			
//		case 6:
			//displayLeaderboard("Easy");
//			Board.proToggle();
//			runOnUiThread(new Runnable(){ public void run() {
//				drawView.invalidate();}});
//			return true;


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
			return getStatusBarHeight();
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
		drawView.setDifficulty(DrawPanel.context.getString(R.string.Easy));
		drawView.playBoard.setTotalBombs(10);
		startingUp();
		drawView.playBoard.readjust();
	}

	public void mediumGame()
	{
		drawView.playBoard.setWidth(16);
		drawView.playBoard.setHeight(16);
		drawView.setDifficulty(DrawPanel.context.getString(R.string.Medium));
		drawView.playBoard.setTotalBombs(40);
		startingUp();
		drawView.playBoard.readjust();
	}

	public void hardGame()
	{
		drawView.playBoard.setWidth(16);
		drawView.playBoard.setHeight(30);
		drawView.setDifficulty(DrawPanel.context.getString(R.string.Hard));
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
		setContentView(R.layout.activity_main);

		hmap = new HashMap<String, String>();
		hmap.put("Easy", getString(R.string.leaderboard_easy_leaderboard));
		hmap.put("Medium", getString(R.string.leaderboard_medium_leaderboard));
		hmap.put("Hard", getString(R.string.leaderboard_hard_leaderboard));

//		Log.v("s", "SETTING ON CLICK LISTENER");
//		realButton = new com.google.android.gms.common.SignInButton(this);
//		realButton.setOnClickListener(this);
//		realButton.setId(R.id.titleId);

//		findViewById(R.id.why).setVisibility(View.INVISIBLE);

		// Build GoogleApiClient with access to basic profile

		mGoogleApiClient = new GoogleApiClient.Builder(this)
				.addApiIfAvailable(Games.API)
				.addConnectionCallbacks(this)
				.addOnConnectionFailedListener(this)
				.addApiIfAvailable(Plus.API)
				.addScope(new Scope(Scopes.PROFILE))
				.addScope(new Scope(Scopes.EMAIL))
				.build();

		Display display = getWindowManager().getDefaultDisplay();

//		mStatus = (TextView) findViewById(R.id.status);

		screenWidth = display.getWidth();  // deprecated
		screenHeight = display.getHeight();  // deprecated

		drawView = new DrawPanel(this, this);
		drawView.setBackgroundColor(Color.LTGRAY);

		setContentView(R.layout.activity_main);

		RelativeLayout layout2 = (RelativeLayout)findViewById(R.id.surface_home); 

		layout2.addView(drawView);

		// comment me out to die
		//layout2.addView(realButton);

		
		if (drawView.save.getBoolean("gold", pro)) //gold font
			getActionBar().setTitle(Html.fromHtml("<font color=\"#FFD700\">"+ getString(R.string.app_name)+"</font>"));

		if(!pro)
		{
//			// Create the adView
//			AdView adView = new AdView(this, AdSize.BANNER, "7f4b6aa604824d54");
//			// Lookup your RelativeLayoutLayout assuming it's been given
//			// the attribute android:id="@+id/ad"
			AdView layout = (AdView)findViewById(R.id.ad);
//			layout.setAdSize(AdSize.BANNER);
//			layout.setAdUnitId("ca-app-pub-9193211245158226/1556658999");

			RelativeLayout.LayoutParams lp=(RelativeLayout.LayoutParams)layout.getLayoutParams();
			int barHeight = (int) (.1*MainActivity.screenHeight);

			lp.bottomMargin = barHeight; //+ (int) (.01*MainActivity.screenHeight);
			layout.setLayoutParams(lp);

//			// Add the adView to it
			//AdRequest adRequest = new AdRequest.Builder().addTestDevice("986ED27EBCDDD10DD77FD3CE26CD54EB").build();
			AdRequest adRequest = new AdRequest.Builder().addTestDevice("9EBFF3D35D352A68FD1ECBACDE41CF3D").build();
//
//			// Initiate a generic request to load it with an ad
			layout.loadAd(adRequest);
		}
		if(drawView.save.getBoolean("saveGame",false))
		{
			drawView.pauseGame();
			runOnUiThread(new Runnable(){ public void run() {
				drawView.invalidate();}});
			drawView.pauseMenu();
		}
		
	}

	@Override
	public void onResult(com.google.android.gms.common.api.Result result) {

	}
}