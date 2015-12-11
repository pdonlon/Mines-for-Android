.class public Lcom/pdonlon/mines2/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"

# interfaces
.implements Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;
.implements Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;
.implements Landroid/view/View$OnClickListener;
.implements Lcom/google/android/gms/common/api/ResultCallback;


# static fields
.field private static final KEY_IS_RESOLVING:Ljava/lang/String; = "is_resolving"

.field private static final KEY_SHOULD_RESOLVE:Ljava/lang/String; = "should_resolve"

.field private static final RC_PERM_GET_ACCOUNTS:I = 0x2

.field private static final RC_SIGN_IN:I = 0x1

.field private static final TAG:Ljava/lang/String; = "MainActivity"

.field static mens1:Landroid/view/MenuItem;

.field static mens2:Landroid/view/MenuItem;

.field static mens3:Landroid/view/MenuItem;

.field static mens4:Landroid/view/MenuItem;

.field static mens5:Landroid/view/MenuItem;

.field static mens6:Landroid/view/MenuItem;

.field static mens7:Landroid/view/MenuItem;

.field static mens8:Landroid/view/MenuItem;

.field static pro:Z

.field static screenHeight:I

.field static screenWidth:I


# instance fields
.field drawView:Lcom/pdonlon/mines2/DrawPanel;

.field hmap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public mGoogleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

.field private mIsResolving:Z

.field private mShouldResolve:Z

.field private mStatus:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 125
    const/4 v0, 0x0

    sput-boolean v0, Lcom/pdonlon/mines2/MainActivity;->pro:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 82
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 112
    iput-boolean v0, p0, Lcom/pdonlon/mines2/MainActivity;->mIsResolving:Z

    .line 115
    iput-boolean v0, p0, Lcom/pdonlon/mines2/MainActivity;->mShouldResolve:Z

    return-void
.end method

.method private checkAccountsPermission()Z
    .locals 1

    .prologue
    .line 213
    const/4 v0, 0x1

    return v0
.end method

.method private showSignedInUI()V
    .locals 1

    .prologue
    .line 172
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/pdonlon/mines2/MainActivity;->updateUI(Z)V

    .line 173
    return-void
.end method

.method private showSignedOutUI()V
    .locals 1

    .prologue
    .line 181
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/pdonlon/mines2/MainActivity;->updateUI(Z)V

    .line 182
    return-void
.end method

.method private updateUI(Z)V
    .locals 4
    .parameter "isSignedIn"

    .prologue
    .line 137
    if-eqz p1, :cond_0

    .line 138
    sget-object v2, Lcom/google/android/gms/plus/Plus;->PeopleApi:Lcom/google/android/gms/plus/People;

    iget-object v3, p0, Lcom/pdonlon/mines2/MainActivity;->mGoogleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v2, v3}, Lcom/google/android/gms/plus/People;->getCurrentPerson(Lcom/google/android/gms/common/api/GoogleApiClient;)Lcom/google/android/gms/plus/model/people/Person;

    move-result-object v0

    .line 139
    .local v0, currentPerson:Lcom/google/android/gms/plus/model/people/Person;
    if-eqz v0, :cond_0

    .line 141
    invoke-interface {v0}, Lcom/google/android/gms/plus/model/people/Person;->getDisplayName()Ljava/lang/String;

    move-result-object v1

    .line 145
    .local v1, name:Ljava/lang/String;
    invoke-direct {p0}, Lcom/pdonlon/mines2/MainActivity;->checkAccountsPermission()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 169
    .end local v0           #currentPerson:Lcom/google/android/gms/plus/model/people/Person;
    .end local v1           #name:Ljava/lang/String;
    :cond_0
    return-void
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 6
    .parameter "event"

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 373
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    .line 374
    .local v0, action:I
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    .line 376
    .local v1, keyCode:I
    sparse-switch v1, :sswitch_data_0

    .line 402
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v3

    :cond_0
    :goto_0
    return v3

    .line 378
    :sswitch_0
    if-ne v0, v3, :cond_0

    .line 379
    iget-object v4, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v5, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v5}, Lcom/pdonlon/mines2/DrawPanel;->getFlagMode()Z

    move-result v5

    if-nez v5, :cond_1

    move v2, v3

    :cond_1
    invoke-virtual {v4, v2}, Lcom/pdonlon/mines2/DrawPanel;->setFlagMode(Z)V

    goto :goto_0

    .line 388
    :sswitch_1
    if-ne v0, v3, :cond_2

    .line 389
    iget-object v4, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v5, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v5}, Lcom/pdonlon/mines2/DrawPanel;->getFlagMode()Z

    move-result v5

    if-nez v5, :cond_4

    :goto_1
    invoke-virtual {v4, v3}, Lcom/pdonlon/mines2/DrawPanel;->setFlagMode(Z)V

    .line 394
    :cond_2
    :sswitch_2
    if-nez v0, :cond_3

    .line 396
    iget-object v3, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v3}, Lcom/pdonlon/mines2/DrawPanel;->quitMenu()V

    .line 397
    invoke-static {v2}, Ljava/lang/System;->exit(I)V

    .line 400
    :cond_3
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v3

    goto :goto_0

    :cond_4
    move v3, v2

    .line 389
    goto :goto_1

    .line 376
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_2
        0x18 -> :sswitch_0
        0x19 -> :sswitch_1
    .end sparse-switch
