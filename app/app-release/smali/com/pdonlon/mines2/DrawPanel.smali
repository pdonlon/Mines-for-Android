.class public Lcom/pdonlon/mines2/DrawPanel;
.super Landroid/view/View;
.source "DrawPanel.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# static fields
.field public static context:Landroid/content/Context;


# instance fields
.field animations:Z

.field bombLocationX:Landroid/content/SharedPreferences;

.field bombLocationY:Landroid/content/SharedPreferences;

.field bombXEditor:Landroid/content/SharedPreferences$Editor;

.field bombYEditor:Landroid/content/SharedPreferences$Editor;

.field bombsSurrounding:Landroid/content/SharedPreferences;

.field builder:Landroid/app/AlertDialog$Builder;

.field cellBomb:Landroid/content/SharedPreferences;

.field cellFlag:Landroid/content/SharedPreferences;

.field cellOpen:Landroid/content/SharedPreferences;

.field cellStatus:Landroid/content/SharedPreferences;

.field ctx:Landroid/content/Context;

.field df:Ljava/text/DecimalFormat;

.field df2:Ljava/text/DecimalFormat;

.field difficulty:Ljava/lang/String;

.field difficultyMap:Ljava/util/HashMap;

.field difficultySelect:I

.field dragging:Z

.field flagMode:Z

.field flags:Landroid/content/SharedPreferences;

.field gameOver:Z

.field justFlagged:Z

.field justPressedBar:Z

.field l:Ljava/lang/Thread;

.field leaderboardPressed:Z

.field longPressed:Z

.field mSelectedItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field mactivity:Lcom/pdonlon/mines2/MainActivity;