.end method

.method public displayLeaderboard(Ljava/lang/String;)V
    .locals 3
    .parameter "difficulty"

    .prologue
    .line 177
    sget-object v1, Lcom/google/android/gms/games/Games;->Leaderboards:Lcom/google/android/gms/games/leaderboard/Leaderboards;

    iget-object v2, p0, Lcom/pdonlon/mines2/MainActivity;->mGoogleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->hmap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Lcom/google/android/gms/games/leaderboard/Leaderboards;->getLeaderboardIntent(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/pdonlon/mines2/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 178
    return-void
.end method

.method public easyGame()V
    .locals 3

    .prologue
    const/16 v1, 0x9

    .line 479
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/Board;->setWidth(I)V

    .line 480
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/Board;->setHeight(I)V

    .line 481
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    sget-object v1, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v2, 0x7f050020

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/DrawPanel;->setDifficulty(Ljava/lang/String;)V

    .line 482
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/Board;->setTotalBombs(I)V

    .line 483
    invoke-virtual {p0}, Lcom/pdonlon/mines2/MainActivity;->startingUp()V

    .line 484
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->readjust()V

    .line 485
    return-void
.end method

.method public getActionBarHeight()I
    .locals 3

    .prologue
    .line 456
    :try_start_0
    invoke-virtual {p0}, Lcom/pdonlon/mines2/MainActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/ActionBar;->getHeight()I
    :try_end_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 457
    .local v0, actionBarHeight:I
    if-eqz v0, :cond_0

    .line 465
    .end local v0           #actionBarHeight:I
    :goto_0
    return v0

    .line 460
    :catch_0
    move-exception v1

    .line 462
    .local v1, e:Ljava/lang/NoSuchMethodError;
    invoke-virtual {p0}, Lcom/pdonlon/mines2/MainActivity;->getStatusBarHeight()I

    move-result v0

    goto :goto_0

    .line 465
    .end local v1           #e:Ljava/lang/NoSuchMethodError;
    .restart local v0       #actionBarHeight:I
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getStatusBarHeight()I
    .locals 6

    .prologue
    .line 469
    const/4 v1, 0x0

    .line 470
    .local v1, result:I
    invoke-virtual {p0}, Lcom/pdonlon/mines2/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "status_bar_height"

    const-string v4, "dimen"

    const-string v5, "android"

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 471
    .local v0, resourceId:I
    if-lez v0, :cond_0

    .line 472
    invoke-virtual {p0}, Lcom/pdonlon/mines2/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 474
    :cond_0
    return v1
.end method

.method public hardGame()V
    .locals 3

    .prologue
    .line 499
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/Board;->setWidth(I)V

    .line 500
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    const/16 v1, 0x1e

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/Board;->setHeight(I)V

    .line 501
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    sget-object v1, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v2, 0x7f050023

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/DrawPanel;->setDifficulty(Ljava/lang/String;)V

    .line 502
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    const/16 v1, 0x63

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/Board;->setTotalBombs(I)V

    .line 503
    invoke-virtual {p0}, Lcom/pdonlon/mines2/MainActivity;->startingUp()V

    .line 504
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->readjust()V

    .line 505
    return-void
.end method

.method public isUserConnected()Z
    .locals 1

    .prologue
    .line 321
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->mGoogleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnected()Z

    move-result v0

    return v0
.end method

.method public mediumGame()V
    .locals 3

    .prologue
    const/16 v1, 0x10

    .line 489
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/Board;->setWidth(I)V

    .line 490
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/Board;->setHeight(I)V

    .line 491
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    sget-object v1, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v2, 0x7f050027

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/DrawPanel;->setDifficulty(Ljava/lang/String;)V

    .line 492
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/Board;->setTotalBombs(I)V

    .line 493
    invoke-virtual {p0}, Lcom/pdonlon/mines2/MainActivity;->startingUp()V

    .line 494
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->readjust()V

    .line 495
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    const/4 v3, 0x0

    .line 270
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 271
    const-string v0, "MainActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onActivityResult:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 275
    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    .line 276
    iput-boolean v3, p0, Lcom/pdonlon/mines2/MainActivity;->mShouldResolve:Z

    .line 279
    :cond_0
    iput-boolean v3, p0, Lcom/pdonlon/mines2/MainActivity;->mIsResolving:Z

    .line 280
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->mGoogleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->connect()V

    .line 282
    :cond_1
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0
    .parameter "v"

    .prologue
    .line 256
    return-void
.end method

.method public onConnected(Landroid/os/Bundle;)V
    .locals 4
    .parameter "bundle"

    .prologue
    .line 240
    const-string v0, "MainActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onConnected:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pdonlon/mines2/MainActivity;->mShouldResolve:Z

    .line 244
    invoke-direct {p0}, Lcom/pdonlon/mines2/MainActivity;->showSignedInUI()V

    .line 245
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/DrawPanel;->isLeaderboardPressed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 246
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->scores:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v1}, Lcom/pdonlon/mines2/DrawPanel;->getDifficulty()Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/pdonlon/mines2/MainActivity;->submitScore(Ljava/lang/Long;)V

    .line 247
    :cond_0
    return-void