.field myDifficultiesArray:[Ljava/lang/String;

.field myHighScoresArray:[Ljava/lang/String;

.field myStringArray:[Ljava/lang/String;

.field paint:Landroid/graphics/Paint;

.field pauseAlertDialogUp:Z

.field paused:Z

.field playBoard:Lcom/pdonlon/mines2/Board;

.field pressX:F

.field pressY:F

.field s:Ljava/lang/Thread;

.field save:Landroid/content/SharedPreferences;

.field saveEditor:Landroid/content/SharedPreferences$Editor;

.field scores:Landroid/content/SharedPreferences;

.field scoresEditor:Landroid/content/SharedPreferences$Editor;

.field selected:[Z

.field selection:I

.field settings:Landroid/content/SharedPreferences;

.field settingsEditor:Landroid/content/SharedPreferences$Editor;

.field showNewHighScore:Z

.field signInButton:Lcom/google/android/gms/common/SignInButton;

.field timeCounter:F

.field timer:Ljava/util/Timer;

.field tt:Ljava/util/TimerTask;

.field vibration:Z

.field winMessage:Z

.field x:I

.field y:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/pdonlon/mines2/MainActivity;)V
    .locals 12
    .parameter "cont"
    .parameter "mactivity"

    .prologue
    .line 138
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 47
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->paint:Landroid/graphics/Paint;

    .line 48
    const/4 v3, 0x0

    iput v3, p0, Lcom/pdonlon/mines2/DrawPanel;->x:I

    .line 49
    const/4 v3, 0x0

    iput v3, p0, Lcom/pdonlon/mines2/DrawPanel;->y:I

    .line 53
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/pdonlon/mines2/DrawPanel;->gameOver:Z

    .line 56
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/pdonlon/mines2/DrawPanel;->vibration:Z

    .line 62
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/pdonlon/mines2/DrawPanel;->longPressed:Z

    .line 67
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/pdonlon/mines2/DrawPanel;->showNewHighScore:Z

    .line 68
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/pdonlon/mines2/DrawPanel;->winMessage:Z

    .line 69
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/pdonlon/mines2/DrawPanel;->animations:Z

    .line 70
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/pdonlon/mines2/DrawPanel;->leaderboardPressed:Z

    .line 76
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    iput-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->myStringArray:[Ljava/lang/String;

    .line 101
    new-instance v3, Ljava/text/DecimalFormat;

    const-string v4, "#.##"

    invoke-direct {v3, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->df:Ljava/text/DecimalFormat;

    .line 102
    new-instance v3, Ljava/text/DecimalFormat;

    const-string v4, ".##"

    invoke-direct {v3, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->df2:Ljava/text/DecimalFormat;

    .line 109
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/pdonlon/mines2/DrawPanel;->pauseAlertDialogUp:Z

    .line 139
    invoke-virtual {p0, p0}, Lcom/pdonlon/mines2/DrawPanel;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 140
    invoke-virtual {p2}, Lcom/pdonlon/mines2/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    sput-object v3, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    .line 142
    const-string v3, "DRAWPANEL REACHED"

    const-string v4, "TO ONE"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    sget-object v5, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v6, 0x7f050020

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    sget-object v5, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v6, 0x7f050027

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    sget-object v5, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v6, 0x7f050023

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    iput-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->myDifficultiesArray:[Ljava/lang/String;

    .line 146
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->difficultyMap:Ljava/util/HashMap;

    .line 147
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->difficultyMap:Ljava/util/HashMap;

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f050020

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->difficultyMap:Ljava/util/HashMap;

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f050027

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->difficultyMap:Ljava/util/HashMap;

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f050023

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->myStringArray:[Ljava/lang/String;

    const/4 v4, 0x0

    sget-object v5, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v6, 0x7f050039

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 152
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->myStringArray:[Ljava/lang/String;

    const/4 v4, 0x1

    sget-object v5, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v6, 0x7f05001e

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 155
    iput-object p1, p0, Lcom/pdonlon/mines2/DrawPanel;->ctx:Landroid/content/Context;

    .line 156
    iput-object p2, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    .line 157
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->initializeSharedPreferences()V

    .line 159
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 161
    .local v0, beforeSleep:J
    :goto_0
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->save:Landroid/content/SharedPreferences;

    const-string v4, "done saving"

    const/4 v5, 0x1

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    const-wide/16 v6, 0xfa0

    cmp-long v3, v4, v6

    if-gez v3, :cond_0

    .line 163
    const-wide/16 v4, 0x1

    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 164
    :catch_0
    move-exception v2

    .line 165
    .local v2, e:Ljava/lang/InterruptedException;
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 169
    .end local v2           #e:Ljava/lang/InterruptedException;
    :cond_0
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->save:Landroid/content/SharedPreferences;

    const-string v4, "save"

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_4

    .line 170
    sget-object v3, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v4, 0x7f050020

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    .line 174
    :goto_1
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f050020

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f050027

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f050023

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 176
    sget-object v3, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v4, 0x7f050020

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    .line 177
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    const-string v4, "saveGame"

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 178
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    const-string v4, "time"

    const/4 v5, -0x1

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 179
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 181
    :cond_1
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->startTimer()V

    .line 182
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f050020

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 184
    new-instance v3, Lcom/pdonlon/mines2/Board;

    const/16 v4, 0x9

    const/16 v5, 0x9

    invoke-direct {v3, v4, v5, p0}, Lcom/pdonlon/mines2/Board;-><init>(IILcom/pdonlon/mines2/DrawPanel;)V

    iput-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    .line 185
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Lcom/pdonlon/mines2/Board;->setTotalBombs(I)V

    .line 200
    :cond_2
    :goto_2
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Board;->setUp()V

    .line 201
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->getSettings()[Z

    move-result-object v3

    iput-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->selected:[Z

    .line 202
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->getInitialSelectedItems()Ljava/util/ArrayList;

    move-result-object v3

    iput-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->mSelectedItems:Ljava/util/ArrayList;

    .line 203
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->updateFlagMode()V

    .line 204
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->updateSettings()V

    .line 206
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->save:Landroid/content/SharedPreferences;

    const-string v4, "saveGame"

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_7

    .line 207
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Board;->initializeBoard()V

    .line 214
    :goto_3
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->settings:Landroid/content/SharedPreferences;

    const-string v4, "Version"

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    if-nez v3, :cond_3

    .line 216
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->scoresEditor:Landroid/content/SharedPreferences$Editor;

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f050020

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/pdonlon/mines2/DrawPanel;->scores:Landroid/content/SharedPreferences;

    sget-object v6, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v7, 0x7f050020

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    mul-int/lit16 v5, v5, 0x3e8

    int-to-long v6, v5

    invoke-interface {v3, v4, v6, v7}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 217
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->scoresEditor:Landroid/content/SharedPreferences$Editor;

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f050027

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/pdonlon/mines2/DrawPanel;->scores:Landroid/content/SharedPreferences;

    sget-object v6, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v7, 0x7f050027

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    mul-int/lit16 v5, v5, 0x3e8

    int-to-long v6, v5

    invoke-interface {v3, v4, v6, v7}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 218
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->scoresEditor:Landroid/content/SharedPreferences$Editor;

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f050023

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/pdonlon/mines2/DrawPanel;->scores:Landroid/content/SharedPreferences;

    sget-object v6, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v7, 0x7f050023

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    mul-int/lit16 v5, v5, 0x3e8

    int-to-long v6, v5

    invoke-interface {v3, v4, v6, v7}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 220
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->settingsEditor:Landroid/content/SharedPreferences$Editor;

    const-string v4, "Version"

    const/16 v5, 0x18

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 221
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->scoresEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 222
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->settingsEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 224
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->newFeatures()V

    .line 226
    :cond_3
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v7, 0x7f050020

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/pdonlon/mines2/DrawPanel;->df:Ljava/text/DecimalFormat;

    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->scores:Landroid/content/SharedPreferences;

    sget-object v8, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v9, 0x7f050020

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-wide/16 v10, 0x0

    invoke-interface {v7, v8, v10, v11}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v8

    long-to-double v8, v8

    const-wide v10, 0x408f400000000000L

    div-double/2addr v8, v10

    invoke-virtual {v6, v8, v9}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v7, 0x7f050054

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v7, 0x7f050027

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/pdonlon/mines2/DrawPanel;->df:Ljava/text/DecimalFormat;

    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->scores:Landroid/content/SharedPreferences;

    sget-object v8, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v9, 0x7f050027

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-wide/16 v10, 0x0

    invoke-interface {v7, v8, v10, v11}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v8

    long-to-double v8, v8

    const-wide v10, 0x408f400000000000L

    div-double/2addr v8, v10

    invoke-virtual {v6, v8, v9}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v7, 0x7f050054

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v7, 0x7f050023

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/pdonlon/mines2/DrawPanel;->df:Ljava/text/DecimalFormat;

    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->scores:Landroid/content/SharedPreferences;

    sget-object v8, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v9, 0x7f050023

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-wide/16 v10, 0x0

    invoke-interface {v7, v8, v10, v11}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v8

    long-to-double v8, v8

    const-wide v10, 0x408f400000000000L

    div-double/2addr v8, v10

    invoke-virtual {v6, v8, v9}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v7, 0x7f050054

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    iput-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->myHighScoresArray:[Ljava/lang/String;

    .line 227
    return-void

    .line 172
    :cond_4
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->save:Landroid/content/SharedPreferences;

    const-string v4, "difficulty"

    sget-object v5, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v6, 0x7f050027

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    goto/16 :goto_1

    .line 187
    :cond_5
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f050027

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 189
    new-instance v3, Lcom/pdonlon/mines2/Board;

    const/16 v4, 0x10

    const/16 v5, 0x10

    invoke-direct {v3, v4, v5, p0}, Lcom/pdonlon/mines2/Board;-><init>(IILcom/pdonlon/mines2/DrawPanel;)V

    iput-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    .line 190
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    const/16 v4, 0x28

    invoke-virtual {v3, v4}, Lcom/pdonlon/mines2/Board;->setTotalBombs(I)V

    goto/16 :goto_2

    .line 193
    :cond_6
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f050023

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 195
    new-instance v3, Lcom/pdonlon/mines2/Board;

    const/16 v4, 0x10

    const/16 v5, 0x1e

    invoke-direct {v3, v4, v5, p0}, Lcom/pdonlon/mines2/Board;-><init>(IILcom/pdonlon/mines2/DrawPanel;)V

    iput-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    .line 196
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    const/16 v4, 0x63

    invoke-virtual {v3, v4}, Lcom/pdonlon/mines2/Board;->setTotalBombs(I)V

    goto/16 :goto_2

    .line 209
    :cond_7
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-object v4, p0, Lcom/pdonlon/mines2/DrawPanel;->save:Landroid/content/SharedPreferences;

    const-string v5, "time"

    const/4 v6, -0x1

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/pdonlon/mines2/Board;->setTimeCounter(I)V

    .line 210
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->loadGame()V

    goto/16 :goto_3
.end method


# virtual methods
.method public alertTitleAndMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "title"
    .parameter "message"
    .parameter "button"

    .prologue
    .line 940
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    .line 941
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/pdonlon/mines2/DrawPanel$19;

    invoke-direct {v2, p0, p3}, Lcom/pdonlon/mines2/DrawPanel$19;-><init>(Lcom/pdonlon/mines2/DrawPanel;Ljava/lang/String;)V

    invoke-virtual {v1, p3, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 952
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 953
    .local v0, dialog:Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 954
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/pdonlon/mines2/DrawPanel;->showNewHighScore:Z

    .line 955
    return-void
.end method

.method public bombAnimation()V
    .locals 6

    .prologue
    .line 1182
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    .line 1186
    .local v1, tempDifficulty:Ljava/lang/String;
    iget-boolean v4, p0, Lcom/pdonlon/mines2/DrawPanel;->animations:Z

    if-nez v4, :cond_0

    .line 1187
    const/4 v3, 0x0

    .line 1195
    .local v3, vibrationTime:I
    :goto_0
    move v2, v3

    .line 1198
    .local v2, tempVibration:I
    new-instance v0, Ljava/lang/Thread;

    new-instance v4, Lcom/pdonlon/mines2/DrawPanel$27;

    invoke-direct {v4, p0, v2}, Lcom/pdonlon/mines2/DrawPanel$27;-><init>(Lcom/pdonlon/mines2/DrawPanel;I)V

    invoke-direct {v0, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1230
    .local v0, b:Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 1231
    return-void

    .line 1188
    .end local v0           #b:Ljava/lang/Thread;
    .end local v2           #tempVibration:I
    .end local v3           #vibrationTime:I
    :cond_0
    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f050020

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1189
    const/16 v3, 0x32

    .restart local v3       #vibrationTime:I
    goto :goto_0

    .line 1190
    .end local v3           #vibrationTime:I
    :cond_1
    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f050027

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1191
    const/16 v3, 0x19

    .restart local v3       #vibrationTime:I
    goto :goto_0

    .line 1193
    .end local v3           #vibrationTime:I
    :cond_2
    const/16 v3, 0xa

    .restart local v3       #vibrationTime:I
    goto :goto_0
.end method

.method public determineDifficulty()V
    .locals 2

    .prologue
    .line 959
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->getTotalBombs()I

    move-result v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_1

    .line 960
    sget-object v0, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v1, 0x7f050020

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    .line 965
    :cond_0
    :goto_0
    return-void

    .line 961
    :cond_1
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->getTotalBombs()I

    move-result v0

    const/16 v1, 0x28

    if-ne v0, v1, :cond_2

    .line 962
    sget-object v0, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v1, 0x7f050027

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    goto :goto_0

    .line 963
    :cond_2
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->getTotalBombs()I

    move-result v0

    const/16 v1, 0x63

    if-ne v0, v1, :cond_0

    .line 964
    sget-object v0, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v1, 0x7f050023

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    goto :goto_0
.end method

.method public explosion()V
    .locals 2

    .prologue
    .line 1235
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->openBomb()V

    .line 1236
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    new-instance v1, Lcom/pdonlon/mines2/DrawPanel$28;

    invoke-direct {v1, p0}, Lcom/pdonlon/mines2/DrawPanel$28;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1237
    return-void
.end method

.method public gameLobby()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 405
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/String;

    sget-object v1, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v2, 0x7f05004b

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v4

    const/4 v1, 0x1

    sget-object v2, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v3, 0x7f05004c

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 407
    .local v0, choices:[Ljava/lang/String;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    .line 408
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    sget-object v2, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v3, 0x7f050029

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/pdonlon/mines2/DrawPanel$3;

    invoke-direct {v2, p0}, Lcom/pdonlon/mines2/DrawPanel$3;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v1, v0, v4, v2}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    sget-object v2, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v3, 0x7f05001f

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pdonlon/mines2/DrawPanel$2;

    invoke-direct {v3, p0}, Lcom/pdonlon/mines2/DrawPanel$2;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    sget-object v2, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v3, 0x7f05002e

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pdonlon/mines2/DrawPanel$1;

    invoke-direct {v3, p0}, Lcom/pdonlon/mines2/DrawPanel$1;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 435
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 436
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 437
    return-void
.end method

.method public gameOver()Z
    .locals 1

    .prologue
    .line 1140
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->getWin()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->getLose()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1142
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pdonlon/mines2/DrawPanel;->gameOver:Z

    .line 1150
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->endTimer()V

    .line 1152
    :cond_1
    iget-boolean v0, p0, Lcom/pdonlon/mines2/DrawPanel;->gameOver:Z

    return v0
.end method

.method public gameSelect(I)V
    .locals 1
    .parameter "select"

    .prologue
    .line 505
    if-nez p1, :cond_0

    .line 506
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/MainActivity;->easyGame()V

    .line 511
    :goto_0
    return-void

    .line 507
    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 508
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/MainActivity;->mediumGame()V

    goto :goto_0

    .line 510
    :cond_1
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/MainActivity;->hardGame()V

    goto :goto_0
.end method

.method public getDifficulty()Ljava/lang/String;
    .locals 1

    .prologue
    .line 236
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    return-object v0
.end method

.method public getFlagMode()Z
    .locals 1

    .prologue
    .line 123
    iget-boolean v0, p0, Lcom/pdonlon/mines2/DrawPanel;->flagMode:Z

    return v0
.end method

.method public getGameNumber()I
    .locals 2

    .prologue
    .line 515
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->difficultyMap:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getInitialSelectedItems()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 759
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 761
    .local v1, theChosen:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel;->selected:[Z

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 762
    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel;->selected:[Z

    aget-boolean v2, v2, v0

    if-eqz v2, :cond_0

    .line 763
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 761
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 765
    :cond_1
    return-object v1
.end method

.method public getSettings()[Z
    .locals 5

    .prologue
    .line 748
    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel;->myStringArray:[Ljava/lang/String;

    array-length v2, v2

    new-array v0, v2, [Z

    .line 749
    .local v0, chosen:[Z
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel;->myStringArray:[Ljava/lang/String;

    array-length v2, v2

    if-ge v1, v2, :cond_1

    .line 750
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->settings:Landroid/content/SharedPreferences;

    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel;->myStringArray:[Ljava/lang/String;

    aget-object v4, v2, v1

    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    const/4 v2, 0x1

    :goto_1
    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    aput-boolean v2, v0, v1

    .line 749
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 750
    :cond_0
    const/4 v2, 0x0

    goto :goto_1

    .line 754
    :cond_1
    return-object v0
.end method

.method public hostGame()V
    .locals 8

    .prologue
    .line 466
    new-instance v3, Landroid/app/AlertDialog$Builder;

    iget-object v4, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    invoke-direct {v3, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    .line 467
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v4

    const-wide v6, 0x408f400000000000L

    mul-double/2addr v4, v6

    double-to-int v2, v4

    .line 470
    .local v2, randomSeed:I
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f050025

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v6, 0x7f050021

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "<br><br><h1>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->getGameNumber()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "</h1>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v6, 0x7f05003a

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 473
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    const-string v4, "Start"

    new-instance v5, Lcom/pdonlon/mines2/DrawPanel$5;

    invoke-direct {v5, p0, v2}, Lcom/pdonlon/mines2/DrawPanel$5;-><init>(Lcom/pdonlon/mines2/DrawPanel;I)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 489
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    const-string v4, "Cancel"

    new-instance v5, Lcom/pdonlon/mines2/DrawPanel$6;

    invoke-direct {v5, p0}, Lcom/pdonlon/mines2/DrawPanel$6;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 497
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 498
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    .line 499
    .local v0, d:Landroid/app/Dialog;
    const v3, 0x102000b

    invoke-virtual {v0, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 500
    .local v1, messageText:Landroid/widget/TextView;
    const/16 v3, 0x11

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 501
    return-void
.end method

.method public initializeSharedPreferences()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 714
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    const-string v1, "flags"

    invoke-virtual {v0, v1, v2}, Lcom/pdonlon/mines2/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->flags:Landroid/content/SharedPreferences;

    .line 715
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    const-string v1, "flag"

    invoke-virtual {v0, v1, v2}, Lcom/pdonlon/mines2/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->cellFlag:Landroid/content/SharedPreferences;

    .line 716
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    const-string v1, "open"

    invoke-virtual {v0, v1, v2}, Lcom/pdonlon/mines2/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->cellOpen:Landroid/content/SharedPreferences;

    .line 717
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    const-string v1, "bomb"

    invoke-virtual {v0, v1, v2}, Lcom/pdonlon/mines2/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->cellBomb:Landroid/content/SharedPreferences;

    .line 719
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    const-string v1, "bombsSurrounding"

    invoke-virtual {v0, v1, v2}, Lcom/pdonlon/mines2/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->bombsSurrounding:Landroid/content/SharedPreferences;

    .line 720
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    const-string v1, "settings"

    invoke-virtual {v0, v1, v2}, Lcom/pdonlon/mines2/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->settings:Landroid/content/SharedPreferences;

    .line 721
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    const-string v1, "scores"

    invoke-virtual {v0, v1, v2}, Lcom/pdonlon/mines2/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->scores:Landroid/content/SharedPreferences;

    .line 722
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    const-string v1, "cellStatus"

    invoke-virtual {v0, v1, v2}, Lcom/pdonlon/mines2/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->cellStatus:Landroid/content/SharedPreferences;

    .line 723
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    const-string v1, "save"

    invoke-virtual {v0, v1, v2}, Lcom/pdonlon/mines2/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->save:Landroid/content/SharedPreferences;

    .line 724
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    const-string v1, "bombLocationX"

    invoke-virtual {v0, v1, v2}, Lcom/pdonlon/mines2/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->bombLocationX:Landroid/content/SharedPreferences;

    .line 725
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    const-string v1, "bombLocationY"

    invoke-virtual {v0, v1, v2}, Lcom/pdonlon/mines2/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->bombLocationY:Landroid/content/SharedPreferences;

    .line 727
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->settings:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->settingsEditor:Landroid/content/SharedPreferences$Editor;

    .line 728
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->scores:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->scoresEditor:Landroid/content/SharedPreferences$Editor;

    .line 729
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->save:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    .line 730
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->bombLocationX:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->bombXEditor:Landroid/content/SharedPreferences$Editor;

    .line 731
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->bombLocationY:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->bombYEditor:Landroid/content/SharedPreferences$Editor;

    .line 732
    return-void
.end method

.method public isLeaderboardPressed()Z
    .locals 1

    .prologue
    .line 113
    iget-boolean v0, p0, Lcom/pdonlon/mines2/DrawPanel;->leaderboardPressed:Z

    return v0
.end method

.method public joinGame()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, -0x1

    .line 521
    new-instance v3, Landroid/app/AlertDialog$Builder;

    iget-object v4, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    invoke-direct {v3, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    .line 525
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f05004d

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f050047

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 527
    new-instance v1, Landroid/widget/EditText;

    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    invoke-direct {v1, v3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 528
    .local v1, input:Landroid/widget/EditText;
    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setInputType(I)V

    .line 529
    invoke-virtual {v1, v7}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 530
    invoke-virtual {v1, v7}, Landroid/widget/EditText;->setFocusable(Z)V

    .line 531
    invoke-virtual {v1}, Landroid/widget/EditText;->requestFocus()Z

    .line 532
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f05004a

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "..."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 534
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 537
    .local v2, lp:Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 538
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v3, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 541
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    const-string v4, "Start"

    new-instance v5, Lcom/pdonlon/mines2/DrawPanel$7;

    invoke-direct {v5, p0, v1}, Lcom/pdonlon/mines2/DrawPanel$7;-><init>(Lcom/pdonlon/mines2/DrawPanel;Landroid/widget/EditText;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 574
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    const-string v4, "Cancel"

    new-instance v5, Lcom/pdonlon/mines2/DrawPanel$8;

    invoke-direct {v5, p0}, Lcom/pdonlon/mines2/DrawPanel$8;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 584
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 585
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    .line 586
    .local v0, ad:Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/4 v4, 0x5

    invoke-virtual {v3, v4}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 589
    return-void
.end method

.method public loadGame()V
    .locals 2

    .prologue
    .line 677
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/pdonlon/mines2/DrawPanel$10;

    invoke-direct {v1, p0}, Lcom/pdonlon/mines2/DrawPanel$10;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->l:Ljava/lang/Thread;

    .line 707
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->l:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 708
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->invalidate()V

    .line 710
    return-void
.end method

.method public makeToast(Ljava/lang/String;)V
    .locals 4
    .parameter "message"

    .prologue
    .line 1062
    move-object v1, p1

    .line 1063
    .local v1, text:Ljava/lang/CharSequence;
    const/4 v0, 0x0

    .line 1065
    .local v0, duration:I
    sget-object v3, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    invoke-static {v3, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 1067
    .local v2, toast:Landroid/widget/Toast;
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 1068
    return-void
.end method

.method public newFeatures()V
    .locals 4

    .prologue
    .line 441
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    .line 442
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    sget-object v1, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v2, 0x7f05002a

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\n\u2022   "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v3, 0x7f050030

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n\n\u2022   "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v3, 0x7f050033

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n\n\u2022   "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v3, 0x7f05002d

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n\n\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v3, 0x7f050028

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget-object v1, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v2, 0x7f05002f

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/pdonlon/mines2/DrawPanel$4;

    invoke-direct {v2, p0}, Lcom/pdonlon/mines2/DrawPanel$4;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 454
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 455
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 456
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1
    .parameter "g"

    .prologue
    .line 241
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0, p1}, Lcom/pdonlon/mines2/Board;->paintBoard(Landroid/graphics/Canvas;)V

    .line 243
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 11
    .parameter "v"
    .parameter "e"

    .prologue
    const/high16 v9, 0x4000

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 248
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v8}, Lcom/pdonlon/mines2/Board;->getOffX()F

    move-result v8

    sub-float/2addr v7, v8

    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget v8, v8, Lcom/pdonlon/mines2/Board;->tileSize:F

    div-float v1, v7, v8

    .line 249
    .local v1, x:F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v8}, Lcom/pdonlon/mines2/Board;->getOffY()F

    move-result v8

    sub-float/2addr v7, v8

    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget v8, v8, Lcom/pdonlon/mines2/Board;->tileSize:F

    div-float v3, v7, v8

    .line 251
    .local v3, y:F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .line 252
    .local v2, x2:F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    .line 254
    .local v4, y2:F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v7

    if-nez v7, :cond_6

    sget-boolean v7, Lcom/pdonlon/mines2/Board;->doneAnimating:Z

    if-eqz v7, :cond_6

    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget v7, v7, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    cmpl-float v7, v4, v7

    if-ltz v7, :cond_6

    .line 257
    iput-boolean v6, p0, Lcom/pdonlon/mines2/DrawPanel;->justPressedBar:Z

    .line 259
    sget v7, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v7, v7, 0x4

    div-int/lit8 v7, v7, 0x5

    int-to-float v7, v7

    cmpl-float v7, v2, v7

    if-ltz v7, :cond_2

    .line 260
    iget-object v5, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v7}, Lcom/pdonlon/mines2/Board;->getWidth()I

    move-result v7

    int-to-float v7, v7

    div-float/2addr v7, v9

    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v8}, Lcom/pdonlon/mines2/Board;->getHeight()I

    move-result v8

    int-to-float v8, v8

    div-float/2addr v8, v9

    invoke-virtual {v5, v7, v8}, Lcom/pdonlon/mines2/Board;->zoomIn(FF)V

    .line 277
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->invalidate()V

    .line 393
    :cond_1
    :goto_1
    return v6

    .line 261
    :cond_2
    sget v7, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v7, v7, 0x3

    div-int/lit8 v7, v7, 0x5

    int-to-float v7, v7

    cmpl-float v7, v2, v7

    if-ltz v7, :cond_3

    .line 262
    iget-object v5, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v7}, Lcom/pdonlon/mines2/Board;->getWidth()I

    move-result v7

    int-to-float v7, v7

    div-float/2addr v7, v9

    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v8}, Lcom/pdonlon/mines2/Board;->getHeight()I

    move-result v8

    int-to-float v8, v8

    div-float/2addr v8, v9

    invoke-virtual {v5, v7, v8}, Lcom/pdonlon/mines2/Board;->zoomOut(FF)V

    goto :goto_0

    .line 263
    :cond_3
    sget v7, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v7, v7, 0x2

    div-int/lit8 v7, v7, 0x5

    int-to-float v7, v7

    cmpl-float v7, v2, v7

    if-ltz v7, :cond_5

    .line 265
    iget-boolean v7, p0, Lcom/pdonlon/mines2/DrawPanel;->flagMode:Z

    if-nez v7, :cond_4

    move v5, v6

    :cond_4
    iput-boolean v5, p0, Lcom/pdonlon/mines2/DrawPanel;->flagMode:Z

    .line 266
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->saveFlagMode()V

    goto :goto_0

    .line 269
    :cond_5
    sget v7, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v7, v7, 0x1

    div-int/lit8 v7, v7, 0x5

    int-to-float v7, v7

    cmpg-float v7, v2, v7

    if-gez v7, :cond_1

    .line 271
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->save:Landroid/content/SharedPreferences;

    const-string v8, "gameInProgress"

    invoke-interface {v7, v8, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 272
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->pauseMenu()V

    goto :goto_0

    .line 282
    :cond_6
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v7

    if-nez v7, :cond_7

    sget-boolean v7, Lcom/pdonlon/mines2/Board;->doneAnimating:Z

    if-eqz v7, :cond_7

    iget-boolean v7, p0, Lcom/pdonlon/mines2/DrawPanel;->paused:Z

    if-eqz v7, :cond_7

    .line 284
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->resumeGame()V

    goto :goto_1

    .line 288
    :cond_7
    sget-boolean v7, Lcom/pdonlon/mines2/Board;->doneAnimating:Z

    if-eqz v7, :cond_1

    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    float-to-int v8, v1

    float-to-int v9, v3

    invoke-virtual {v7, v8, v9}, Lcom/pdonlon/mines2/Board;->isValid(II)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 290
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v7

    if-nez v7, :cond_9

    .line 293
    iput-boolean v5, p0, Lcom/pdonlon/mines2/DrawPanel;->justPressedBar:Z

    .line 294
    iput-boolean v5, p0, Lcom/pdonlon/mines2/DrawPanel;->justFlagged:Z

    .line 295
    const/4 v7, 0x0

    iput v7, p0, Lcom/pdonlon/mines2/DrawPanel;->timeCounter:F

    .line 297
    iput-boolean v5, p0, Lcom/pdonlon/mines2/DrawPanel;->dragging:Z

    .line 298
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v8}, Lcom/pdonlon/mines2/Board;->getOffX()F

    move-result v8

    sub-float/2addr v7, v8

    iput v7, p0, Lcom/pdonlon/mines2/DrawPanel;->pressX:F

    .line 299
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v8}, Lcom/pdonlon/mines2/Board;->getOffY()F

    move-result v8

    sub-float/2addr v7, v8

    iput v7, p0, Lcom/pdonlon/mines2/DrawPanel;->pressY:F

    .line 301
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v7}, Lcom/pdonlon/mines2/Board;->removeHint()V

    .line 303
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v7, v5}, Lcom/pdonlon/mines2/Board;->setPressed(Z)V

    .line 305
    iget-object v5, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    float-to-int v7, v1

    float-to-int v8, v3

    invoke-virtual {v5, v7, v8}, Lcom/pdonlon/mines2/Board;->isValid(II)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 307
    iget-object v5, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    float-to-int v7, v1

    float-to-int v8, v3

    invoke-virtual {v5, v7, v8}, Lcom/pdonlon/mines2/Board;->setPressedCords(II)V

    .line 308
    iget-object v5, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v5, v6}, Lcom/pdonlon/mines2/Board;->setPressed(Z)V

    .line 309
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->invalidate()V

    .line 312
    :cond_8
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v7}, Lcom/pdonlon/mines2/Board;->getOffX()F

    move-result v7

    sub-float v0, v5, v7

    .line 313
    .local v0, pressX:F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v7}, Lcom/pdonlon/mines2/Board;->getOffY()F

    move-result v7

    sub-float/2addr v5, v7

    .line 315
    goto/16 :goto_1

    .line 317
    .end local v0           #pressX:F
    :cond_9
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v7

    if-ne v7, v6, :cond_11

    .line 320
    iget-boolean v7, p0, Lcom/pdonlon/mines2/DrawPanel;->dragging:Z

    if-nez v7, :cond_10

    iget-boolean v7, p0, Lcom/pdonlon/mines2/DrawPanel;->justFlagged:Z

    if-nez v7, :cond_10

    iget-boolean v7, p0, Lcom/pdonlon/mines2/DrawPanel;->justPressedBar:Z

    if-nez v7, :cond_10

    .line 322
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v7}, Lcom/pdonlon/mines2/Board;->getPressedCords()[I

    move-result-object v7

    aget v7, v7, v5

    int-to-float v1, v7

    .line 323
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v7}, Lcom/pdonlon/mines2/Board;->getPressedCords()[I

    move-result-object v7

    aget v7, v7, v6

    int-to-float v3, v7

    .line 325
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    float-to-int v8, v1

    float-to-int v9, v3

    invoke-virtual {v7, v8, v9}, Lcom/pdonlon/mines2/Board;->isValid(II)Z

    move-result v7

    if-eqz v7, :cond_c

    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-boolean v7, v7, Lcom/pdonlon/mines2/Board;->beingPressed:Z

    if-eqz v7, :cond_c

    .line 327
    iget-boolean v7, p0, Lcom/pdonlon/mines2/DrawPanel;->gameOver:Z

    if-eqz v7, :cond_d

    .line 328
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->resetGame()V

    .line 341
    :cond_a
    :goto_2
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v7}, Lcom/pdonlon/mines2/Board;->checkWin()V

    .line 343
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-boolean v7, v7, Lcom/pdonlon/mines2/Board;->win:Z

    if-eqz v7, :cond_b

    .line 345
    iget-boolean v7, p0, Lcom/pdonlon/mines2/DrawPanel;->winMessage:Z

    if-eqz v7, :cond_b

    .line 346
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->winMessage()V

    .line 348
    :cond_b
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-boolean v7, v7, Lcom/pdonlon/mines2/Board;->lose:Z

    if-eqz v7, :cond_c

    .line 349
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v7, v5}, Lcom/pdonlon/mines2/Board;->setPressed(Z)V

    .line 350
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->bombAnimation()V

    .line 354
    :cond_c
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v7, v5}, Lcom/pdonlon/mines2/Board;->setPressed(Z)V

    .line 355
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->invalidate()V

    goto/16 :goto_1

    .line 330
    :cond_d
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    float-to-int v8, v1

    float-to-int v9, v3

    const-string v10, "open"

    invoke-virtual {v7, v8, v9, v10}, Lcom/pdonlon/mines2/Board;->isThis(IILjava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_e

    iget-boolean v7, p0, Lcom/pdonlon/mines2/DrawPanel;->flagMode:Z

    if-nez v7, :cond_e

    .line 331
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    float-to-int v8, v1

    float-to-int v9, v3

    invoke-virtual {v7, v8, v9}, Lcom/pdonlon/mines2/Board;->open(II)V

    goto :goto_2

    .line 333
    :cond_e
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    float-to-int v8, v1

    float-to-int v9, v3

    const-string v10, "open"

    invoke-virtual {v7, v8, v9, v10}, Lcom/pdonlon/mines2/Board;->isThis(IILjava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_f

    .line 334
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    float-to-int v8, v1

    float-to-int v9, v3

    invoke-virtual {v7, v8, v9}, Lcom/pdonlon/mines2/Board;->fastClick(II)V

    goto :goto_2

    .line 336
    :cond_f
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    float-to-int v8, v1

    float-to-int v9, v3

    const-string v10, "open"

    invoke-virtual {v7, v8, v9, v10}, Lcom/pdonlon/mines2/Board;->isThis(IILjava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_a

    iget-boolean v7, p0, Lcom/pdonlon/mines2/DrawPanel;->flagMode:Z

    if-eqz v7, :cond_a

    .line 338
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    float-to-int v8, v1

    float-to-int v9, v3

    invoke-virtual {v7, v8, v9}, Lcom/pdonlon/mines2/Board;->markFlagged(II)V

    goto :goto_2

    .line 359
    :cond_10
    iput-boolean v5, p0, Lcom/pdonlon/mines2/DrawPanel;->dragging:Z

    goto/16 :goto_1

    .line 362
    :cond_11
    iget-boolean v7, p0, Lcom/pdonlon/mines2/DrawPanel;->justFlagged:Z

    if-nez v7, :cond_1

    iget-boolean v7, p0, Lcom/pdonlon/mines2/DrawPanel;->justPressedBar:Z

    if-nez v7, :cond_1

    .line 364
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v7}, Lcom/pdonlon/mines2/Board;->getPressedCords()[I

    move-result-object v7

    aget v7, v7, v5

    int-to-float v1, v7

    .line 365
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v7}, Lcom/pdonlon/mines2/Board;->getPressedCords()[I

    move-result-object v7

    aget v7, v7, v6

    int-to-float v3, v7

    .line 367
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v7}, Lcom/pdonlon/mines2/Board;->getZoom()I

    move-result v7

    const/4 v8, -0x5

    if-le v7, v8, :cond_1

    .line 369
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    .line 370
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    .line 372
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v8}, Lcom/pdonlon/mines2/Board;->getOffX()F

    move-result v8

    sub-float/2addr v8, v1

    invoke-virtual {v7, v8}, Lcom/pdonlon/mines2/Board;->setDiffX(F)V

    .line 373
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v8}, Lcom/pdonlon/mines2/Board;->getOffY()F

    move-result v8

    sub-float/2addr v8, v3

    invoke-virtual {v7, v8}, Lcom/pdonlon/mines2/Board;->setDiffY(F)V

    .line 375
    iget-boolean v7, p0, Lcom/pdonlon/mines2/DrawPanel;->dragging:Z

    if-nez v7, :cond_13

    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v7}, Lcom/pdonlon/mines2/Board;->getDiffX()F

    move-result v7

    iget v8, p0, Lcom/pdonlon/mines2/DrawPanel;->pressX:F

    add-float/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v8}, Lcom/pdonlon/mines2/Board;->getTileSize()F

    move-result v8

    cmpl-float v7, v7, v8

    if-gtz v7, :cond_12

    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v7}, Lcom/pdonlon/mines2/Board;->getDiffY()F

    move-result v7

    iget v8, p0, Lcom/pdonlon/mines2/DrawPanel;->pressY:F

    add-float/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v8}, Lcom/pdonlon/mines2/Board;->getTileSize()F

    move-result v8

    cmpl-float v7, v7, v8

    if-lez v7, :cond_13

    .line 376
    :cond_12
    iput-boolean v6, p0, Lcom/pdonlon/mines2/DrawPanel;->dragging:Z

    .line 377
    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v7, v5}, Lcom/pdonlon/mines2/Board;->setPressed(Z)V

    .line 380
    :cond_13
    iget-boolean v5, p0, Lcom/pdonlon/mines2/DrawPanel;->dragging:Z

    if-eqz v5, :cond_14

    .line 381
    iget-object v5, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v7}, Lcom/pdonlon/mines2/Board;->getOffX()F

    move-result v7

    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v8}, Lcom/pdonlon/mines2/Board;->getDiffX()F

    move-result v8

    sub-float/2addr v7, v8

    iget v8, p0, Lcom/pdonlon/mines2/DrawPanel;->pressX:F

    sub-float/2addr v7, v8

    invoke-virtual {v5, v7}, Lcom/pdonlon/mines2/Board;->setOffX(F)V

    .line 382
    iget-object v5, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-object v7, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v7}, Lcom/pdonlon/mines2/Board;->getOffY()F

    move-result v7

    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v8}, Lcom/pdonlon/mines2/Board;->getDiffY()F

    move-result v8

    sub-float/2addr v7, v8

    iget v8, p0, Lcom/pdonlon/mines2/DrawPanel;->pressY:F

    sub-float/2addr v7, v8

    invoke-virtual {v5, v7}, Lcom/pdonlon/mines2/Board;->setOffY(F)V

    .line 386
    :cond_14
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->invalidate()V

    goto/16 :goto_1
.end method

.method public openingMessage()V
    .locals 0

    .prologue
    .line 461
    return-void
.end method

.method public pauseGame()V
    .locals 3

    .prologue
    .line 911
    iget-boolean v0, p0, Lcom/pdonlon/mines2/DrawPanel;->paused:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->save:Landroid/content/SharedPreferences;

    const-string v1, "gameInProgress"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/pdonlon/mines2/DrawPanel;->gameOver:Z

    if-nez v0, :cond_0

    .line 913
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    const-string v1, "time"

    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Board;->getTimeCounter()I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 914
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 915
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->endTimer()V

    .line 916
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pdonlon/mines2/DrawPanel;->paused:Z

    .line 917
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->invalidate()V

    .line 919
    :cond_0
    return-void
.end method

.method public pauseMenu()V
    .locals 3

    .prologue
    .line 786
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->pauseGame()V

    .line 787
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pdonlon/mines2/DrawPanel;->pauseAlertDialogUp:Z

    .line 788
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    .line 790
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    sget-object v1, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v2, 0x7f050032

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget-object v1, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v2, 0x7f050035

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/pdonlon/mines2/DrawPanel$12;

    invoke-direct {v2, p0}, Lcom/pdonlon/mines2/DrawPanel$12;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget-object v1, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v2, 0x7f050034

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/pdonlon/mines2/DrawPanel$11;

    invoke-direct {v2, p0}, Lcom/pdonlon/mines2/DrawPanel$11;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 805
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 806
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 808
    return-void
.end method

.method public quitMenu()V
    .locals 0

    .prologue
    .line 812
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->saveGame()V

    .line 813
    return-void
.end method

.method public resetGame()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 1162
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->doneAnimating()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1164
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    const-wide v2, 0x4070e00000000000L

    invoke-static {v2, v3}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/pdonlon/mines2/Board;->setTheta(D)V

    .line 1165
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0, v4}, Lcom/pdonlon/mines2/Board;->setTimeCounter(I)V

    .line 1166
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/Board;->setSeed(I)V

    .line 1167
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->startup()V

    .line 1168
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->wipeBoard()V

    .line 1169
    iput-boolean v4, p0, Lcom/pdonlon/mines2/DrawPanel;->gameOver:Z

    .line 1171
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->endTimer()V

    .line 1172
    iput-boolean v4, p0, Lcom/pdonlon/mines2/DrawPanel;->paused:Z

    .line 1173
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    const-string v1, "gameInProgress"

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1174
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    const-string v1, "saveGame"

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1175
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1176
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->invalidate()V

    .line 1178
    :cond_0
    return-void
.end method

.method public resumeGame()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 923
    iget-boolean v0, p0, Lcom/pdonlon/mines2/DrawPanel;->gameOver:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->save:Landroid/content/SharedPreferences;

    const-string v1, "gameInProgress"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 925
    iput-boolean v2, p0, Lcom/pdonlon/mines2/DrawPanel;->pauseAlertDialogUp:Z

    .line 926
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->startTimer()V

    .line 927
    iput-boolean v2, p0, Lcom/pdonlon/mines2/DrawPanel;->paused:Z

    .line 928
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->invalidate()V

    .line 930
    :cond_0
    return-void
.end method

.method public save(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;I)V
    .locals 0
    .parameter "editor"
    .parameter "key"
    .parameter "value"

    .prologue
    .line 668
    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 669
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 670
    return-void
.end method

.method public saveChecks()V
    .locals 4

    .prologue
    .line 770
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->selected:[Z

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 771
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->settingsEditor:Landroid/content/SharedPreferences$Editor;

    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel;->myStringArray:[Ljava/lang/String;

    aget-object v2, v2, v0

    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->selected:[Z

    aget-boolean v3, v3, v0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 770
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 772
    :cond_0
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->settingsEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 773
    return-void
.end method

.method public saveFlagMode()V
    .locals 3

    .prologue
    .line 736
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->flags:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 737
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v1, "flagMode"

    iget-boolean v2, p0, Lcom/pdonlon/mines2/DrawPanel;->flagMode:Z

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 738
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 739
    return-void
.end method

.method public saveGame()V
    .locals 4

    .prologue
    .line 606
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    const-string v2, "done saving"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 607
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 610
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/pdonlon/mines2/DrawPanel$9;

    invoke-direct {v1, p0}, Lcom/pdonlon/mines2/DrawPanel$9;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 663
    .local v0, s:Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 664
    return-void
.end method

.method public saveGameInProgress(Z)V
    .locals 2
    .parameter "inProgress"

    .prologue
    .line 934
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    const-string v1, "gameInProgress"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 935
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 936
    return-void
.end method

.method public setDifficulty(Ljava/lang/String;)V
    .locals 0
    .parameter "a"

    .prologue
    .line 231
    iput-object p1, p0, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    .line 232
    return-void
.end method

.method public setFlagMode(Z)V
    .locals 0
    .parameter "a"

    .prologue
    .line 128
    iput-boolean p1, p0, Lcom/pdonlon/mines2/DrawPanel;->flagMode:Z

    .line 129
    return-void
.end method

.method public setGameOver(Z)V
    .locals 0
    .parameter "a"

    .prologue
    .line 1157
    iput-boolean p1, p0, Lcom/pdonlon/mines2/DrawPanel;->gameOver:Z

    .line 1158
    return-void
.end method

.method public setLeaderboardPressed(Z)V
    .locals 0
    .parameter "pressed"

    .prologue
    .line 118
    iput-boolean p1, p0, Lcom/pdonlon/mines2/DrawPanel;->leaderboardPressed:Z

    .line 119
    return-void
.end method

.method public setWinMessage(Z)V
    .locals 0
    .parameter "a"

    .prologue
    .line 133
    iput-boolean p1, p0, Lcom/pdonlon/mines2/DrawPanel;->winMessage:Z

    .line 134
    return-void
.end method

.method public showAllHighScores()V
    .locals 5

    .prologue
    .line 1015
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/pdonlon/mines2/DrawPanel;->pauseAlertDialogUp:Z

    .line 1016
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->pauseGame()V

    .line 1018
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->getGameNumber()I

    move-result v1

    iput v1, p0, Lcom/pdonlon/mines2/DrawPanel;->difficultySelect:I

    .line 1020
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    .line 1022
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    sget-object v2, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v3, 0x7f050024

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel;->myHighScoresArray:[Ljava/lang/String;

    iget v3, p0, Lcom/pdonlon/mines2/DrawPanel;->difficultySelect:I

    new-instance v4, Lcom/pdonlon/mines2/DrawPanel$25;

    invoke-direct {v4, p0}, Lcom/pdonlon/mines2/DrawPanel$25;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v1, v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    sget-object v2, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v3, 0x7f05001f

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pdonlon/mines2/DrawPanel$24;

    invoke-direct {v3, p0}, Lcom/pdonlon/mines2/DrawPanel$24;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    sget-object v2, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v3, 0x7f050026

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pdonlon/mines2/DrawPanel$23;

    invoke-direct {v3, p0}, Lcom/pdonlon/mines2/DrawPanel$23;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1054
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 1055
    .local v0, dialog:Landroid/app/AlertDialog;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setCancelable(Z)V

    .line 1057
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 1058
    return-void
.end method

.method public showNewGame()V
    .locals 4

    .prologue
    .line 870
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pdonlon/mines2/DrawPanel;->pauseAlertDialogUp:Z

    .line 871
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->pauseGame()V

    .line 873
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->getGameNumber()I

    move-result v0

    iput v0, p0, Lcom/pdonlon/mines2/DrawPanel;->difficultySelect:I

    .line 875
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    .line 877
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    sget-object v1, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v2, 0x7f05002b

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->myDifficultiesArray:[Ljava/lang/String;

    iget v2, p0, Lcom/pdonlon/mines2/DrawPanel;->difficultySelect:I

    new-instance v3, Lcom/pdonlon/mines2/DrawPanel$18;

    invoke-direct {v3, p0}, Lcom/pdonlon/mines2/DrawPanel$18;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget-object v1, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v2, 0x7f050038

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/pdonlon/mines2/DrawPanel$17;

    invoke-direct {v2, p0}, Lcom/pdonlon/mines2/DrawPanel$17;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget-object v1, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v2, 0x7f05001f

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/pdonlon/mines2/DrawPanel$16;

    invoke-direct {v2, p0}, Lcom/pdonlon/mines2/DrawPanel$16;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 904
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 905
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 907
    return-void
.end method

.method public showSettings()V
    .locals 8

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    .line 817
    iput-boolean v5, p0, Lcom/pdonlon/mines2/DrawPanel;->pauseAlertDialogUp:Z

    .line 818
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->pauseGame()V

    .line 820
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->selected:[Z

    array-length v3, v3

    if-ge v1, v3, :cond_0

    .line 821
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->selected:[Z

    aput-boolean v7, v3, v1

    .line 820
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 823
    :cond_0
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->mSelectedItems:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 824
    .local v0, e:Ljava/lang/Integer;
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->selected:[Z

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aput-boolean v5, v3, v4

    goto :goto_1

    .line 826
    .end local v0           #e:Ljava/lang/Integer;
    :cond_1
    new-instance v3, Landroid/app/AlertDialog$Builder;

    iget-object v4, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    invoke-direct {v3, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    .line 828
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f050037

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/pdonlon/mines2/DrawPanel;->myStringArray:[Ljava/lang/String;

    iget-object v5, p0, Lcom/pdonlon/mines2/DrawPanel;->selected:[Z

    new-instance v6, Lcom/pdonlon/mines2/DrawPanel$15;

    invoke-direct {v6, p0}, Lcom/pdonlon/mines2/DrawPanel$15;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v3, v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f050036

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/pdonlon/mines2/DrawPanel$14;

    invoke-direct {v5, p0}, Lcom/pdonlon/mines2/DrawPanel$14;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f05001f

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/pdonlon/mines2/DrawPanel$13;

    invoke-direct {v5, p0}, Lcom/pdonlon/mines2/DrawPanel$13;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 863
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v3, v7}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 864
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 866
    return-void
.end method

.method public startMultiplayer()V
    .locals 1

    .prologue
    .line 398
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pdonlon/mines2/DrawPanel;->pauseAlertDialogUp:Z

    .line 399
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->pauseGame()V

    .line 400
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->gameLobby()V

    .line 401
    return-void
.end method

.method public startTimer()V
    .locals 6

    .prologue
    .line 1072
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->timer:Ljava/util/Timer;

    .line 1074
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->timer:Ljava/util/Timer;

    new-instance v1, Lcom/pdonlon/mines2/DrawPanel$26;

    invoke-direct {v1, p0}, Lcom/pdonlon/mines2/DrawPanel$26;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0xa

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 1136
    return-void
.end method

.method public updateFlagMode()V
    .locals 3

    .prologue
    .line 743
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->flags:Landroid/content/SharedPreferences;

    const-string v1, "flagMode"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/pdonlon/mines2/DrawPanel;->flagMode:Z

    .line 744
    return-void
.end method

.method public updateScores(J)V
    .locals 11
    .parameter "score"

    .prologue
    const-wide/16 v8, 0x0

    .line 595
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->scores:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    invoke-interface {v0, v1, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->scores:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    invoke-interface {v0, v1, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    cmp-long v0, v0, v8

    if-nez v0, :cond_1

    .line 597
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pdonlon/mines2/DrawPanel;->showNewHighScore:Z

    .line 598
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->scoresEditor:Landroid/content/SharedPreferences$Editor;

    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    invoke-interface {v0, v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 599
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->scoresEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 600
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->myHighScoresArray:[Ljava/lang/String;

    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->getGameNumber()I

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->myDifficultiesArray:[Ljava/lang/String;

    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->getGameNumber()I

    move-result v4

    aget-object v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->df:Ljava/text/DecimalFormat;

    iget-object v4, p0, Lcom/pdonlon/mines2/DrawPanel;->scores:Landroid/content/SharedPreferences;

    iget-object v5, p0, Lcom/pdonlon/mines2/DrawPanel;->myDifficultiesArray:[Ljava/lang/String;

    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->getGameNumber()I

    move-result v6

    aget-object v5, v5, v6

    invoke-interface {v4, v5, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    long-to-double v4, v4

    const-wide v6, 0x408f400000000000L

    div-double/2addr v4, v6

    invoke-virtual {v3, v4, v5}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v4, 0x7f050054

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 602
    :cond_1
    return-void
.end method

.method public updateSettings()V
    .locals 2

    .prologue
    .line 777
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->selected:[Z

    const/4 v1, 0x0

    aget-boolean v0, v0, v1

    iput-boolean v0, p0, Lcom/pdonlon/mines2/DrawPanel;->vibration:Z

    .line 778
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel;->selected:[Z

    const/4 v1, 0x1

    aget-boolean v0, v0, v1

    iput-boolean v0, p0, Lcom/pdonlon/mines2/DrawPanel;->animations:Z

    .line 781
    invoke-virtual {p0}, Lcom/pdonlon/mines2/DrawPanel;->invalidate()V

    .line 782
    return-void
.end method

.method public winMessage()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 969
    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    .line 973
    iget-boolean v2, p0, Lcom/pdonlon/mines2/DrawPanel;->showNewHighScore:Z

    if-eqz v2, :cond_0

    .line 974
    sget-object v2, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v3, 0x7f05002c

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 978
    .local v1, title:Ljava/lang/String;
    :goto_0
    iput-boolean v10, p0, Lcom/pdonlon/mines2/DrawPanel;->showNewHighScore:Z

    .line 980
    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v4}, Lcom/pdonlon/mines2/Board;->getTimeCounter()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/pdonlon/mines2/DrawPanel;->df2:Ljava/text/DecimalFormat;

    iget-object v5, p0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v5}, Lcom/pdonlon/mines2/Board;->getMillisecondsCounter()J

    move-result-wide v6

    long-to-double v6, v6

    const-wide v8, 0x408f400000000000L

    div-double/2addr v6, v8

    invoke-virtual {v4, v6, v7}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v5, 0x7f050054

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    sget-object v3, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v4, 0x7f05002f

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/pdonlon/mines2/DrawPanel$22;

    invoke-direct {v4, p0}, Lcom/pdonlon/mines2/DrawPanel$22;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    sget-object v3, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v4, 0x7f050026

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/pdonlon/mines2/DrawPanel$21;

    invoke-direct {v4, p0}, Lcom/pdonlon/mines2/DrawPanel$21;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    sget-object v3, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v4, 0x7f050034

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/pdonlon/mines2/DrawPanel$20;

    invoke-direct {v4, p0}, Lcom/pdonlon/mines2/DrawPanel$20;-><init>(Lcom/pdonlon/mines2/DrawPanel;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1006
    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v2, v10}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 1008
    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 1009
    .local v0, dialog:Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 1010
    iput-boolean v10, p0, Lcom/pdonlon/mines2/DrawPanel;->winMessage:Z

    .line 1011
    return-void

    .line 976
    .end local v0           #dialog:Landroid/app/AlertDialog;
    .end local v1           #title:Ljava/lang/String;
    :cond_0
    sget-object v2, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v3, 0x7f05003b

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .restart local v1       #title:Ljava/lang/String;
    goto/16 :goto_0
.end method