.end method

.method public onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 2
    .parameter "connectionResult"

    .prologue
    .line 331
    iget-boolean v1, p0, Lcom/pdonlon/mines2/MainActivity;->mIsResolving:Z

    if-nez v1, :cond_1

    iget-boolean v1, p0, Lcom/pdonlon/mines2/MainActivity;->mShouldResolve:Z

    if-eqz v1, :cond_1

    .line 332
    invoke-virtual {p1}, Lcom/google/android/gms/common/ConnectionResult;->hasResolution()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 334
    const/4 v1, 0x1

    :try_start_0
    invoke-virtual {p1, p0, v1}, Lcom/google/android/gms/common/ConnectionResult;->startResolutionForResult(Landroid/app/Activity;I)V

    .line 335
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/pdonlon/mines2/MainActivity;->mIsResolving:Z
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 349
    :cond_0
    :goto_0
    return-void

    .line 336
    :catch_0
    move-exception v0

    .line 337
    .local v0, e:Landroid/content/IntentSender$SendIntentException;
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/pdonlon/mines2/MainActivity;->mIsResolving:Z

    .line 338
    iget-object v1, p0, Lcom/pdonlon/mines2/MainActivity;->mGoogleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-virtual {v1}, Lcom/google/android/gms/common/api/GoogleApiClient;->connect()V

    goto :goto_0

    .line 347
    .end local v0           #e:Landroid/content/IntentSender$SendIntentException;
    :cond_1
    invoke-direct {p0}, Lcom/pdonlon/mines2/MainActivity;->showSignedOutUI()V

    goto :goto_0
.end method

.method public onConnectionSuspended(I)V
    .locals 1
    .parameter "i"

    .prologue
    .line 133
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->mGoogleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->connect()V

    .line 134
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 11
    .parameter "savedInstanceState"

    .prologue
    const/high16 v9, 0x7f03

    const/4 v10, 0x0

    .line 517
    const-string v6, "LOG REACHED"

    const-string v7, "MAIN ACTIVITY"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 519
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 520
    invoke-virtual {p0, v9}, Lcom/pdonlon/mines2/MainActivity;->setContentView(I)V

    .line 522
    const-string v6, "MAINACTIVITY REACHED"

    const-string v7, "TO TWO"

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 524
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    iput-object v6, p0, Lcom/pdonlon/mines2/MainActivity;->hmap:Ljava/util/HashMap;

    .line 525
    iget-object v6, p0, Lcom/pdonlon/mines2/MainActivity;->hmap:Ljava/util/HashMap;

    const-string v7, "Easy"

    const v8, 0x7f05004e

    invoke-virtual {p0, v8}, Lcom/pdonlon/mines2/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 526
    iget-object v6, p0, Lcom/pdonlon/mines2/MainActivity;->hmap:Ljava/util/HashMap;

    const-string v7, "Medium"

    const v8, 0x7f050050

    invoke-virtual {p0, v8}, Lcom/pdonlon/mines2/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 527
    iget-object v6, p0, Lcom/pdonlon/mines2/MainActivity;->hmap:Ljava/util/HashMap;

    const-string v7, "Hard"

    const v8, 0x7f05004f

    invoke-virtual {p0, v8}, Lcom/pdonlon/mines2/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 538
    new-instance v6, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    invoke-direct {v6, p0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;-><init>(Landroid/content/Context;)V

    sget-object v7, Lcom/google/android/gms/games/Games;->API:Lcom/google/android/gms/common/api/Api;

    new-array v8, v10, [Lcom/google/android/gms/common/api/Scope;

    invoke-virtual {v6, v7, v8}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addApiIfAvailable(Lcom/google/android/gms/common/api/Api;[Lcom/google/android/gms/common/api/Scope;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    move-result-object v6

    invoke-virtual {v6, p0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addConnectionCallbacks(Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    move-result-object v6

    invoke-virtual {v6, p0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addOnConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    move-result-object v6

    sget-object v7, Lcom/google/android/gms/plus/Plus;->API:Lcom/google/android/gms/common/api/Api;

    new-array v8, v10, [Lcom/google/android/gms/common/api/Scope;

    invoke-virtual {v6, v7, v8}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addApiIfAvailable(Lcom/google/android/gms/common/api/Api;[Lcom/google/android/gms/common/api/Scope;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    move-result-object v6

    new-instance v7, Lcom/google/android/gms/common/api/Scope;

    const-string v8, "profile"

    invoke-direct {v7, v8}, Lcom/google/android/gms/common/api/Scope;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addScope(Lcom/google/android/gms/common/api/Scope;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    move-result-object v6

    new-instance v7, Lcom/google/android/gms/common/api/Scope;

    const-string v8, "email"

    invoke-direct {v7, v8}, Lcom/google/android/gms/common/api/Scope;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addScope(Lcom/google/android/gms/common/api/Scope;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->build()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v6

    iput-object v6, p0, Lcom/pdonlon/mines2/MainActivity;->mGoogleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    .line 547
    invoke-virtual {p0}, Lcom/pdonlon/mines2/MainActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v6

    invoke-interface {v6}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    .line 551
    .local v2, display:Landroid/view/Display;
    invoke-virtual {v2}, Landroid/view/Display;->getWidth()I

    move-result v6

    sput v6, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    .line 552
    invoke-virtual {v2}, Landroid/view/Display;->getHeight()I

    move-result v6

    sput v6, Lcom/pdonlon/mines2/MainActivity;->screenHeight:I

    .line 554
    new-instance v6, Lcom/pdonlon/mines2/DrawPanel;

    invoke-direct {v6, p0, p0}, Lcom/pdonlon/mines2/DrawPanel;-><init>(Landroid/content/Context;Lcom/pdonlon/mines2/MainActivity;)V

    iput-object v6, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    .line 555
    iget-object v6, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    const v7, -0x333334

    invoke-virtual {v6, v7}, Lcom/pdonlon/mines2/DrawPanel;->setBackgroundColor(I)V

    .line 557
    invoke-virtual {p0, v9}, Lcom/pdonlon/mines2/MainActivity;->setContentView(I)V

    .line 559
    const v6, 0x7f090005

    invoke-virtual {p0, v6}, Lcom/pdonlon/mines2/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/RelativeLayout;

    .line 561
    .local v4, layout2:Landroid/widget/RelativeLayout;
    iget-object v6, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v4, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 567
    iget-object v6, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v6, v6, Lcom/pdonlon/mines2/DrawPanel;->save:Landroid/content/SharedPreferences;

    const-string v7, "gold"

    sget-boolean v8, Lcom/pdonlon/mines2/MainActivity;->pro:Z

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 568
    invoke-virtual {p0}, Lcom/pdonlon/mines2/MainActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "<font color=\"#FFD700\">"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const v8, 0x7f050043

    invoke-virtual {p0, v8}, Lcom/pdonlon/mines2/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</font>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 570
    :cond_0
    sget-boolean v6, Lcom/pdonlon/mines2/MainActivity;->pro:Z

    if-nez v6, :cond_1

    .line 576
    const v6, 0x7f090006

    invoke-virtual {p0, v6}, Lcom/pdonlon/mines2/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/ads/AdView;

    .line 580
    .local v3, layout:Lcom/google/android/gms/ads/AdView;
    invoke-virtual {v3}, Lcom/google/android/gms/ads/AdView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/RelativeLayout$LayoutParams;

    .line 581
    .local v5, lp:Landroid/widget/RelativeLayout$LayoutParams;
    const-wide v6, 0x3fb999999999999aL

    sget v8, Lcom/pdonlon/mines2/MainActivity;->screenHeight:I

    int-to-double v8, v8

    mul-double/2addr v6, v8

    double-to-int v1, v6

    .line 583
    .local v1, barHeight:I
    iput v1, v5, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 584
    invoke-virtual {v3, v5}, Lcom/google/android/gms/ads/AdView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 588
    new-instance v6, Lcom/google/android/gms/ads/AdRequest$Builder;

    invoke-direct {v6}, Lcom/google/android/gms/ads/AdRequest$Builder;-><init>()V

    const-string v7, "9EBFF3D35D352A68FD1ECBACDE41CF3D"

    invoke-virtual {v6, v7}, Lcom/google/android/gms/ads/AdRequest$Builder;->addTestDevice(Ljava/lang/String;)Lcom/google/android/gms/ads/AdRequest$Builder;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/android/gms/ads/AdRequest$Builder;->build()Lcom/google/android/gms/ads/AdRequest;

    move-result-object v0

    .line 591
    .local v0, adRequest:Lcom/google/android/gms/ads/AdRequest;
    invoke-virtual {v3, v0}, Lcom/google/android/gms/ads/AdView;->loadAd(Lcom/google/android/gms/ads/AdRequest;)V

    .line 593
    .end local v0           #adRequest:Lcom/google/android/gms/ads/AdRequest;
    .end local v1           #barHeight:I
    .end local v3           #layout:Lcom/google/android/gms/ads/AdView;
    .end local v5           #lp:Landroid/widget/RelativeLayout$LayoutParams;
    :cond_1
    iget-object v6, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v6, v6, Lcom/pdonlon/mines2/DrawPanel;->save:Landroid/content/SharedPreferences;

    const-string v7, "saveGame"

    invoke-interface {v6, v7, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 595
    iget-object v6, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v6}, Lcom/pdonlon/mines2/DrawPanel;->pauseGame()V

    .line 596
    new-instance v6, Lcom/pdonlon/mines2/MainActivity$2;

    invoke-direct {v6, p0}, Lcom/pdonlon/mines2/MainActivity$2;-><init>(Lcom/pdonlon/mines2/MainActivity;)V

    invoke-virtual {p0, v6}, Lcom/pdonlon/mines2/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 598
    iget-object v6, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v6}, Lcom/pdonlon/mines2/DrawPanel;->pauseMenu()V

    .line 601
    :cond_2
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 6
    .parameter "menu"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x2

    .line 360
    const-string v0, "MAINACTIVITY REACHED"

    const-string v1, "TO ONE"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 362
    sget-object v0, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v1, 0x7f050037

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v4, v5, v3, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    sput-object v0, Lcom/pdonlon/mines2/MainActivity;->mens1:Landroid/view/MenuItem;

    .line 363
    sget-object v0, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v1, 0x7f050034

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v4, v3, v3, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    sput-object v0, Lcom/pdonlon/mines2/MainActivity;->mens2:Landroid/view/MenuItem;

    .line 364
    const/4 v0, 0x3

    sget-object v1, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v2, 0x7f05002b

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v4, v0, v3, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    sput-object v0, Lcom/pdonlon/mines2/MainActivity;->mens3:Landroid/view/MenuItem;

    .line 365
    const/4 v0, 0x4

    sget-object v1, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v2, 0x7f050024

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v4, v0, v3, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    sput-object v0, Lcom/pdonlon/mines2/MainActivity;->mens4:Landroid/view/MenuItem;

    .line 366
    const/4 v0, 0x5

    sget-object v1, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v2, 0x7f050029

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v4, v0, v3, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    sput-object v0, Lcom/pdonlon/mines2/MainActivity;->mens5:Landroid/view/MenuItem;

    .line 369
    return v5
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 353
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 356
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    const/4 v0, 0x1

    .line 406
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 408
    const/4 v0, 0x0

    .line 426
    :goto_0
    return v0

    .line 411
    :pswitch_0
    iget-object v1, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v1}, Lcom/pdonlon/mines2/DrawPanel;->showSettings()V

    goto :goto_0

    .line 414
    :pswitch_1
    iget-object v1, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v1}, Lcom/pdonlon/mines2/DrawPanel;->resetGame()V

    .line 415
    iget-object v1, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, v1, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v1}, Lcom/pdonlon/mines2/Board;->readjust()V

    goto :goto_0

    .line 418
    :pswitch_2
    iget-object v1, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v1}, Lcom/pdonlon/mines2/DrawPanel;->showNewGame()V

    goto :goto_0

    .line 421
    :pswitch_3
    iget-object v1, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v1}, Lcom/pdonlon/mines2/DrawPanel;->showAllHighScores()V

    goto :goto_0

    .line 425
    :pswitch_4
    iget-object v1, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v1}, Lcom/pdonlon/mines2/DrawPanel;->startMultiplayer()V

    goto :goto_0

    .line 406
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 286
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 287
    const-string v0, "MainActivity"

    const-string v1, "++ ON PAUSE ++"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/DrawPanel;->pauseGame()V

    .line 291
    return-void
.end method

.method public onResult(Lcom/google/android/gms/common/api/Result;)V
    .locals 0
    .parameter "result"

    .prologue
    .line 606
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 294
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 295
    const-string v0, "MainActivity"

    const-string v1, "++ ON RESUME ++"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-boolean v0, v0, Lcom/pdonlon/mines2/DrawPanel;->paused:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-boolean v0, v0, Lcom/pdonlon/mines2/DrawPanel;->pauseAlertDialogUp:Z

    if-nez v0, :cond_0

    .line 297
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/DrawPanel;->pauseMenu()V

    .line 300
    :cond_0
    return-void
.end method

.method public onSignInClicked()V
    .locals 1

    .prologue
    .line 261
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pdonlon/mines2/MainActivity;->mShouldResolve:Z

    .line 262
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->mGoogleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->connect()V

    .line 266
    return-void
.end method

.method public onSignOutClicked()V
    .locals 2

    .prologue
    .line 219
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->mGoogleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 220
    sget-object v0, Lcom/google/android/gms/plus/Plus;->AccountApi:Lcom/google/android/gms/plus/Account;

    iget-object v1, p0, Lcom/pdonlon/mines2/MainActivity;->mGoogleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0, v1}, Lcom/google/android/gms/plus/Account;->clearDefaultAccount(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    .line 221
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->mGoogleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    .line 223
    :cond_0
    invoke-direct {p0}, Lcom/pdonlon/mines2/MainActivity;->showSignedOutUI()V

    .line 224
    return-void
.end method

.method protected onStart()V
    .locals 2

    .prologue
    .line 304
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 305
    const-string v0, "MainActivity"

    const-string v1, "++ ON START ++"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->mGoogleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->connect()V

    .line 307
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 310
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 312
    const-string v0, "MainActivity"

    const-string v1, "++ ON STOP ++"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 315
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->mGoogleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 316
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->mGoogleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    .line 317
    :cond_0
    return-void
.end method

.method public startingUp()V
    .locals 1

    .prologue
    .line 442
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->setUp()V

    .line 443
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/DrawPanel;->resetGame()V

    .line 444
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->initializeBoard()V

    .line 445
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->adjustTiles()V

    .line 446
    new-instance v0, Lcom/pdonlon/mines2/MainActivity$1;

    invoke-direct {v0, p0}, Lcom/pdonlon/mines2/MainActivity$1;-><init>(Lcom/pdonlon/mines2/MainActivity;)V

    invoke-virtual {p0, v0}, Lcom/pdonlon/mines2/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 448
    return-void
.end method

.method public submitScore(Ljava/lang/Long;)V
    .locals 6
    .parameter "score"

    .prologue
    .line 228
    sget-object v1, Lcom/google/android/gms/games/Games;->Leaderboards:Lcom/google/android/gms/games/leaderboard/Leaderboards;

    iget-object v2, p0, Lcom/pdonlon/mines2/MainActivity;->mGoogleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->hmap:Ljava/util/HashMap;

    iget-object v3, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v3}, Lcom/pdonlon/mines2/DrawPanel;->getDifficulty()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-interface {v1, v2, v0, v4, v5}, Lcom/google/android/gms/games/leaderboard/Leaderboards;->submitScore(Lcom/google/android/gms/common/api/GoogleApiClient;Ljava/lang/String;J)V

    .line 229
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/DrawPanel;->getDifficulty()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/pdonlon/mines2/MainActivity;->displayLeaderboard(Ljava/lang/String;)V

    .line 230
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/DrawPanel;->setLeaderboardPressed(Z)V

    .line 231
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/DrawPanel;->determineDifficulty()V

    .line 233
    return-void
.end method

.method public updateTitleColor(Z)V
    .locals 4
    .parameter "gold"

    .prologue
    const v3, 0x7f050043

    .line 509
    if-eqz p1, :cond_0

    .line 510
    invoke-virtual {p0}, Lcom/pdonlon/mines2/MainActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<font color=\"#FFD700\">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0, v3}, Lcom/pdonlon/mines2/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</font>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 513
    :goto_0
    return-void

    .line 512
    :cond_0
    invoke-virtual {p0}, Lcom/pdonlon/mines2/MainActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {p0, v3}, Lcom/pdonlon/mines2/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
