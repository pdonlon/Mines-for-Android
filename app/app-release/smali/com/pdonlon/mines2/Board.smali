.class public Lcom/pdonlon/mines2/Board;
.super Ljava/lang/Object;
.source "Board.java"


# static fields
.field static doneAnimating:Z

.field static pro:Z

.field static tf:Landroid/graphics/Typeface;

.field public static timer:Ljava/util/Timer;


# instance fields
.field actionAndStatus:I

.field barHeight:I

.field beingPressed:Z

.field board:[[Lcom/pdonlon/mines2/Mine;

.field bombs:Lcom/pdonlon/mines2/CheckList;

.field checkBoard:Z

.field clockHandX1:F

.field clockHandY1:F

.field color1:I

.field color2:I

.field color3:I

.field colors1:I

.field colors2:I

.field diffX:F

.field diffY:F

.field f:Ljava/lang/Thread;

.field fast:Lcom/pdonlon/mines2/CheckList;

.field fastCount:I

.field firstTurn:Z

.field flagCount:I

.field flagLimit:I

.field game:Lcom/pdonlon/mines2/DrawPanel;

.field height:I

.field hintColorYellow:Z

.field lose:Z

.field millisecondsCounter:J

.field millisecondsStart:J

.field offX:F

.field offY:F

.field paint:Landroid/graphics/Paint;

.field pressed:Lcom/pdonlon/mines2/CheckList;

.field pressedCords:[I

.field push:F

.field realBarHeight:F

.field seed:I

.field shader:Landroid/graphics/Shader;

.field shaderPause:Landroid/graphics/Shader;

.field showCheck:Z

.field showHint:Z

.field speedTrick:Z

.field startX:I

.field startY:I

.field t:Ljava/lang/Thread;

.field theta1:D

.field tileSize:F

.field timeCounter:I

.field timerActive:Z

.field totalBombs:I

.field totalBoxes:I

.field touchedBomb:Z

.field unsafeBombCount:I

.field w:Ljava/lang/Thread;

.field width:I

.field win:Z

.field xOrig:F

.field yOrig:F

.field zeroCount:I

.field zeros:Lcom/pdonlon/mines2/CheckList;

.field zoom:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    sget-boolean v0, Lcom/pdonlon/mines2/MainActivity;->pro:Z

    sput-boolean v0, Lcom/pdonlon/mines2/Board;->pro:Z

    .line 32
    const/4 v0, 0x1

    sput-boolean v0, Lcom/pdonlon/mines2/Board;->doneAnimating:Z

    return-void
.end method

.method public constructor <init>(IILcom/pdonlon/mines2/DrawPanel;)V
    .locals 9
    .parameter "width"
    .parameter "height"
    .parameter "g"

    .prologue
    const/high16 v8, -0x1

    const/16 v5, 0xc8

    const/16 v4, 0x8c

    const/16 v3, 0x27

    const/4 v2, 0x0

    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const-wide v0, 0x4070e00000000000L

    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/pdonlon/mines2/Board;->theta1:D

    .line 65
    const/high16 v0, 0x428c

    iput v0, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    .line 66
    iput-boolean v2, p0, Lcom/pdonlon/mines2/Board;->win:Z

    .line 67
    iput-boolean v2, p0, Lcom/pdonlon/mines2/Board;->lose:Z

    .line 68
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pdonlon/mines2/Board;->firstTurn:Z

    .line 69
    iput-boolean v2, p0, Lcom/pdonlon/mines2/Board;->touchedBomb:Z

    .line 70
    iput-boolean v2, p0, Lcom/pdonlon/mines2/Board;->speedTrick:Z

    .line 71
    iput-boolean v2, p0, Lcom/pdonlon/mines2/Board;->beingPressed:Z

    .line 72
    iput-boolean v2, p0, Lcom/pdonlon/mines2/Board;->checkBoard:Z

    .line 73
    iput-boolean v2, p0, Lcom/pdonlon/mines2/Board;->showHint:Z

    .line 74
    iput-boolean v2, p0, Lcom/pdonlon/mines2/Board;->hintColorYellow:Z

    .line 75
    iput-boolean v2, p0, Lcom/pdonlon/mines2/Board;->showCheck:Z

    .line 80
    const/16 v0, 0x80

    invoke-static {v0, v4, v4, v4}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    iput v0, p0, Lcom/pdonlon/mines2/Board;->color1:I

    .line 81
    const/16 v0, 0x80

    invoke-static {v0, v3, v3, v3}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    iput v0, p0, Lcom/pdonlon/mines2/Board;->color2:I

    .line 82
    const/16 v0, 0x7f

    invoke-static {v0, v5, v5, v5}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    iput v0, p0, Lcom/pdonlon/mines2/Board;->color3:I

    .line 84
    invoke-static {v2, v2, v2, v2}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    iput v0, p0, Lcom/pdonlon/mines2/Board;->colors1:I

    .line 85
    const/16 v0, 0x64

    invoke-static {v0, v2, v2, v2}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    iput v0, p0, Lcom/pdonlon/mines2/Board;->colors2:I

    .line 93
    const/4 v0, -0x1

    iput v0, p0, Lcom/pdonlon/mines2/Board;->seed:I

    .line 97
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/pdonlon/mines2/Board;->pressedCords:[I

    .line 99
    const/16 v0, 0x78

    iput v0, p0, Lcom/pdonlon/mines2/Board;->barHeight:I

    .line 100
    const/4 v0, -0x1

    iput v0, p0, Lcom/pdonlon/mines2/Board;->actionAndStatus:I

    .line 105
    iput-object p3, p0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    .line 106
    iput p1, p0, Lcom/pdonlon/mines2/Board;->width:I

    .line 107
    iput p2, p0, Lcom/pdonlon/mines2/Board;->height:I

    .line 108
    new-instance v0, Lcom/pdonlon/mines2/CheckList;

    invoke-direct {v0}, Lcom/pdonlon/mines2/CheckList;-><init>()V

    iput-object v0, p0, Lcom/pdonlon/mines2/Board;->bombs:Lcom/pdonlon/mines2/CheckList;

    .line 111
    const-string v0, "Font Name"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    sput-object v0, Lcom/pdonlon/mines2/Board;->tf:Landroid/graphics/Typeface;

    .line 112
    new-instance v0, Landroid/graphics/LinearGradient;

    iget v1, p0, Lcom/pdonlon/mines2/Board;->offX:F

    iget v2, p0, Lcom/pdonlon/mines2/Board;->offY:F

    int-to-float v3, p1

    iget v4, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v3, v4

    iget v4, p0, Lcom/pdonlon/mines2/Board;->offX:F

    add-float/2addr v3, v4

    int-to-float v4, p2

    iget v5, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v4, v5

    iget v5, p0, Lcom/pdonlon/mines2/Board;->offY:F

    add-float/2addr v4, v5

    iget v5, p0, Lcom/pdonlon/mines2/Board;->colors1:I

    iget v6, p0, Lcom/pdonlon/mines2/Board;->colors2:I

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Lcom/pdonlon/mines2/Board;->shader:Landroid/graphics/Shader;

    .line 113
    new-instance v0, Landroid/graphics/LinearGradient;

    iget v1, p0, Lcom/pdonlon/mines2/Board;->offX:F

    iget v2, p0, Lcom/pdonlon/mines2/Board;->offY:F

    int-to-float v3, p1

    iget v4, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v3, v4

    iget v4, p0, Lcom/pdonlon/mines2/Board;->offX:F

    add-float/2addr v3, v4

    int-to-float v4, p2

    iget v5, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v4, v5

    iget v5, p0, Lcom/pdonlon/mines2/Board;->offY:F

    add-float/2addr v4, v5

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move v5, v8

    move v6, v8

    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Lcom/pdonlon/mines2/Board;->shaderPause:Landroid/graphics/Shader;

    .line 115
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->adjustTiles()V

    .line 117
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->startup()V

    .line 118
    return-void
.end method

.method public static proToggle()V
    .locals 1

    .prologue
    .line 122
    sget-boolean v0, Lcom/pdonlon/mines2/Board;->pro:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/pdonlon/mines2/Board;->pro:Z

    .line 123
    return-void

    .line 122
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static setPro(Z)V
    .locals 0
    .parameter "a"

    .prologue
    .line 127
    sput-boolean p0, Lcom/pdonlon/mines2/Board;->pro:Z

    .line 128
    return-void
.end method


# virtual methods
.method public add(II)V
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 384
    new-instance v0, Lcom/pdonlon/mines2/CheckList;

    invoke-direct {v0}, Lcom/pdonlon/mines2/CheckList;-><init>()V

    iput-object v0, p0, Lcom/pdonlon/mines2/Board;->pressed:Lcom/pdonlon/mines2/CheckList;

    .line 385
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->pressed:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v0, p1, p2}, Lcom/pdonlon/mines2/CheckList;->enque(II)V

    .line 387
    return-void
.end method

.method public adjustTiles()V
    .locals 2

    .prologue
    .line 429
    sget v0, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    sget v1, Lcom/pdonlon/mines2/MainActivity;->screenHeight:I

    if-ge v0, v1, :cond_0

    .line 430
    sget v0, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    iget v1, p0, Lcom/pdonlon/mines2/Board;->width:I

    div-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    .line 434
    :goto_0
    return-void

    .line 432
    :cond_0
    sget v0, Lcom/pdonlon/mines2/MainActivity;->screenHeight:I

    add-int/lit16 v0, v0, -0xc8

    iget v1, p0, Lcom/pdonlon/mines2/Board;->height:I

    div-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    goto :goto_0
.end method

.method public alreadyThere(II)Z
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 370
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->pressed:Lcom/pdonlon/mines2/CheckList;

    if-eqz v0, :cond_0

    .line 371
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->pressed:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v0, p1, p2}, Lcom/pdonlon/mines2/CheckList;->alreadyHead(II)Z

    move-result v0

    .line 373
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public beingPressed()Z
    .locals 1

    .prologue
    .line 404
    iget-boolean v0, p0, Lcom/pdonlon/mines2/Board;->beingPressed:Z

    return v0
.end method

.method public bomb(II)Z
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 489
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v0, v0, p1

    aget-object v0, v0, p2

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Mine;->isBomb()Z

    move-result v0

    return v0
.end method

.method public check()V
    .locals 1

    .prologue
    .line 321
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pdonlon/mines2/Board;->checkBoard:Z

    .line 323
    return-void
.end method

.method public checkBoard()Z
    .locals 4

    .prologue
    .line 342
    const/4 v0, 0x1

    .line 344
    .local v0, correct:Z
    const/4 v2, 0x0

    .local v2, y:I
    :goto_0
    iget v3, p0, Lcom/pdonlon/mines2/Board;->height:I

    if-ge v2, v3, :cond_2

    .line 345
    const/4 v1, 0x0

    .local v1, x:I
    :goto_1
    iget v3, p0, Lcom/pdonlon/mines2/Board;->width:I

    if-ge v1, v3, :cond_1

    .line 347
    iget-object v3, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v3, v3, v1

    aget-object v3, v3, v2

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Mine;->isFlagged()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v3, v3, v1

    aget-object v3, v3, v2

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Mine;->isBomb()Z

    move-result v3

    if-nez v3, :cond_0

    .line 348
    const/4 v0, 0x0

    .line 345
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 344
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 351
    .end local v1           #x:I
    :cond_2
    return v0
.end method

.method public checkWin()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    .line 1095
    iget-boolean v0, p0, Lcom/pdonlon/mines2/Board;->lose:Z

    if-eqz v0, :cond_0

    .line 1112
    :goto_0
    return-void

    .line 1098
    :cond_0
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->getOpenedBoxCount()I

    move-result v0

    iget v1, p0, Lcom/pdonlon/mines2/Board;->totalBoxes:I

    iget v2, p0, Lcom/pdonlon/mines2/Board;->totalBombs:I

    sub-int/2addr v1, v2

    if-ne v0, v1, :cond_1

    .line 1100
    iput-boolean v6, p0, Lcom/pdonlon/mines2/Board;->win:Z

    .line 1101
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/DrawPanel;->saveGameInProgress(Z)V

    .line 1103
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/pdonlon/mines2/Board;->millisecondsStart:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/pdonlon/mines2/Board;->millisecondsCounter:J

    .line 1104
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    iget v1, p0, Lcom/pdonlon/mines2/Board;->timeCounter:I

    mul-int/lit16 v1, v1, 0x3e8

    int-to-long v2, v1

    iget-wide v4, p0, Lcom/pdonlon/mines2/Board;->millisecondsCounter:J

    add-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Lcom/pdonlon/mines2/DrawPanel;->updateScores(J)V

    .line 1105
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "*!*!* "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/pdonlon/mines2/Board;->timeCounter:I

    mul-int/lit16 v2, v2, 0x3e8

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/pdonlon/mines2/Board;->millisecondsCounter:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "*!*!*"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1106
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v0, v6}, Lcom/pdonlon/mines2/DrawPanel;->setWinMessage(Z)V

    .line 1108
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->finishFlagging()V

    .line 1109
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->endTimer()V

    .line 1111
    :cond_1
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->checkBoard()Z

    goto :goto_0
.end method

.method public createMine(IIIZZZ)V
    .locals 7
    .parameter "x"
    .parameter "y"
    .parameter "bombsSurrounding"
    .parameter "opened"
    .parameter "bomb"
    .parameter "flagged"

    .prologue
    .line 494
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v6, v0, p1

    new-instance v0, Lcom/pdonlon/mines2/Mine;

    const/4 v5, 0x0

    move v1, p4

    move v2, p3

    move v3, p6

    move v4, p5

    invoke-direct/range {v0 .. v5}, Lcom/pdonlon/mines2/Mine;-><init>(ZIZZZ)V

    aput-object v0, v6, p2

    .line 495
    return-void
.end method

.method public doneAnimating()Z
    .locals 1

    .prologue
    .line 332
    sget-boolean v0, Lcom/pdonlon/mines2/Board;->doneAnimating:Z

    return v0
.end method

.method public endOfGame()V
    .locals 4

    .prologue
    .line 1143
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v2, p0, Lcom/pdonlon/mines2/Board;->height:I

    if-ge v0, v2, :cond_3

    .line 1144
    const/4 v1, 0x0

    .local v1, k:I
    :goto_1
    iget v2, p0, Lcom/pdonlon/mines2/Board;->width:I

    if-ge v1, v2, :cond_2

    .line 1146
    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v1

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Mine;->isFlagged()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v1

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Mine;->isBomb()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1147
    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->bombs:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v2, v1, v0}, Lcom/pdonlon/mines2/CheckList;->remove(II)Z

    .line 1148
    iget v2, p0, Lcom/pdonlon/mines2/Board;->unsafeBombCount:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/pdonlon/mines2/Board;->unsafeBombCount:I

    .line 1144
    :cond_0
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1151
    :cond_1
    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v1

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Mine;->isFlagged()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v1

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Mine;->isBomb()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1152
    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v1

    aget-object v2, v2, v0

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/pdonlon/mines2/Mine;->setWrong(Z)V

    .line 1153
    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->bombs:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v2, v1, v0}, Lcom/pdonlon/mines2/CheckList;->remove(II)Z

    goto :goto_2

    .line 1143
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1158
    .end local v1           #k:I
    :cond_3
    return-void
.end method

.method public endOfGameSetWrong()V
    .locals 4

    .prologue
    .line 1162
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v2, p0, Lcom/pdonlon/mines2/Board;->height:I

    if-ge v0, v2, :cond_2

    .line 1163
    const/4 v1, 0x0

    .local v1, k:I
    :goto_1
    iget v2, p0, Lcom/pdonlon/mines2/Board;->width:I

    if-ge v1, v2, :cond_1

    .line 1165
    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v1

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Mine;->isFlagged()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v1

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Mine;->isBomb()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1166
    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v1

    aget-object v2, v2, v0

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/pdonlon/mines2/Mine;->setWrong(Z)V

    .line 1163
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1162
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1172
    .end local v1           #k:I
    :cond_2
    return-void
.end method

.method public endTimer()V
    .locals 1

    .prologue
    .line 529
    sget-object v0, Lcom/pdonlon/mines2/Board;->timer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/pdonlon/mines2/Board;->timerActive:Z

    if-eqz v0, :cond_0

    .line 531
    sget-object v0, Lcom/pdonlon/mines2/Board;->timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 532
    sget-object v0, Lcom/pdonlon/mines2/Board;->timer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->purge()I

    .line 533
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pdonlon/mines2/Board;->timerActive:Z

    .line 535
    :cond_0
    return-void
.end method

.method public fastAnimation()V
    .locals 2

    .prologue
    .line 704
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/pdonlon/mines2/Board$2;

    invoke-direct {v1, p0}, Lcom/pdonlon/mines2/Board$2;-><init>(Lcom/pdonlon/mines2/Board;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/pdonlon/mines2/Board;->f:Ljava/lang/Thread;

    .line 739
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->f:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 742
    return-void
.end method

.method public fastClick(II)V
    .locals 8
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 669
    new-instance v2, Lcom/pdonlon/mines2/CheckList;

    invoke-direct {v2}, Lcom/pdonlon/mines2/CheckList;-><init>()V

    iput-object v2, p0, Lcom/pdonlon/mines2/Board;->fast:Lcom/pdonlon/mines2/CheckList;

    .line 670
    iput v5, p0, Lcom/pdonlon/mines2/Board;->fastCount:I

    .line 672
    invoke-virtual {p0, p1, p2}, Lcom/pdonlon/mines2/Board;->flagsSurrounding(II)I

    move-result v2

    iget-object v3, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v3, v3, p1

    aget-object v3, v3, p2

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Mine;->getBombsSurrounding()I

    move-result v3

    if-ne v2, v3, :cond_4

    .line 674
    const/4 v0, -0x1

    .local v0, i:I
    :goto_0
    if-ge v0, v7, :cond_3

    .line 676
    const/4 v1, -0x1

    .local v1, j:I
    :goto_1
    if-ge v1, v7, :cond_2

    .line 678
    add-int v2, p1, v1

    add-int v3, p2, v0

    invoke-virtual {p0, v2, v3}, Lcom/pdonlon/mines2/Board;->isValid(II)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    add-int v3, p1, v1

    aget-object v2, v2, v3

    add-int v3, p2, v0

    aget-object v2, v2, v3

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Mine;->isOpened()Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    add-int v3, p1, v1

    aget-object v2, v2, v3

    add-int v3, p2, v0

    aget-object v2, v2, v3

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Mine;->isFlagged()Z

    move-result v2

    if-nez v2, :cond_1

    .line 681
    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    add-int v3, p1, v1

    aget-object v2, v2, v3

    add-int v3, p2, v0

    aget-object v2, v2, v3

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Mine;->isBomb()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 683
    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v2, v5}, Lcom/pdonlon/mines2/DrawPanel;->saveGameInProgress(Z)V

    .line 684
    iput-boolean v6, p0, Lcom/pdonlon/mines2/Board;->lose:Z

    .line 685
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->endOfGame()V

    .line 686
    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v2, v6}, Lcom/pdonlon/mines2/DrawPanel;->setGameOver(Z)V

    .line 687
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->endTimer()V

    .line 689
    :cond_0
    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->fast:Lcom/pdonlon/mines2/CheckList;

    add-int v3, p1, v1

    add-int v4, p2, v0

    invoke-virtual {v2, v3, v4}, Lcom/pdonlon/mines2/CheckList;->enque(II)V

    .line 690
    iget v2, p0, Lcom/pdonlon/mines2/Board;->fastCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/pdonlon/mines2/Board;->fastCount:I

    .line 676
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 674
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 698
    .end local v1           #j:I
    :cond_3
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->fastAnimation()V

    .line 699
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->checkWin()V

    .line 700
    .end local v0           #i:I
    :cond_4
    return-void
.end method

.method public fastClickWholeBoard()V
    .locals 4

    .prologue
    .line 659
    const/4 v1, 0x0

    .local v1, y:I
    :goto_0
    iget v2, p0, Lcom/pdonlon/mines2/Board;->height:I

    if-ge v1, v2, :cond_2

    .line 660
    const/4 v0, 0x0

    .local v0, x:I
    :goto_1
    iget v2, p0, Lcom/pdonlon/mines2/Board;->width:I

    if-ge v0, v2, :cond_1

    .line 662
    invoke-virtual {p0, v0, v1}, Lcom/pdonlon/mines2/Board;->flagsSurrounding(II)I

    move-result v2

    iget-object v3, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v3, v3, v0

    aget-object v3, v3, v1

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Mine;->getBombsSurrounding()I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 663
    invoke-virtual {p0, v0, v1}, Lcom/pdonlon/mines2/Board;->fastClick(II)V

    .line 660
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 659
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 665
    .end local v0           #x:I
    :cond_2
    return-void
.end method

.method public finishFlagging()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 757
    iget v2, p0, Lcom/pdonlon/mines2/Board;->flagCount:I

    if-ltz v2, :cond_2

    .line 759
    const/4 v1, 0x0

    .local v1, y:I
    :goto_0
    iget v2, p0, Lcom/pdonlon/mines2/Board;->height:I

    if-ge v1, v2, :cond_2

    .line 760
    const/4 v0, 0x0

    .local v0, x:I
    :goto_1
    iget v2, p0, Lcom/pdonlon/mines2/Board;->width:I

    if-ge v0, v2, :cond_1

    .line 762
    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v0

    aget-object v2, v2, v1

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Mine;->isOpened()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v0

    aget-object v2, v2, v1

    iget-boolean v2, v2, Lcom/pdonlon/mines2/Mine;->flagged:Z

    if-nez v2, :cond_0

    .line 763
    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v0

    aget-object v2, v2, v1

    invoke-virtual {v2, v3}, Lcom/pdonlon/mines2/Mine;->setFlagged(Z)V

    .line 760
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 759
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 769
    .end local v0           #x:I
    .end local v1           #y:I
    :cond_2
    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v2, v3}, Lcom/pdonlon/mines2/DrawPanel;->setGameOver(Z)V

    .line 770
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->endTimer()V

    .line 772
    const/4 v2, 0x0

    iput v2, p0, Lcom/pdonlon/mines2/Board;->flagCount:I

    .line 774
    return-void
.end method

.method public flagged(II)Z
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    .line 460
    const/4 v0, 0x0

    .line 461
    .local v0, flag:Z
    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v1, v1, p1

    aget-object v1, v1, p2

    invoke-virtual {v1}, Lcom/pdonlon/mines2/Mine;->isFlagged()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 462
    const/4 v0, 0x1

    .line 464
    :cond_0
    return v0
.end method

.method public flagsSurrounding(II)I
    .locals 6
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v5, 0x2

    .line 928
    const/4 v0, 0x0

    .line 930
    .local v0, flags:I
    const/4 v1, -0x1

    .local v1, i:I
    :goto_0
    if-ge v1, v5, :cond_2

    .line 931
    const/4 v2, -0x1

    .local v2, j:I
    :goto_1
    if-ge v2, v5, :cond_1

    .line 933
    add-int v3, p1, v2

    add-int v4, p2, v1

    invoke-virtual {p0, v3, v4}, Lcom/pdonlon/mines2/Board;->isValid(II)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    add-int v4, p1, v2

    aget-object v3, v3, v4

    add-int v4, p2, v1

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Mine;->isOpened()Z

    move-result v3

    if-nez v3, :cond_0

    .line 935
    iget-object v3, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    add-int v4, p1, v2

    aget-object v3, v3, v4

    add-int v4, p2, v1

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Mine;->isFlagged()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 936
    add-int/lit8 v0, v0, 0x1

    .line 931
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 930
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 940
    .end local v2           #j:I
    :cond_2
    return v0
.end method

.method public gameOver()Z
    .locals 2

    .prologue
    .line 1176
    const/4 v0, 0x0

    .line 1178
    .local v0, gameOver:Z
    iget-boolean v1, p0, Lcom/pdonlon/mines2/Board;->lose:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/pdonlon/mines2/Board;->win:Z

    if-eqz v1, :cond_1

    .line 1179
    :cond_0
    const/4 v0, 0x1

    .line 1181
    :cond_1
    return v0
.end method

.method public gameOverMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1186
    const-string v0, ""

    .line 1203
    .local v0, gameOver:Ljava/lang/String;
    return-object v0
.end method

.method public getBombsSurrounding(II)I
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 327
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v0, v0, p1

    aget-object v0, v0, p2

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Mine;->getBombsSurrounding()I

    move-result v0

    return v0
.end method

.method public getDiffX()F
    .locals 1

    .prologue
    .line 291
    iget v0, p0, Lcom/pdonlon/mines2/Board;->diffX:F

    return v0
.end method

.method public getDiffY()F
    .locals 1

    .prologue
    .line 311
    iget v0, p0, Lcom/pdonlon/mines2/Board;->diffY:F

    return v0
.end method

.method public getFirstTurn()Z
    .locals 1

    .prologue
    .line 259
    iget-boolean v0, p0, Lcom/pdonlon/mines2/Board;->firstTurn:Z

    return v0
.end method

.method public getFlagCount()I
    .locals 1

    .prologue
    .line 234
    iget v0, p0, Lcom/pdonlon/mines2/Board;->flagCount:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 194
    iget v0, p0, Lcom/pdonlon/mines2/Board;->height:I

    return v0
.end method

.method public getHint()[I
    .locals 10

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 964
    const/4 v3, -0x1

    .line 965
    .local v3, xHint:I
    const/4 v5, -0x1

    .line 967
    .local v5, yHint:I
    const/4 v4, 0x0

    .local v4, y:I
    :goto_0
    iget v6, p0, Lcom/pdonlon/mines2/Board;->height:I

    if-ge v4, v6, :cond_5

    .line 968
    const/4 v2, 0x0

    .local v2, x:I
    :goto_1
    iget v6, p0, Lcom/pdonlon/mines2/Board;->width:I

    if-ge v2, v6, :cond_4

    .line 970
    iget-object v6, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v6, v6, v2

    aget-object v0, v6, v4

    .line 972
    .local v0, b:Lcom/pdonlon/mines2/Mine;
    invoke-virtual {v0}, Lcom/pdonlon/mines2/Mine;->isOpened()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Mine;->getBombsSurrounding()I

    move-result v6

    if-lez v6, :cond_2

    .line 974
    invoke-virtual {p0, v2, v4}, Lcom/pdonlon/mines2/Board;->flagsSurrounding(II)I

    move-result v6

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Mine;->getBombsSurrounding()I

    move-result v9

    if-ne v6, v9, :cond_0

    invoke-virtual {p0, v2, v4}, Lcom/pdonlon/mines2/Board;->unopenedAndUnflaggedAround(II)Z

    move-result v6

    if-nez v6, :cond_1

    :cond_0
    invoke-virtual {p0, v2, v4}, Lcom/pdonlon/mines2/Board;->unopenedSurrounding(II)I

    move-result v6

    iget-object v9, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v9, v9, v2

    aget-object v9, v9, v4

    invoke-virtual {v9}, Lcom/pdonlon/mines2/Mine;->getBombsSurrounding()I

    move-result v9

    if-ne v6, v9, :cond_2

    invoke-virtual {p0, v2, v4}, Lcom/pdonlon/mines2/Board;->flagsSurrounding(II)I

    move-result v6

    iget-object v9, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v9, v9, v2

    aget-object v9, v9, v4

    invoke-virtual {v9}, Lcom/pdonlon/mines2/Mine;->getBombsSurrounding()I

    move-result v9

    if-eq v6, v9, :cond_2

    .line 977
    :cond_1
    move v3, v2

    .line 978
    move v5, v4

    .line 980
    invoke-virtual {p0, v2, v4}, Lcom/pdonlon/mines2/Board;->flagsSurrounding(II)I

    move-result v6

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Mine;->getBombsSurrounding()I

    move-result v9

    if-ne v6, v9, :cond_3

    invoke-virtual {p0, v2, v4}, Lcom/pdonlon/mines2/Board;->unopenedAndUnflaggedAround(II)Z

    move-result v6

    if-eqz v6, :cond_3

    move v6, v7

    :goto_2
    iput-boolean v6, p0, Lcom/pdonlon/mines2/Board;->hintColorYellow:Z

    .line 968
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_3
    move v6, v8

    .line 980
    goto :goto_2

    .line 967
    .end local v0           #b:Lcom/pdonlon/mines2/Mine;
    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 986
    .end local v2           #x:I
    :cond_5
    const/4 v6, 0x2

    new-array v1, v6, [I

    aput v3, v1, v8

    aput v5, v1, v7

    .line 987
    .local v1, hint:[I
    return-object v1
.end method

.method public getLose()Z
    .locals 1

    .prologue
    .line 249
    iget-boolean v0, p0, Lcom/pdonlon/mines2/Board;->lose:Z

    return v0
.end method

.method public getMillisecondsCounter()J
    .locals 2

    .prologue
    .line 142
    iget-wide v0, p0, Lcom/pdonlon/mines2/Board;->millisecondsCounter:J

    return-wide v0
.end method

.method public getMillisecondsStart()J
    .locals 2

    .prologue
    .line 152
    iget-wide v0, p0, Lcom/pdonlon/mines2/Board;->millisecondsStart:J

    return-wide v0
.end method

.method public getOffX()F
    .locals 1

    .prologue
    .line 281
    iget v0, p0, Lcom/pdonlon/mines2/Board;->offX:F

    return v0
.end method

.method public getOffY()F
    .locals 1

    .prologue
    .line 301
    iget v0, p0, Lcom/pdonlon/mines2/Board;->offY:F

    return v0
.end method

.method public getOpenedBoxCount()I
    .locals 4

    .prologue
    .line 1128
    const/4 v0, 0x0

    .line 1130
    .local v0, opened:I
    const/4 v2, 0x0

    .local v2, y:I
    :goto_0
    iget v3, p0, Lcom/pdonlon/mines2/Board;->height:I

    if-ge v2, v3, :cond_2

    .line 1131
    const/4 v1, 0x0

    .local v1, x:I
    :goto_1
    iget v3, p0, Lcom/pdonlon/mines2/Board;->width:I

    if-ge v1, v3, :cond_1

    .line 1133
    iget-object v3, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v3, v3, v1

    aget-object v3, v3, v2

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Mine;->isOpened()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v3, v3, v1

    aget-object v3, v3, v2

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Mine;->isBomb()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1134
    add-int/lit8 v0, v0, 0x1

    .line 1131
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1130
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1138
    .end local v1           #x:I
    :cond_2
    return v0
.end method

.method public getPressedCords()[I
    .locals 1

    .prologue
    .line 398
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->pressedCords:[I

    return-object v0
.end method

.method public getStartX()I
    .locals 1

    .prologue
    .line 264
    iget v0, p0, Lcom/pdonlon/mines2/Board;->startX:I

    return v0
.end method

.method public getStartY()I
    .locals 1

    .prologue
    .line 269
    iget v0, p0, Lcom/pdonlon/mines2/Board;->startY:I

    return v0
.end method

.method public getTheta()D
    .locals 2

    .prologue
    .line 132
    iget-wide v0, p0, Lcom/pdonlon/mines2/Board;->theta1:D

    return-wide v0
.end method

.method public getTileSize()F
    .locals 1

    .prologue
    .line 204
    iget v0, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    return v0
.end method

.method public getTimeCounter()I
    .locals 1

    .prologue
    .line 157
    iget v0, p0, Lcom/pdonlon/mines2/Board;->timeCounter:I

    return v0
.end method

.method public getTotalBombs()I
    .locals 1

    .prologue
    .line 214
    iget v0, p0, Lcom/pdonlon/mines2/Board;->totalBombs:I

    return v0
.end method

.method public getTotalBoxes()I
    .locals 1

    .prologue
    .line 224
    iget v0, p0, Lcom/pdonlon/mines2/Board;->totalBoxes:I

    return v0
.end method

.method public getTouchedBomb()Z
    .locals 1

    .prologue
    .line 229
    iget-boolean v0, p0, Lcom/pdonlon/mines2/Board;->touchedBomb:Z

    return v0
.end method

.method public getUnsafeBombCount()I
    .locals 1

    .prologue
    .line 415
    iget v0, p0, Lcom/pdonlon/mines2/Board;->unsafeBombCount:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 184
    iget v0, p0, Lcom/pdonlon/mines2/Board;->width:I

    return v0
.end method

.method public getWin()Z
    .locals 1

    .prologue
    .line 239
    iget-boolean v0, p0, Lcom/pdonlon/mines2/Board;->win:Z

    return v0
.end method

.method public getZoom()I
    .locals 1

    .prologue
    .line 209
    iget v0, p0, Lcom/pdonlon/mines2/Board;->zoom:I

    return v0
.end method

.method public hint()V
    .locals 1

    .prologue
    .line 993
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pdonlon/mines2/Board;->showHint:Z

    .line 995
    return-void
.end method

.method public initializeBoard()V
    .locals 9

    .prologue
    const/4 v1, 0x0

    .line 499
    const/4 v7, 0x0

    .local v7, y:I
    :goto_0
    iget v0, p0, Lcom/pdonlon/mines2/Board;->height:I

    if-ge v7, v0, :cond_1

    .line 500
    const/4 v6, 0x0

    .local v6, x:I
    :goto_1
    iget v0, p0, Lcom/pdonlon/mines2/Board;->width:I

    if-ge v6, v0, :cond_0

    .line 501
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v8, v0, v6

    new-instance v0, Lcom/pdonlon/mines2/Mine;

    move v2, v1

    move v3, v1

    move v4, v1

    move v5, v1

    invoke-direct/range {v0 .. v5}, Lcom/pdonlon/mines2/Mine;-><init>(ZIZZZ)V

    aput-object v0, v8, v7

    .line 500
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 499
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 502
    .end local v6           #x:I
    :cond_1
    return-void
.end method

.method public isThis(IILjava/lang/String;)Z
    .locals 2
    .parameter "x"
    .parameter "y"
    .parameter "type"

    .prologue
    .line 476
    const/4 v0, 0x0

    .line 477
    .local v0, yes:Z
    const-string v1, "bomb"

    invoke-virtual {p3, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 478
    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v1, v1, p1

    aget-object v1, v1, p2

    invoke-virtual {v1}, Lcom/pdonlon/mines2/Mine;->isBomb()Z

    move-result v0

    .line 484
    :cond_0
    :goto_0
    return v0

    .line 479
    :cond_1
    const-string v1, "flag"

    invoke-virtual {p3, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 480
    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v1, v1, p1

    aget-object v1, v1, p2

    invoke-virtual {v1}, Lcom/pdonlon/mines2/Mine;->isFlagged()Z

    move-result v0

    goto :goto_0

    .line 481
    :cond_2
    const-string v1, "open"

    invoke-virtual {p3, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 482
    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v1, v1, p1

    aget-object v1, v1, p2

    invoke-virtual {v1}, Lcom/pdonlon/mines2/Mine;->isOpened()Z

    move-result v0

    goto :goto_0
.end method

.method public isUntouched(II)Z
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    .line 357
    const/4 v0, 0x0

    .line 359
    .local v0, untouched:Z
    :try_start_0
    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v1, v1, p1

    aget-object v1, v1, p2

    invoke-virtual {v1}, Lcom/pdonlon/mines2/Mine;->isOpened()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v1, v1, p1

    aget-object v1, v1, p2

    invoke-virtual {v1}, Lcom/pdonlon/mines2/Mine;->isFlagged()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v1, v1, p1

    aget-object v1, v1, p2

    invoke-virtual {v1}, Lcom/pdonlon/mines2/Mine;->isWrong()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    if-nez v1, :cond_0

    .line 360
    const/4 v0, 0x1

    .line 365
    :cond_0
    :goto_0
    return v0

    .line 362
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public isValid(II)Z
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    .line 613
    const/4 v0, 0x0

    .line 616
    .local v0, valid:Z
    :try_start_0
    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v1, v1, p1

    aget-object v1, v1, p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_0

    .line 617
    const/4 v0, 0x1

    .line 622
    :cond_0
    :goto_0
    return v0

    .line 619
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public lost()Z
    .locals 3

    .prologue
    .line 1116
    const/4 v1, 0x0

    .local v1, y:I
    :goto_0
    iget v2, p0, Lcom/pdonlon/mines2/Board;->height:I

    if-ge v1, v2, :cond_2

    .line 1117
    const/4 v0, 0x0

    .local v0, x:I
    :goto_1
    iget v2, p0, Lcom/pdonlon/mines2/Board;->width:I

    if-ge v0, v2, :cond_1

    .line 1119
    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v0

    aget-object v2, v2, v1

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Mine;->isBomb()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v0

    aget-object v2, v2, v1

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Mine;->isOpened()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1120
    const/4 v2, 0x1

    .line 1123
    .end local v0           #x:I
    :goto_2
    return v2

    .line 1117
    .restart local v0       #x:I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1116
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1123
    .end local v0           #x:I
    :cond_2
    const/4 v2, 0x0

    goto :goto_2
.end method

.method public markFlagged(II)V
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    .line 872
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v0, v0, p1

    aget-object v0, v0, p2

    iget-boolean v0, v0, Lcom/pdonlon/mines2/Mine;->opened:Z

    if-nez v0, :cond_0

    .line 873
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v0, v0, p1

    aget-object v0, v0, p2

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Mine;->isFlagged()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 875
    invoke-virtual {p0, p1, p2}, Lcom/pdonlon/mines2/Board;->removeFlag(II)V

    .line 886
    :cond_0
    :goto_0
    return-void

    .line 880
    :cond_1
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v0, v0, p1

    aget-object v0, v0, p2

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/Mine;->setFlagged(Z)V

    .line 882
    iget v0, p0, Lcom/pdonlon/mines2/Board;->flagCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/pdonlon/mines2/Board;->flagCount:I

    goto :goto_0
.end method

.method public notSurroundingStart(II)Z
    .locals 6
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v5, 0x2

    .line 890
    const/4 v2, 0x1

    .line 892
    .local v2, notSurrounded:Z
    const/4 v0, -0x1

    .local v0, i:I
    :goto_0
    if-ge v0, v5, :cond_1

    .line 893
    const/4 v1, -0x1

    .local v1, j:I
    :goto_1
    if-ge v1, v5, :cond_0

    .line 895
    add-int v3, p1, v1

    iget v4, p0, Lcom/pdonlon/mines2/Board;->startX:I

    if-ne v3, v4, :cond_2

    add-int v3, p2, v0

    iget v4, p0, Lcom/pdonlon/mines2/Board;->startY:I

    if-ne v3, v4, :cond_2

    .line 897
    const/4 v2, 0x0

    .line 902
    :cond_0
    if-nez v2, :cond_3

    .line 906
    .end local v1           #j:I
    :cond_1
    return v2

    .line 893
    .restart local v1       #j:I
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 892
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public open(II)V
    .locals 0
    .parameter "x"
    .parameter "y"

    .prologue
    .line 470
    invoke-virtual {p0, p1, p2}, Lcom/pdonlon/mines2/Board;->openBox(II)V

    .line 472
    return-void
.end method

.method public openBomb()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 1009
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->bombs:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v1}, Lcom/pdonlon/mines2/CheckList;->getValues()[I

    move-result-object v1

    aget v1, v1, v3

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->bombs:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v1}, Lcom/pdonlon/mines2/CheckList;->getValues()[I

    move-result-object v1

    aget v1, v1, v2

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Mine;->isBomb()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1010
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->bombs:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v1}, Lcom/pdonlon/mines2/CheckList;->getValues()[I

    move-result-object v1

    aget v1, v1, v3

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->bombs:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v1}, Lcom/pdonlon/mines2/CheckList;->getValues()[I

    move-result-object v1

    aget v1, v1, v2

    aget-object v0, v0, v1

    invoke-virtual {v0, v2}, Lcom/pdonlon/mines2/Mine;->setOpened(Z)V

    .line 1012
    :cond_0
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->bombs:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/CheckList;->deque()V

    .line 1014
    return-void
.end method

.method public openBox(II)V
    .locals 4
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 1039
    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->t:Ljava/lang/Thread;

    if-eqz v1, :cond_0

    .line 1042
    :try_start_0
    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->t:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1048
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v1, v1, p1

    aget-object v1, v1, p2

    invoke-virtual {v1}, Lcom/pdonlon/mines2/Mine;->isFlagged()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1049
    invoke-virtual {p0, p1, p2}, Lcom/pdonlon/mines2/Board;->removeFlag(II)V

    .line 1090
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->checkWin()V

    .line 1091
    return-void

    .line 1043
    :catch_0
    move-exception v0

    .line 1045
    .local v0, e:Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 1052
    .end local v0           #e:Ljava/lang/InterruptedException;
    :cond_2
    iget-boolean v1, p0, Lcom/pdonlon/mines2/Board;->firstTurn:Z

    if-eqz v1, :cond_3

    .line 1054
    invoke-virtual {p0, p1, p2}, Lcom/pdonlon/mines2/Board;->setStartXandY(II)V

    .line 1056
    iput-boolean v3, p0, Lcom/pdonlon/mines2/Board;->firstTurn:Z

    .line 1057
    invoke-virtual {p0, p1, p2}, Lcom/pdonlon/mines2/Board;->openBox(II)V

    goto :goto_1

    .line 1062
    :cond_3
    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v1, v1, p1

    aget-object v1, v1, p2

    invoke-virtual {v1}, Lcom/pdonlon/mines2/Mine;->isOpened()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1064
    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v1, v1, p1

    aget-object v1, v1, p2

    invoke-virtual {v1, v2}, Lcom/pdonlon/mines2/Mine;->setOpened(Z)V

    .line 1066
    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v1, v1, p1

    aget-object v1, v1, p2

    invoke-virtual {v1}, Lcom/pdonlon/mines2/Mine;->isBomb()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1068
    iput-boolean v2, p0, Lcom/pdonlon/mines2/Board;->touchedBomb:Z

    .line 1069
    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v1, v3}, Lcom/pdonlon/mines2/DrawPanel;->saveGameInProgress(Z)V

    .line 1070
    iput-boolean v2, p0, Lcom/pdonlon/mines2/Board;->lose:Z

    .line 1072
    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->bombs:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v1, p1, p2}, Lcom/pdonlon/mines2/CheckList;->remove(II)Z

    .line 1073
    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->bombs:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v1, p1, p2}, Lcom/pdonlon/mines2/CheckList;->enque(II)V

    .line 1075
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->endOfGame()V

    .line 1076
    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v1, v2}, Lcom/pdonlon/mines2/DrawPanel;->setGameOver(Z)V

    .line 1077
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->endTimer()V

    goto :goto_1

    .line 1081
    :cond_4
    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v1, v1, p1

    aget-object v1, v1, p2

    invoke-virtual {v1}, Lcom/pdonlon/mines2/Mine;->getBombsSurrounding()I

    move-result v1

    if-nez v1, :cond_1

    .line 1082
    invoke-virtual {p0, p1, p2}, Lcom/pdonlon/mines2/Board;->openZeros(II)V

    .line 1084
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->tileAnimation()V

    goto :goto_1
.end method

.method public openZeros(II)V
    .locals 10
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v9, 0x2

    .line 778
    move v4, p1

    .line 779
    .local v4, tempX:I
    move v5, p2

    .line 781
    .local v5, tempY:I
    new-instance v6, Lcom/pdonlon/mines2/CheckList;

    invoke-direct {v6}, Lcom/pdonlon/mines2/CheckList;-><init>()V

    iput-object v6, p0, Lcom/pdonlon/mines2/Board;->zeros:Lcom/pdonlon/mines2/CheckList;

    .line 782
    new-instance v0, Lcom/pdonlon/mines2/CheckList;

    invoke-direct {v0}, Lcom/pdonlon/mines2/CheckList;-><init>()V

    .line 783
    .local v0, check:Lcom/pdonlon/mines2/CheckList;
    invoke-virtual {v0, p1, p2}, Lcom/pdonlon/mines2/CheckList;->enque(II)V

    .line 785
    new-instance v1, Lcom/pdonlon/mines2/FullList;

    invoke-direct {v1}, Lcom/pdonlon/mines2/FullList;-><init>()V

    .line 786
    .local v1, full:Lcom/pdonlon/mines2/FullList;
    invoke-virtual {v1, p1, p2}, Lcom/pdonlon/mines2/FullList;->add(II)V

    .line 788
    :cond_0
    :goto_0
    invoke-virtual {v0}, Lcom/pdonlon/mines2/CheckList;->getHead()Lcom/pdonlon/mines2/Node;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 790
    invoke-virtual {v0}, Lcom/pdonlon/mines2/CheckList;->deque()V

    .line 792
    const/4 v2, -0x1

    .local v2, i:I
    :goto_1
    if-ge v2, v9, :cond_3

    .line 793
    const/4 v3, -0x1

    .local v3, j:I
    :goto_2
    if-ge v3, v9, :cond_2

    .line 795
    add-int v6, v4, v2

    add-int v7, v5, v3

    invoke-virtual {p0, v6, v7}, Lcom/pdonlon/mines2/Board;->isValid(II)Z

    move-result v6

    if-eqz v6, :cond_1

    add-int v6, v4, v2

    add-int v7, v5, v3

    invoke-virtual {v1, v6, v7}, Lcom/pdonlon/mines2/FullList;->alreadyInFullList(II)Z

    move-result v6

    if-nez v6, :cond_1

    iget-object v6, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    add-int v7, v4, v2

    aget-object v6, v6, v7

    add-int v7, v5, v3

    aget-object v6, v6, v7

    invoke-virtual {v6}, Lcom/pdonlon/mines2/Mine;->isOpened()Z

    move-result v6

    if-nez v6, :cond_1

    iget-object v6, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    add-int v7, v4, v2

    aget-object v6, v6, v7

    add-int v7, v5, v3

    aget-object v6, v6, v7

    invoke-virtual {v6}, Lcom/pdonlon/mines2/Mine;->isFlagged()Z

    move-result v6

    if-nez v6, :cond_1

    .line 800
    iget-object v6, p0, Lcom/pdonlon/mines2/Board;->zeros:Lcom/pdonlon/mines2/CheckList;

    add-int v7, v4, v2

    add-int v8, v5, v3

    invoke-virtual {v6, v7, v8}, Lcom/pdonlon/mines2/CheckList;->enque(II)V

    .line 801
    iget v6, p0, Lcom/pdonlon/mines2/Board;->zeroCount:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/pdonlon/mines2/Board;->zeroCount:I

    .line 803
    add-int v6, v4, v2

    add-int v7, v5, v3

    invoke-virtual {v1, v6, v7}, Lcom/pdonlon/mines2/FullList;->add(II)V

    .line 805
    iget-object v6, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    add-int v7, v4, v2

    aget-object v6, v6, v7

    add-int v7, v5, v3

    aget-object v6, v6, v7

    invoke-virtual {v6}, Lcom/pdonlon/mines2/Mine;->getBombsSurrounding()I

    move-result v6

    if-nez v6, :cond_1

    .line 807
    add-int v6, v4, v2

    add-int v7, v5, v3

    invoke-virtual {v0, v6, v7}, Lcom/pdonlon/mines2/CheckList;->enque(II)V

    .line 793
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 792
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 814
    .end local v3           #j:I
    :cond_3
    invoke-virtual {v0}, Lcom/pdonlon/mines2/CheckList;->getHead()Lcom/pdonlon/mines2/Node;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 816
    invoke-virtual {v0}, Lcom/pdonlon/mines2/CheckList;->getValues()[I

    move-result-object v6

    const/4 v7, 0x0

    aget v4, v6, v7

    .line 817
    invoke-virtual {v0}, Lcom/pdonlon/mines2/CheckList;->getValues()[I

    move-result-object v6

    const/4 v7, 0x1

    aget v5, v6, v7

    goto/16 :goto_0

    .line 820
    .end local v2           #i:I
    :cond_4
    return-void
.end method

.method public paintBoard(Landroid/graphics/Canvas;)V
    .locals 46
    .parameter "g"

    .prologue
    .line 1273
    new-instance v36, Landroid/graphics/Paint;

    invoke-direct/range {v36 .. v36}, Landroid/graphics/Paint;-><init>()V

    .line 1274
    .local v36, black:Landroid/graphics/Paint;
    const/high16 v2, -0x100

    move-object/from16 v0, v36

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 1276
    new-instance v35, Landroid/graphics/Paint;

    invoke-direct/range {v35 .. v35}, Landroid/graphics/Paint;-><init>()V

    .line 1277
    .local v35, background:Landroid/graphics/Paint;
    const v2, -0x333334

    move-object/from16 v0, v35

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 1279
    new-instance v25, Landroid/graphics/Paint;

    invoke-direct/range {v25 .. v25}, Landroid/graphics/Paint;-><init>()V

    .line 1280
    .local v25, gray:Landroid/graphics/Paint;
    const v2, -0x777778

    move-object/from16 v0, v25

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 1281
    sget-boolean v2, Lcom/pdonlon/mines2/Board;->pro:Z

    if-eqz v2, :cond_0

    .line 1282
    const/16 v2, 0xff

    const/16 v3, 0xff

    const/16 v4, 0xd7

    const/4 v5, 0x0

    invoke-static {v2, v3, v4, v5}, Landroid/graphics/Color;->argb(IIII)I

    move-result v2

    move-object/from16 v0, v25

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 1283
    :cond_0
    new-instance v7, Landroid/graphics/Paint;

    invoke-direct {v7}, Landroid/graphics/Paint;-><init>()V

    .line 1284
    .local v7, darkGray:Landroid/graphics/Paint;
    const/16 v2, 0xff

    const/16 v3, 0x64

    const/16 v4, 0x64

    const/16 v5, 0x64

    invoke-static {v2, v3, v4, v5}, Landroid/graphics/Color;->argb(IIII)I

    move-result v2

    invoke-virtual {v7, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 1285
    sget-boolean v2, Lcom/pdonlon/mines2/Board;->pro:Z

    if-eqz v2, :cond_1

    .line 1286
    const/16 v2, 0xff

    const/16 v3, 0xda

    const/16 v4, 0xa5

    const/16 v5, 0x20

    invoke-static {v2, v3, v4, v5}, Landroid/graphics/Color;->argb(IIII)I

    move-result v2

    invoke-virtual {v7, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 1287
    :cond_1
    new-instance v19, Landroid/graphics/Paint;

    invoke-direct/range {v19 .. v19}, Landroid/graphics/Paint;-><init>()V

    .line 1289
    .local v19, thickDarkGray:Landroid/graphics/Paint;
    const/16 v2, 0xff

    const/16 v3, 0x64

    const/16 v4, 0x64

    const/16 v5, 0x64

    invoke-static {v2, v3, v4, v5}, Landroid/graphics/Color;->argb(IIII)I

    move-result v2

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 1290
    sget-boolean v2, Lcom/pdonlon/mines2/Board;->pro:Z

    if-eqz v2, :cond_2

    .line 1291
    const/16 v2, 0xff

    const/16 v3, 0xda

    const/16 v4, 0xa5

    const/16 v5, 0x20

    invoke-static {v2, v3, v4, v5}, Landroid/graphics/Color;->argb(IIII)I

    move-result v2

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 1292
    :cond_2
    new-instance v13, Landroid/graphics/Paint;

    invoke-direct {v13}, Landroid/graphics/Paint;-><init>()V

    .line 1294
    .local v13, lightGray:Landroid/graphics/Paint;
    const/16 v2, 0xff

    const/16 v3, 0xaa

    const/16 v4, 0xaa

    const/16 v5, 0xaa

    invoke-static {v2, v3, v4, v5}, Landroid/graphics/Color;->argb(IIII)I

    move-result v2

    invoke-virtual {v13, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 1295
    sget-boolean v2, Lcom/pdonlon/mines2/Board;->pro:Z

    if-eqz v2, :cond_3

    .line 1296
    const/16 v2, 0xff

    const/16 v3, 0xf0

    const/16 v4, 0xe6

    const/16 v5, 0x8c

    invoke-static {v2, v3, v4, v5}, Landroid/graphics/Color;->argb(IIII)I

    move-result v2

    invoke-virtual {v13, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 1299
    :cond_3
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x40c0

    div-float v39, v2, v3

    .line 1301
    .local v39, gap:F
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    .line 1303
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/high16 v3, -0x100

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1304
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Lcom/pdonlon/mines2/Board;->tf:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 1305
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x4040

    div-float/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 1307
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/pdonlon/mines2/Board;->speedTrick:Z

    if-eqz v2, :cond_4

    .line 1308
    const-string v2, ""

    const/high16 v3, 0x3f80

    const/high16 v4, 0x3f80

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1313
    :goto_0
    const/high16 v2, 0x41f0

    invoke-virtual {v7, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1314
    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offX:F

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->offY:F

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    move-object/from16 v0, p0

    iget v5, v0, Lcom/pdonlon/mines2/Board;->width:I

    int-to-float v5, v5

    mul-float/2addr v2, v5

    move-object/from16 v0, p0

    iget v5, v0, Lcom/pdonlon/mines2/Board;->offX:F

    add-float/2addr v5, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    move-object/from16 v0, p0

    iget v6, v0, Lcom/pdonlon/mines2/Board;->height:I

    int-to-float v6, v6

    mul-float/2addr v2, v6

    move-object/from16 v0, p0

    iget v6, v0, Lcom/pdonlon/mines2/Board;->offY:F

    add-float/2addr v6, v2

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1316
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x40c0

    div-float/2addr v2, v3

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1319
    move-object/from16 v0, p0

    iget v10, v0, Lcom/pdonlon/mines2/Board;->offY:F

    .line 1321
    .local v10, ySpacing:F
    const/16 v45, 0x0

    .local v45, y:I
    :goto_1
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->height:I

    move/from16 v0, v45

    if-ge v0, v2, :cond_8

    .line 1323
    move-object/from16 v0, p0

    iget v9, v0, Lcom/pdonlon/mines2/Board;->offX:F

    .line 1325
    .local v9, xSpacing:F
    const/16 v44, 0x0

    .local v44, x:I
    :goto_2
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->width:I

    move/from16 v0, v44

    if-ge v0, v2, :cond_7

    .line 1327
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v44

    aget-object v2, v2, v45

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Mine;->isOpened()Z

    move-result v2

    if-nez v2, :cond_5

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v44

    aget-object v2, v2, v45

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Mine;->isWrong()Z

    move-result v2

    if-nez v2, :cond_5

    .line 1330
    add-float v11, v39, v9

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float v12, v2, v10

    move-object/from16 v8, p1

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1331
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float v11, v2, v9

    add-float v12, v39, v10

    move-object/from16 v8, p1

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1334
    const/high16 v2, 0x4040

    div-float v2, v39, v2

    add-float v15, v2, v9

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4040

    div-float v3, v39, v3

    add-float/2addr v2, v3

    add-float v16, v2, v10

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4040

    div-float v3, v39, v3

    add-float/2addr v2, v3

    add-float v17, v2, v9

    const/high16 v2, 0x4040

    div-float v2, v39, v2

    add-float v18, v2, v10

    move-object/from16 v14, p1

    invoke-virtual/range {v14 .. v19}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1337
    add-float v21, v39, v9

    add-float v22, v39, v10

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    sub-float v2, v2, v39

    add-float v23, v2, v9

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    sub-float v2, v2, v39

    add-float v24, v2, v10

    move-object/from16 v20, p1

    invoke-virtual/range {v20 .. v25}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1349
    :goto_3
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float/2addr v9, v2

    .line 1325
    add-int/lit8 v44, v44, 0x1

    goto/16 :goto_2

    .line 1310
    .end local v9           #xSpacing:F
    .end local v10           #ySpacing:F
    .end local v44           #x:I
    .end local v45           #y:I
    :cond_4
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/pdonlon/mines2/Board;->speedTrick:Z

    goto/16 :goto_0

    .line 1342
    .restart local v9       #xSpacing:F
    .restart local v10       #ySpacing:F
    .restart local v44       #x:I
    .restart local v45       #y:I
    :cond_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const v3, -0x333334

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1343
    sget-boolean v2, Lcom/pdonlon/mines2/Board;->pro:Z

    if-eqz v2, :cond_6

    .line 1344
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/16 v3, 0xff

    const/16 v4, 0xf0

    const/16 v5, 0xe6

    const/16 v6, 0x8c

    invoke-static {v3, v4, v5, v6}, Landroid/graphics/Color;->argb(IIII)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1345
    :cond_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1346
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float v29, v2, v9

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float v30, v2, v10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    move/from16 v27, v9

    move/from16 v28, v10

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_3

    .line 1351
    :cond_7
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float/2addr v10, v2

    .line 1321
    add-int/lit8 v45, v45, 0x1

    goto/16 :goto_1

    .line 1355
    .end local v9           #xSpacing:F
    .end local v44           #x:I
    :cond_8
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->width:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offX:F

    add-float v27, v2, v3

    const/4 v2, 0x0

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offY:F

    add-float v28, v2, v3

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->width:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x40a0

    div-float/2addr v3, v4

    add-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offX:F

    add-float v29, v2, v3

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->height:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offY:F

    add-float v30, v2, v3

    move-object/from16 v26, p1

    move-object/from16 v31, v35

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1356
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offX:F

    add-float v27, v2, v3

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->height:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offY:F

    add-float v28, v2, v3

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->width:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offX:F

    add-float v29, v2, v3

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->height:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x40a0

    div-float/2addr v3, v4

    add-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offY:F

    add-float v30, v2, v3

    move-object/from16 v26, p1

    move-object/from16 v31, v35

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1358
    sget-boolean v2, Lcom/pdonlon/mines2/Board;->pro:Z

    if-eqz v2, :cond_b

    .line 1359
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v2, v3, v4, v5}, Landroid/graphics/Color;->argb(IIII)I

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/pdonlon/mines2/Board;->colors2:I

    .line 1363
    :goto_4
    new-instance v26, Landroid/graphics/LinearGradient;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pdonlon/mines2/Board;->offX:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pdonlon/mines2/Board;->offY:F

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->width:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offX:F

    add-float v29, v2, v3

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->height:I

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offY:F

    add-float v30, v2, v3

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pdonlon/mines2/Board;->colors1:I

    move/from16 v31, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pdonlon/mines2/Board;->colors2:I

    move/from16 v32, v0

    sget-object v33, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v26 .. v33}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pdonlon/mines2/Board;->shader:Landroid/graphics/Shader;

    .line 1366
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pdonlon/mines2/Board;->shader:Landroid/graphics/Shader;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 1368
    new-instance v2, Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offX:F

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->offY:F

    move-object/from16 v0, p0

    iget v5, v0, Lcom/pdonlon/mines2/Board;->width:I

    int-to-float v5, v5

    move-object/from16 v0, p0

    iget v6, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v5, v6

    move-object/from16 v0, p0

    iget v6, v0, Lcom/pdonlon/mines2/Board;->offX:F

    add-float/2addr v5, v6

    move-object/from16 v0, p0

    iget v6, v0, Lcom/pdonlon/mines2/Board;->height:I

    int-to-float v6, v6

    move-object/from16 v0, p0

    iget v8, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v6, v8

    move-object/from16 v0, p0

    iget v8, v0, Lcom/pdonlon/mines2/Board;->offY:F

    add-float/2addr v6, v8

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 1370
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 1375
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1380
    move-object/from16 v0, p0

    iget v10, v0, Lcom/pdonlon/mines2/Board;->offY:F

    .line 1382
    const/16 v45, 0x0

    :goto_5
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->height:I

    move/from16 v0, v45

    if-ge v0, v2, :cond_14

    .line 1384
    move-object/from16 v0, p0

    iget v9, v0, Lcom/pdonlon/mines2/Board;->offX:F

    .line 1386
    .restart local v9       #xSpacing:F
    const/16 v44, 0x0

    .restart local v44       #x:I
    :goto_6
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->width:I

    move/from16 v0, v44

    if-ge v0, v2, :cond_13

    .line 1388
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v3, v3, v44

    aget-object v3, v3, v45

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Mine;->determineColor()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1390
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v44

    aget-object v2, v2, v45

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Mine;->isOpened()Z

    move-result v2

    if-nez v2, :cond_d

    .line 1392
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v44

    aget-object v2, v2, v45

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Mine;->isWrong()Z

    move-result v2

    if-eqz v2, :cond_c

    .line 1393
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->color1:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1395
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const v3, -0x777778

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1396
    sget-boolean v2, Lcom/pdonlon/mines2/Board;->pro:Z

    if-eqz v2, :cond_9

    .line 1397
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/16 v3, 0xff

    const/16 v4, 0xff

    const/16 v5, 0xd7

    const/4 v6, 0x0

    invoke-static {v3, v4, v5, v6}, Landroid/graphics/Color;->argb(IIII)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1398
    :cond_9
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float v29, v2, v9

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float v30, v2, v10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    move/from16 v27, v9

    move/from16 v28, v10

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1399
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1401
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x4160

    div-float/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1402
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1404
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4080

    div-float/2addr v2, v3

    add-float v27, v9, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4080

    div-float/2addr v2, v3

    add-float v28, v10, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float/2addr v2, v9

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x4080

    div-float/2addr v3, v4

    sub-float v29, v2, v3

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float/2addr v2, v10

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x4080

    div-float/2addr v3, v4

    sub-float v30, v2, v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1405
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float/2addr v2, v9

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x4080

    div-float/2addr v3, v4

    sub-float v27, v2, v3

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4080

    div-float/2addr v2, v3

    add-float v28, v10, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4080

    div-float/2addr v2, v3

    add-float v29, v9, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float/2addr v2, v10

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x4080

    div-float/2addr v3, v4

    sub-float v30, v2, v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1483
    :cond_a
    :goto_7
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float/2addr v9, v2

    .line 1386
    add-int/lit8 v44, v44, 0x1

    goto/16 :goto_6

    .line 1361
    .end local v9           #xSpacing:F
    .end local v44           #x:I
    :cond_b
    const/16 v2, 0x64

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v2, v3, v4, v5}, Landroid/graphics/Color;->argb(IIII)I

    move-result v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/pdonlon/mines2/Board;->colors2:I

    goto/16 :goto_4

    .line 1410
    .restart local v9       #xSpacing:F
    .restart local v44       #x:I
    :cond_c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v44

    aget-object v2, v2, v45

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Mine;->isFlagged()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 1412
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1414
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4040

    div-float/2addr v2, v3

    add-float v27, v9, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4040

    div-float/2addr v2, v3

    add-float v28, v10, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4000

    mul-float/2addr v2, v3

    const/high16 v3, 0x4040

    div-float/2addr v2, v3

    add-float v29, v9, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4000

    div-float/2addr v2, v3

    add-float v30, v10, v2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1416
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/high16 v3, -0x100

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1417
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x41b8

    div-float/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1418
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4040

    div-float/2addr v2, v3

    add-float v27, v9, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4040

    div-float/2addr v2, v3

    add-float v28, v10, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4040

    div-float/2addr v2, v3

    add-float v29, v9, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4040

    mul-float/2addr v2, v3

    const/high16 v3, 0x4080

    div-float/2addr v2, v3

    add-float v30, v10, v2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1420
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/high16 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1421
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->color3:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1422
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/high16 v3, -0x100

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    goto/16 :goto_7

    .line 1428
    :cond_d
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v44

    aget-object v2, v2, v45

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Mine;->isBomb()Z

    move-result v2

    if-eqz v2, :cond_f

    .line 1430
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1433
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/high16 v3, -0x100

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1434
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4000

    div-float/2addr v2, v3

    add-float/2addr v2, v9

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x4000

    div-float/2addr v3, v4

    add-float/2addr v3, v10

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v5, 0x4080

    div-float/2addr v4, v5

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1436
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x4160

    div-float/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1437
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1438
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4080

    div-float/2addr v2, v3

    add-float v27, v9, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4080

    div-float/2addr v2, v3

    add-float v28, v10, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float/2addr v2, v9

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x4080

    div-float/2addr v3, v4

    sub-float v29, v2, v3

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float/2addr v2, v10

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x4080

    div-float/2addr v3, v4

    sub-float v30, v2, v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1439
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4100

    div-float/2addr v2, v3

    add-float v27, v9, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4000

    div-float/2addr v2, v3

    add-float v28, v10, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float/2addr v2, v9

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x4100

    div-float/2addr v3, v4

    sub-float v29, v2, v3

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4000

    div-float/2addr v2, v3

    add-float v30, v10, v2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1440
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float/2addr v2, v9

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x4080

    div-float/2addr v3, v4

    sub-float v27, v2, v3

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4080

    div-float/2addr v2, v3

    add-float v28, v10, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4080

    div-float/2addr v2, v3

    add-float v29, v9, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float/2addr v2, v10

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x4080

    div-float/2addr v3, v4

    sub-float v30, v2, v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1441
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4000

    div-float/2addr v2, v3

    add-float v27, v9, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4100

    div-float/2addr v2, v3

    add-float v28, v10, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v3, 0x4000

    div-float/2addr v2, v3

    add-float v29, v9, v2

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float/2addr v2, v10

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x4100

    div-float/2addr v3, v4

    sub-float v30, v2, v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1444
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1446
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const v3, -0x777778

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1447
    sget-boolean v2, Lcom/pdonlon/mines2/Board;->pro:Z

    if-eqz v2, :cond_e

    .line 1448
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/16 v3, 0xff

    const/16 v4, 0xff

    const/16 v5, 0xd7

    const/4 v6, 0x0

    invoke-static {v3, v4, v5, v6}, Landroid/graphics/Color;->argb(IIII)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1449
    :cond_e
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x41a0

    div-float/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1450
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float v29, v2, v9

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float v30, v2, v10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    move/from16 v27, v9

    move/from16 v28, v10

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_7

    .line 1453
    :cond_f
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v2, v2, v44

    aget-object v2, v2, v45

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Mine;->getBombsSurrounding()I

    move-result v2

    if-nez v2, :cond_11

    .line 1455
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1456
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const v3, -0x777778

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1457
    sget-boolean v2, Lcom/pdonlon/mines2/Board;->pro:Z

    if-eqz v2, :cond_10

    .line 1458
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/16 v3, 0xff

    const/16 v4, 0xff

    const/16 v5, 0xd7

    const/4 v6, 0x0

    invoke-static {v3, v4, v5, v6}, Landroid/graphics/Color;->argb(IIII)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1459
    :cond_10
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x41a0

    div-float/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1460
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float v29, v2, v9

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float v30, v2, v10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    move/from16 v27, v9

    move/from16 v28, v10

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_7

    .line 1465
    :cond_11
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1466
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float v29, v2, v9

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float v30, v2, v10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    move/from16 v27, v9

    move/from16 v28, v10

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1467
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->color3:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1468
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float v29, v2, v9

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float v30, v2, v10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    move/from16 v27, v9

    move/from16 v28, v10

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1469
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1471
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v3, v3, v44

    aget-object v3, v3, v45

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Mine;->getBombsSurrounding()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x4000

    mul-float/2addr v3, v4

    const/high16 v4, 0x40a0

    div-float/2addr v3, v4

    add-float/2addr v3, v9

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v5, 0x4000

    mul-float/2addr v4, v5

    const/high16 v5, 0x4040

    div-float/2addr v4, v5

    add-float/2addr v4, v10

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1473
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const v3, -0x777778

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1474
    sget-boolean v2, Lcom/pdonlon/mines2/Board;->pro:Z

    if-eqz v2, :cond_12

    .line 1475
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/16 v3, 0xff

    const/16 v4, 0xff

    const/16 v5, 0xd7

    const/4 v6, 0x0

    invoke-static {v3, v4, v5, v6}, Landroid/graphics/Color;->argb(IIII)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1476
    :cond_12
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1477
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x41a0

    div-float/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1478
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float v29, v2, v9

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float v30, v2, v10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    move/from16 v27, v9

    move/from16 v28, v10

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_7

    .line 1485
    :cond_13
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float/2addr v10, v2

    .line 1382
    add-int/lit8 v45, v45, 0x1

    goto/16 :goto_5

    .line 1488
    .end local v9           #xSpacing:F
    .end local v44           #x:I
    :cond_14
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/pdonlon/mines2/Board;->beingPressed:Z

    if-eqz v2, :cond_15

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v2}, Lcom/pdonlon/mines2/DrawPanel;->getFlagMode()Z

    move-result v2

    if-nez v2, :cond_15

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->pressedCords:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pdonlon/mines2/Board;->pressedCords:[I

    const/4 v4, 0x1

    aget v3, v3, v4

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lcom/pdonlon/mines2/Board;->isUntouched(II)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 1489
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1490
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->pressedCords:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offX:F

    add-float v21, v2, v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->pressedCords:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offY:F

    add-float v22, v2, v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->pressedCords:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offX:F

    add-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float v23, v2, v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->pressedCords:[I

    const/4 v3, 0x1

    aget v2, v2, v3

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offY:F

    add-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float v24, v2, v3

    move-object/from16 v20, p1

    invoke-virtual/range {v20 .. v25}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1493
    :cond_15
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1494
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/high16 v3, -0x100

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1496
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->actionAndStatus:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_16

    .line 1497
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v2, v2, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    invoke-virtual {v2}, Lcom/pdonlon/mines2/MainActivity;->getActionBarHeight()I

    move-result v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v3, v3, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    invoke-virtual {v3}, Lcom/pdonlon/mines2/MainActivity;->getStatusBarHeight()I

    move-result v3

    add-int/2addr v2, v3

    move-object/from16 v0, p0

    iput v2, v0, Lcom/pdonlon/mines2/Board;->actionAndStatus:I

    .line 1500
    :cond_16
    const-wide v2, 0x3fb999999999999aL

    sget v4, Lcom/pdonlon/mines2/MainActivity;->screenHeight:I

    int-to-double v4, v4

    mul-double/2addr v2, v4

    double-to-int v2, v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/pdonlon/mines2/Board;->barHeight:I

    .line 1501
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenHeight:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->actionAndStatus:I

    sub-int/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->barHeight:I

    sub-int/2addr v2, v3

    int-to-float v2, v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    .line 1502
    const/16 v27, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    move/from16 v28, v0

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-float v0, v2

    move/from16 v29, v0

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenHeight:I

    int-to-float v0, v2

    move/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1510
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget v3, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    div-int/lit16 v3, v3, 0x2d0

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1512
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1513
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x1

    div-int/lit8 v2, v2, 0x5

    int-to-float v0, v2

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    move/from16 v28, v0

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x1

    div-int/lit8 v2, v2, 0x5

    int-to-float v0, v2

    move/from16 v29, v0

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenHeight:I

    int-to-float v0, v2

    move/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1514
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x2

    div-int/lit8 v2, v2, 0x5

    int-to-float v0, v2

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    move/from16 v28, v0

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x2

    div-int/lit8 v2, v2, 0x5

    int-to-float v0, v2

    move/from16 v29, v0

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenHeight:I

    int-to-float v0, v2

    move/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1515
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x3

    div-int/lit8 v2, v2, 0x5

    int-to-float v0, v2

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    move/from16 v28, v0

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x3

    div-int/lit8 v2, v2, 0x5

    int-to-float v0, v2

    move/from16 v29, v0

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenHeight:I

    int-to-float v0, v2

    move/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1516
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x4

    div-int/lit8 v2, v2, 0x5

    int-to-float v0, v2

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    move/from16 v28, v0

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x4

    div-int/lit8 v2, v2, 0x5

    int-to-float v0, v2

    move/from16 v29, v0

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenHeight:I

    int-to-float v0, v2

    move/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1523
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1524
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget v3, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    div-int/lit8 v3, v3, 0x78

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1526
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/16 v3, 0xff

    const/16 v4, 0xbe

    const/16 v5, 0xbe

    const/16 v6, 0xbe

    invoke-static {v3, v4, v5, v6}, Landroid/graphics/Color;->argb(IIII)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1527
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/pdonlon/mines2/Board;->win:Z

    if-eqz v2, :cond_1e

    .line 1528
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const v3, -0xff0100

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1533
    :cond_17
    :goto_8
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x7

    div-int/lit8 v2, v2, 0xa

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v4, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v14, v3

    const-wide v16, 0x4031800000000000L

    div-double v14, v14, v16

    add-double/2addr v4, v14

    double-to-float v3, v4

    sget v4, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    div-int/lit8 v4, v4, 0x1e

    int-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1534
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x48

    div-int/lit8 v2, v2, 0x64

    int-to-float v0, v2

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v4, v4

    const-wide v14, 0x402b666666666666L

    div-double/2addr v4, v14

    add-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v28, v0

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x4c

    div-int/lit8 v2, v2, 0x64

    int-to-float v0, v2

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v4, v4

    const-wide v14, 0x4024800000000000L

    div-double/2addr v4, v14

    add-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1536
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x9

    div-int/lit8 v2, v2, 0xa

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v4, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v14, v3

    const-wide v16, 0x4031800000000000L

    div-double v14, v14, v16

    add-double/2addr v4, v14

    double-to-float v3, v4

    sget v4, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    div-int/lit8 v4, v4, 0x1e

    int-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1537
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x5c

    div-int/lit8 v2, v2, 0x64

    int-to-float v0, v2

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v4, v4

    const-wide v14, 0x402b666666666666L

    div-double/2addr v4, v14

    add-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v28, v0

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x60

    div-int/lit8 v2, v2, 0x64

    int-to-float v0, v2

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v4, v4

    const-wide v14, 0x4024800000000000L

    div-double/2addr v4, v14

    add-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1539
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x9

    div-int/lit8 v2, v2, 0xa

    int-to-float v0, v2

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    const/high16 v4, 0x41b0

    div-float/2addr v3, v4

    add-float v28, v2, v3

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x9

    div-int/lit8 v2, v2, 0xa

    int-to-float v0, v2

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v4, v4

    const-wide v14, 0x402d6147ae147ae1L

    div-double/2addr v4, v14

    add-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1541
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x7

    div-int/lit8 v2, v2, 0xa

    sget v3, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    div-int/lit8 v3, v3, 0x48

    sub-int/2addr v2, v3

    int-to-float v0, v2

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v4, v4

    const-wide v14, 0x4031800000000000L

    div-double/2addr v4, v14

    add-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v28, v0

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x7

    div-int/lit8 v2, v2, 0xa

    sget v3, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    div-int/lit8 v3, v3, 0x48

    add-int/2addr v2, v3

    int-to-float v0, v2

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v4, v4

    const-wide v14, 0x4031800000000000L

    div-double/2addr v4, v14

    add-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1542
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x9

    div-int/lit8 v2, v2, 0xa

    sget v3, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    div-int/lit8 v3, v3, 0x41

    sub-int/2addr v2, v3

    int-to-float v0, v2

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v4, v4

    const-wide v14, 0x4031800000000000L

    div-double/2addr v4, v14

    add-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v28, v0

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x9

    div-int/lit8 v2, v2, 0xa

    sget v3, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    div-int/lit8 v3, v3, 0x41

    add-int/2addr v2, v3

    int-to-float v0, v2

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v4, v4

    const-wide v14, 0x4031800000000000L

    div-double/2addr v4, v14

    add-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1545
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-double v2, v2

    const-wide v4, 0x4013333333333333L

    div-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v34, v0

    .line 1546
    .local v34, bSize:F
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x3

    div-int/lit8 v2, v2, 0xa

    int-to-double v2, v2

    sget v4, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-double v4, v4

    const-wide v14, 0x4023333333333333L

    div-double/2addr v4, v14

    sub-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v40, v0

    .line 1547
    .local v40, sX:F
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v4, v4

    const-wide v14, 0x404959999999999aL

    div-double/2addr v4, v14

    sub-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v41, v0

    .line 1549
    .local v41, sY:F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1550
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Lcom/pdonlon/mines2/Board;->tf:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 1551
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x40a0

    div-float v3, v34, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 1552
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->flagCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/high16 v3, 0x4040

    div-float v3, v34, v3

    add-float v3, v3, v40

    sget v4, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    div-int/lit8 v4, v4, 0x12

    int-to-float v4, v4

    add-float/2addr v3, v4

    const/high16 v4, 0x4040

    mul-float v4, v4, v34

    const/high16 v5, 0x4080

    div-float/2addr v4, v5

    add-float v4, v4, v41

    float-to-double v4, v4

    move-object/from16 v0, p0

    iget v6, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v14, v6

    const-wide v16, 0x405959999999999aL

    div-double v14, v14, v16

    add-double/2addr v4, v14

    double-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1553
    const/high16 v2, 0x4040

    div-float v2, v34, v2

    add-float v27, v40, v2

    const/high16 v2, 0x4040

    div-float v2, v34, v2

    add-float v28, v41, v2

    const/high16 v2, 0x4000

    mul-float v2, v2, v34

    const/high16 v3, 0x4040

    div-float/2addr v2, v3

    add-float v29, v40, v2

    const/high16 v2, 0x4000

    div-float v2, v34, v2

    add-float v30, v41, v2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1555
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1556
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x41b8

    div-float v3, v34, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1557
    const/high16 v2, 0x4040

    div-float v2, v34, v2

    add-float v27, v40, v2

    const/high16 v2, 0x4040

    div-float v2, v34, v2

    add-float v2, v2, v41

    float-to-double v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v4, v4

    const-wide v14, 0x40621b3333333333L

    div-double/2addr v4, v14

    sub-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v28, v0

    const/high16 v2, 0x4040

    div-float v2, v34, v2

    add-float v29, v40, v2

    const/high16 v2, 0x4040

    mul-float v2, v2, v34

    const/high16 v3, 0x4080

    div-float/2addr v2, v3

    add-float v30, v41, v2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1561
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x1

    div-int/lit8 v2, v2, 0xa

    sget v3, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    div-int/lit8 v3, v3, 0x24

    sub-int/2addr v2, v3

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v4, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v14, v3

    const-wide v16, 0x4031800000000000L

    div-double v14, v14, v16

    add-double/2addr v4, v14

    double-to-float v3, v4

    sget v4, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-double v4, v4

    const-wide v14, 0x4036800000000000L

    div-double/2addr v4, v14

    double-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1562
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x4220

    div-float v3, v34, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1564
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x1

    int-to-float v2, v2

    const/high16 v3, 0x4120

    div-float/2addr v2, v3

    sget v3, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    div-int/lit8 v3, v3, 0x24

    int-to-float v3, v3

    sub-float/2addr v2, v3

    move-object/from16 v0, p0

    iput v2, v0, Lcom/pdonlon/mines2/Board;->xOrig:F

    .line 1565
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v4, v4

    const-wide v14, 0x4031800000000000L

    div-double/2addr v4, v14

    add-double/2addr v2, v4

    double-to-float v2, v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/pdonlon/mines2/Board;->yOrig:F

    .line 1567
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->xOrig:F

    float-to-double v2, v2

    sget v4, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-double v4, v4

    const-wide v14, 0x403e800000000000L

    div-double/2addr v4, v14

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/pdonlon/mines2/Board;->theta1:D

    invoke-static {v14, v15}, Ljava/lang/Math;->cos(D)D

    move-result-wide v14

    mul-double/2addr v4, v14

    add-double/2addr v2, v4

    double-to-float v2, v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/pdonlon/mines2/Board;->clockHandX1:F

    .line 1568
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->yOrig:F

    float-to-double v2, v2

    sget v4, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-double v4, v4

    const-wide v14, 0x403e800000000000L

    div-double/2addr v4, v14

    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/pdonlon/mines2/Board;->theta1:D

    invoke-static {v14, v15}, Ljava/lang/Math;->sin(D)D

    move-result-wide v14

    mul-double/2addr v4, v14

    add-double/2addr v2, v4

    double-to-float v2, v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/pdonlon/mines2/Board;->clockHandY1:F

    .line 1574
    move-object/from16 v0, p0

    iget v0, v0, Lcom/pdonlon/mines2/Board;->xOrig:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pdonlon/mines2/Board;->yOrig:F

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pdonlon/mines2/Board;->clockHandX1:F

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pdonlon/mines2/Board;->clockHandY1:F

    move/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1575
    move-object/from16 v0, p0

    iget v0, v0, Lcom/pdonlon/mines2/Board;->xOrig:F

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pdonlon/mines2/Board;->yOrig:F

    move/from16 v28, v0

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x1

    int-to-double v2, v2

    const-wide/high16 v4, 0x4025

    div-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v4, v4

    const-wide v14, 0x402f666666666666L

    div-double/2addr v4, v14

    add-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1578
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1579
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x40a0

    div-float v3, v34, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 1580
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x1

    div-int/lit8 v2, v2, 0xa

    int-to-double v2, v2

    sget v4, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-double v4, v4

    const-wide v14, 0x4023333333333333L

    div-double/2addr v4, v14

    sub-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v40, v0

    .line 1582
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->timeCounter:I

    const/16 v3, 0x3e8

    if-lt v2, v3, :cond_18

    .line 1583
    const/16 v2, 0x3e7

    move-object/from16 v0, p0

    iput v2, v0, Lcom/pdonlon/mines2/Board;->timeCounter:I

    .line 1584
    :cond_18
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->timeCounter:I

    const/16 v3, 0x64

    if-lt v2, v3, :cond_1f

    .line 1586
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    div-int/lit16 v2, v2, 0x168

    int-to-float v2, v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/pdonlon/mines2/Board;->push:F

    .line 1587
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->timeCounter:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/high16 v3, 0x4040

    div-float v3, v34, v3

    add-float v3, v3, v40

    sget v4, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    div-int/lit8 v4, v4, 0x12

    int-to-float v4, v4

    add-float/2addr v3, v4

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->push:F

    sub-float/2addr v3, v4

    const/high16 v4, 0x4040

    mul-float v4, v4, v34

    const/high16 v5, 0x4080

    div-float/2addr v4, v5

    add-float v4, v4, v41

    float-to-double v4, v4

    sget v6, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-double v14, v6

    const-wide v16, 0x405959999999999aL

    div-double v14, v14, v16

    add-double/2addr v4, v14

    double-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1605
    :cond_19
    :goto_9
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    iget-boolean v2, v2, Lcom/pdonlon/mines2/DrawPanel;->flagMode:Z

    if-nez v2, :cond_22

    .line 1607
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-double v2, v2

    const-wide v4, 0x401ccccccccccccdL

    div-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v37, v0

    .line 1608
    .local v37, bombSize:F
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x5

    div-int/lit8 v2, v2, 0xa

    int-to-double v2, v2

    sget v4, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-double v4, v4

    const-wide v14, 0x402ccccccccccccdL

    div-double/2addr v4, v14

    sub-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v42, v0

    .line 1609
    .local v42, startingX:F
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v4, v4

    const-wide v14, 0x405959999999999aL

    div-double/2addr v4, v14

    add-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v43, v0

    .line 1610
    .local v43, startingY:F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1611
    const/high16 v2, 0x4000

    div-float v2, v37, v2

    add-float v2, v2, v42

    const/high16 v3, 0x4000

    div-float v3, v37, v3

    add-float v3, v3, v43

    const/high16 v4, 0x4080

    div-float v4, v37, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1613
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x4160

    div-float v3, v37, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1614
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1616
    const/high16 v2, 0x4080

    div-float v2, v37, v2

    add-float v27, v42, v2

    const/high16 v2, 0x4080

    div-float v2, v37, v2

    add-float v28, v43, v2

    add-float v2, v42, v37

    const/high16 v3, 0x4080

    div-float v3, v37, v3

    sub-float v29, v2, v3

    add-float v2, v43, v37

    const/high16 v3, 0x4080

    div-float v3, v37, v3

    sub-float v30, v2, v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1618
    const/high16 v2, 0x4100

    div-float v2, v37, v2

    add-float v27, v42, v2

    const/high16 v2, 0x4000

    div-float v2, v37, v2

    add-float v28, v43, v2

    add-float v2, v42, v37

    const/high16 v3, 0x4100

    div-float v3, v37, v3

    sub-float v29, v2, v3

    const/high16 v2, 0x4000

    div-float v2, v37, v2

    add-float v30, v43, v2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1620
    add-float v2, v42, v37

    const/high16 v3, 0x4080

    div-float v3, v37, v3

    sub-float v27, v2, v3

    const/high16 v2, 0x4080

    div-float v2, v37, v2

    add-float v28, v43, v2

    const/high16 v2, 0x4080

    div-float v2, v37, v2

    add-float v29, v42, v2

    add-float v2, v43, v37

    const/high16 v3, 0x4080

    div-float v3, v37, v3

    sub-float v30, v2, v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1622
    const/high16 v2, 0x4000

    div-float v2, v37, v2

    add-float v27, v42, v2

    const/high16 v2, 0x4100

    div-float v2, v37, v2

    add-float v28, v43, v2

    const/high16 v2, 0x4000

    div-float v2, v37, v2

    add-float v29, v42, v2

    add-float v2, v43, v37

    const/high16 v3, 0x4100

    div-float v3, v37, v3

    sub-float v30, v2, v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1639
    .end local v37           #bombSize:F
    .end local v42           #startingX:F
    .end local v43           #startingY:F
    :goto_a
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/pdonlon/mines2/Board;->showCheck:Z

    if-eqz v2, :cond_1a

    .line 1641
    invoke-virtual/range {p0 .. p0}, Lcom/pdonlon/mines2/Board;->checkBoard()Z

    move-result v2

    if-eqz v2, :cond_23

    .line 1642
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/16 v3, 0x50

    const/4 v4, 0x0

    const/16 v5, 0xff

    const/4 v6, 0x0

    invoke-static {v3, v4, v5, v6}, Landroid/graphics/Color;->argb(IIII)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1647
    :goto_b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1648
    const/16 v27, 0x0

    const/16 v28, 0x0

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-float v0, v2

    move/from16 v29, v0

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenHeight:I

    int-to-float v0, v2

    move/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1652
    :cond_1a
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/pdonlon/mines2/Board;->showHint:Z

    if-eqz v2, :cond_1c

    invoke-virtual/range {p0 .. p0}, Lcom/pdonlon/mines2/Board;->getHint()[I

    move-result-object v2

    const/4 v3, 0x0

    aget v2, v2, v3

    if-ltz v2, :cond_1c

    invoke-virtual/range {p0 .. p0}, Lcom/pdonlon/mines2/Board;->getHint()[I

    move-result-object v2

    const/4 v3, 0x1

    aget v2, v2, v3

    if-ltz v2, :cond_1c

    .line 1653
    invoke-virtual/range {p0 .. p0}, Lcom/pdonlon/mines2/Board;->getHint()[I

    .line 1654
    const/16 v2, 0xff

    const/16 v3, 0xff

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v2, v3, v4, v5}, Landroid/graphics/Color;->argb(IIII)I

    move-result v38

    .line 1655
    .local v38, color:I
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/pdonlon/mines2/Board;->hintColorYellow:Z

    if-eqz v2, :cond_1b

    .line 1656
    const/16 v2, 0xff

    const/16 v3, 0xff

    const/16 v4, 0xff

    const/4 v5, 0x0

    invoke-static {v2, v3, v4, v5}, Landroid/graphics/Color;->argb(IIII)I

    move-result v38

    .line 1658
    :cond_1b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move/from16 v0, v38

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 1659
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    const/high16 v4, 0x4140

    div-float/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1660
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1662
    invoke-virtual/range {p0 .. p0}, Lcom/pdonlon/mines2/Board;->getHint()[I

    move-result-object v2

    const/4 v3, 0x0

    aget v2, v2, v3

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offX:F

    add-float v27, v2, v3

    invoke-virtual/range {p0 .. p0}, Lcom/pdonlon/mines2/Board;->getHint()[I

    move-result-object v2

    const/4 v3, 0x1

    aget v2, v2, v3

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offY:F

    add-float v28, v2, v3

    invoke-virtual/range {p0 .. p0}, Lcom/pdonlon/mines2/Board;->getHint()[I

    move-result-object v2

    const/4 v3, 0x0

    aget v2, v2, v3

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offX:F

    add-float v29, v2, v3

    invoke-virtual/range {p0 .. p0}, Lcom/pdonlon/mines2/Board;->getHint()[I

    move-result-object v2

    const/4 v3, 0x1

    aget v2, v2, v3

    int-to-float v2, v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->tileSize:F

    add-float/2addr v2, v3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->offY:F

    add-float v30, v2, v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1665
    .end local v38           #color:I
    :cond_1c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    iget-boolean v2, v2, Lcom/pdonlon/mines2/DrawPanel;->paused:Z

    if-eqz v2, :cond_1d

    .line 1667
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/16 v3, 0xbe

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v3, v4, v5, v6}, Landroid/graphics/Color;->argb(IIII)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 1668
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1669
    const/16 v27, 0x0

    const/16 v28, 0x0

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-float v0, v2

    move/from16 v29, v0

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenHeight:I

    int-to-float v2, v2

    sget v3, Lcom/pdonlon/mines2/MainActivity;->screenHeight:I

    int-to-float v3, v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    sub-float/2addr v3, v4

    sub-float v30, v2, v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1671
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 1674
    :cond_1d
    return-void

    .line 1529
    .end local v34           #bSize:F
    .end local v40           #sX:F
    .end local v41           #sY:F
    :cond_1e
    sget-boolean v2, Lcom/pdonlon/mines2/Board;->pro:Z

    if-eqz v2, :cond_17

    .line 1530
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/16 v3, 0xff

    const/16 v4, 0xff

    const/16 v5, 0xd7

    const/4 v6, 0x0

    invoke-static {v3, v4, v5, v6}, Landroid/graphics/Color;->argb(IIII)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    goto/16 :goto_8

    .line 1590
    .restart local v34       #bSize:F
    .restart local v40       #sX:F
    .restart local v41       #sY:F
    :cond_1f
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->timeCounter:I

    const/16 v3, 0xa

    if-ge v2, v3, :cond_21

    .line 1592
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    div-int/lit8 v2, v2, 0x30

    int-to-float v2, v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/pdonlon/mines2/Board;->push:F

    .line 1593
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->timeCounter:I

    if-gez v2, :cond_20

    .line 1594
    const-string v2, "0"

    const/high16 v3, 0x4040

    div-float v3, v34, v3

    add-float v3, v3, v40

    sget v4, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    div-int/lit8 v4, v4, 0x12

    int-to-float v4, v4

    add-float/2addr v3, v4

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->push:F

    add-float/2addr v3, v4

    const/high16 v4, 0x4040

    mul-float v4, v4, v34

    const/high16 v5, 0x4080

    div-float/2addr v4, v5

    add-float v4, v4, v41

    float-to-double v4, v4

    sget v6, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-double v14, v6

    const-wide v16, 0x405959999999999aL

    div-double v14, v14, v16

    add-double/2addr v4, v14

    double-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto/16 :goto_9

    .line 1596
    :cond_20
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->timeCounter:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/high16 v3, 0x4040

    div-float v3, v34, v3

    add-float v3, v3, v40

    sget v4, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    div-int/lit8 v4, v4, 0x12

    int-to-float v4, v4

    add-float/2addr v3, v4

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->push:F

    add-float/2addr v3, v4

    const/high16 v4, 0x4040

    mul-float v4, v4, v34

    const/high16 v5, 0x4080

    div-float/2addr v4, v5

    add-float v4, v4, v41

    float-to-double v4, v4

    sget v6, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-double v14, v6

    const-wide v16, 0x405959999999999aL

    div-double v14, v14, v16

    add-double/2addr v4, v14

    double-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto/16 :goto_9

    .line 1598
    :cond_21
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->timeCounter:I

    const/16 v3, 0x9

    if-le v2, v3, :cond_19

    .line 1600
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    div-int/lit8 v2, v2, 0x5a

    int-to-float v2, v2

    move-object/from16 v0, p0

    iput v2, v0, Lcom/pdonlon/mines2/Board;->push:F

    .line 1601
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->timeCounter:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/high16 v3, 0x4040

    div-float v3, v34, v3

    add-float v3, v3, v40

    sget v4, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    div-int/lit8 v4, v4, 0x12

    int-to-float v4, v4

    add-float/2addr v3, v4

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->push:F

    add-float/2addr v3, v4

    const/high16 v4, 0x4040

    mul-float v4, v4, v34

    const/high16 v5, 0x4080

    div-float/2addr v4, v5

    add-float v4, v4, v41

    float-to-double v4, v4

    sget v6, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-double v14, v6

    const-wide v16, 0x405959999999999aL

    div-double v14, v14, v16

    add-double/2addr v4, v14

    double-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto/16 :goto_9

    .line 1627
    :cond_22
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-double v2, v2

    const-wide v4, 0x4013333333333333L

    div-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v34, v0

    .line 1628
    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    mul-int/lit8 v2, v2, 0x5

    div-int/lit8 v2, v2, 0xa

    int-to-double v2, v2

    sget v4, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-double v4, v4

    const-wide v14, 0x402528f5c28f5c29L

    div-double/2addr v4, v14

    sub-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v40, v0

    .line 1629
    move-object/from16 v0, p0

    iget v2, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v4, v4

    const-wide v14, 0x4055200000000000L

    div-double/2addr v4, v14

    sub-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v41, v0

    .line 1631
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1632
    const/high16 v2, 0x4040

    div-float v2, v34, v2

    add-float v27, v40, v2

    const/high16 v2, 0x4040

    div-float v2, v34, v2

    add-float v2, v2, v41

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    const v4, 0x43fd8000

    div-float/2addr v3, v4

    sub-float v28, v2, v3

    const/high16 v2, 0x4000

    mul-float v2, v2, v34

    const/high16 v3, 0x4040

    div-float/2addr v2, v3

    add-float v29, v40, v2

    const/high16 v2, 0x4000

    div-float v2, v34, v2

    add-float v2, v2, v41

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    const v4, 0x43fd8000

    div-float/2addr v3, v4

    sub-float v30, v2, v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1634
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1635
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x41b8

    div-float v3, v34, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1636
    const/high16 v2, 0x4040

    div-float v2, v34, v2

    add-float v27, v40, v2

    const/high16 v2, 0x4040

    div-float v2, v34, v2

    add-float v2, v2, v41

    float-to-double v2, v2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    float-to-double v4, v4

    const-wide v14, 0x40621b3333333333L

    div-double/2addr v4, v14

    sub-double/2addr v2, v4

    double-to-float v0, v2

    move/from16 v28, v0

    const/high16 v2, 0x4040

    div-float v2, v34, v2

    add-float v29, v40, v2

    const/high16 v2, 0x4040

    mul-float v2, v2, v34

    const/high16 v3, 0x4080

    div-float/2addr v2, v3

    add-float v2, v2, v41

    move-object/from16 v0, p0

    iget v3, v0, Lcom/pdonlon/mines2/Board;->realBarHeight:F

    const/high16 v4, 0x43a9

    div-float/2addr v3, v4

    sub-float v30, v2, v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    move-object/from16 v26, p1

    invoke-virtual/range {v26 .. v31}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_a

    .line 1645
    :cond_23
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pdonlon/mines2/Board;->paint:Landroid/graphics/Paint;

    const/16 v3, 0x50

    const/16 v4, 0xff

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v3, v4, v5, v6}, Landroid/graphics/Color;->argb(IIII)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    goto/16 :goto_b
.end method

.method public placeBombLocation(II)V
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 1033
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->bombs:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v0, p1, p2}, Lcom/pdonlon/mines2/CheckList;->enque(II)V

    .line 1034
    return-void
.end method

.method public placeBombs()V
    .locals 10

    .prologue
    .line 567
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v6

    const-wide v8, 0x4197d78400000000L

    mul-double/2addr v6, v8

    double-to-int v4, v6

    .line 568
    .local v4, randomSeed:I
    iget v5, p0, Lcom/pdonlon/mines2/Board;->seed:I

    const/4 v6, -0x1

    if-le v5, v6, :cond_1

    .line 569
    new-instance v1, Ljava/util/Random;

    iget v5, p0, Lcom/pdonlon/mines2/Board;->seed:I

    int-to-long v6, v5

    invoke-direct {v1, v6, v7}, Ljava/util/Random;-><init>(J)V

    .line 573
    .local v1, generator:Ljava/util/Random;
    :goto_0
    iget-object v5, p0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v6, p0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v6, v6, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    const-string v7, "seed"

    iget v8, p0, Lcom/pdonlon/mines2/Board;->seed:I

    invoke-virtual {v5, v6, v7, v8}, Lcom/pdonlon/mines2/DrawPanel;->save(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;I)V

    .line 575
    iget v0, p0, Lcom/pdonlon/mines2/Board;->totalBombs:I

    .line 578
    .local v0, count:I
    :cond_0
    :goto_1
    if-lez v0, :cond_2

    .line 580
    iget v5, p0, Lcom/pdonlon/mines2/Board;->width:I

    invoke-virtual {v1, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    .line 581
    .local v2, rand1:I
    iget v5, p0, Lcom/pdonlon/mines2/Board;->height:I

    invoke-virtual {v1, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    .line 585
    .local v3, rand2:I
    iget-object v5, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v5, v5, v2

    aget-object v5, v5, v3

    invoke-virtual {v5}, Lcom/pdonlon/mines2/Mine;->isBomb()Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {p0, v2, v3}, Lcom/pdonlon/mines2/Board;->notSurroundingStart(II)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 587
    iget-object v5, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v5, v5, v2

    aget-object v5, v5, v3

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lcom/pdonlon/mines2/Mine;->setBomb(Z)V

    .line 588
    iget-object v5, p0, Lcom/pdonlon/mines2/Board;->bombs:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v5, v2, v3}, Lcom/pdonlon/mines2/CheckList;->enque(II)V

    .line 589
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 571
    .end local v0           #count:I
    .end local v1           #generator:Ljava/util/Random;
    .end local v2           #rand1:I
    .end local v3           #rand2:I
    :cond_1
    new-instance v1, Ljava/util/Random;

    int-to-long v6, v4

    invoke-direct {v1, v6, v7}, Ljava/util/Random;-><init>(J)V

    .restart local v1       #generator:Ljava/util/Random;
    goto :goto_0

    .line 592
    .restart local v0       #count:I
    :cond_2
    return-void
.end method

.method public placeBombsSurrounding()V
    .locals 7

    .prologue
    const/4 v6, 0x2

    .line 596
    const/4 v3, 0x0

    .local v3, y:I
    :goto_0
    iget v4, p0, Lcom/pdonlon/mines2/Board;->height:I

    if-ge v3, v4, :cond_4

    .line 597
    const/4 v2, 0x0

    .local v2, x:I
    :goto_1
    iget v4, p0, Lcom/pdonlon/mines2/Board;->width:I

    if-ge v2, v4, :cond_3

    .line 599
    iget-object v4, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v4, v4, v2

    aget-object v4, v4, v3

    invoke-virtual {v4}, Lcom/pdonlon/mines2/Mine;->isBomb()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 601
    const/4 v1, -0x1

    .local v1, j:I
    :goto_2
    if-ge v1, v6, :cond_2

    .line 602
    const/4 v0, -0x1

    .local v0, i:I
    :goto_3
    if-ge v0, v6, :cond_1

    .line 604
    add-int v4, v2, v1

    add-int v5, v3, v0

    invoke-virtual {p0, v4, v5}, Lcom/pdonlon/mines2/Board;->isValid(II)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    add-int v5, v2, v1

    aget-object v4, v4, v5

    add-int v5, v3, v0

    aget-object v4, v4, v5

    invoke-virtual {v4}, Lcom/pdonlon/mines2/Mine;->isBomb()Z

    move-result v4

    if-nez v4, :cond_0

    .line 605
    iget-object v4, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    add-int v5, v2, v1

    aget-object v4, v4, v5

    add-int v5, v3, v0

    aget-object v4, v4, v5

    invoke-virtual {v4}, Lcom/pdonlon/mines2/Mine;->addOneBombSurrounding()V

    .line 602
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 601
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 597
    .end local v0           #i:I
    .end local v1           #j:I
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 596
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 609
    .end local v2           #x:I
    :cond_4
    return-void
.end method

.method public readjust()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 177
    iput v0, p0, Lcom/pdonlon/mines2/Board;->offX:F

    .line 178
    iput v0, p0, Lcom/pdonlon/mines2/Board;->offY:F

    .line 179
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->adjustTiles()V

    .line 180
    return-void
.end method

.method public removeFlag(II)V
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    .line 911
    iget v0, p0, Lcom/pdonlon/mines2/Board;->flagCount:I

    iget v1, p0, Lcom/pdonlon/mines2/Board;->flagLimit:I

    if-ge v0, v1, :cond_0

    .line 913
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v0, v0, p1

    aget-object v0, v0, p2

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/Mine;->setFlagged(Z)V

    .line 915
    iget v0, p0, Lcom/pdonlon/mines2/Board;->flagCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/pdonlon/mines2/Board;->flagCount:I

    .line 919
    :cond_0
    return-void
.end method

.method public removeHint()V
    .locals 1

    .prologue
    .line 999
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pdonlon/mines2/Board;->showHint:Z

    .line 1000
    return-void
.end method

.method public replace(II)V
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 379
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->pressed:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v0, p1, p2}, Lcom/pdonlon/mines2/CheckList;->replaceHead(II)V

    .line 380
    return-void
.end method

.method public saveBombLocations()V
    .locals 7

    .prologue
    .line 1018
    const/4 v0, 0x0

    .line 1019
    .local v0, count:I
    iget v1, p0, Lcom/pdonlon/mines2/Board;->totalBombs:I

    .line 1020
    .local v1, totalBs:I
    :goto_0
    if-lez v1, :cond_0

    .line 1022
    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v3, p0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v3, v3, Lcom/pdonlon/mines2/DrawPanel;->bombXEditor:Landroid/content/SharedPreferences$Editor;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/pdonlon/mines2/Board;->bombs:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v5}, Lcom/pdonlon/mines2/CheckList;->getValues()[I

    move-result-object v5

    const/4 v6, 0x0

    aget v5, v5, v6

    invoke-virtual {v2, v3, v4, v5}, Lcom/pdonlon/mines2/DrawPanel;->save(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;I)V

    .line 1023
    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v3, p0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v3, v3, Lcom/pdonlon/mines2/DrawPanel;->bombYEditor:Landroid/content/SharedPreferences$Editor;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/pdonlon/mines2/Board;->bombs:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v5}, Lcom/pdonlon/mines2/CheckList;->getValues()[I

    move-result-object v5

    const/4 v6, 0x1

    aget v5, v5, v6

    invoke-virtual {v2, v3, v4, v5}, Lcom/pdonlon/mines2/DrawPanel;->save(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;I)V

    .line 1024
    add-int/lit8 v0, v0, 0x1

    .line 1025
    add-int/lit8 v1, v1, -0x1

    .line 1027
    iget-object v2, p0, Lcom/pdonlon/mines2/Board;->bombs:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v2}, Lcom/pdonlon/mines2/CheckList;->deque()V

    goto :goto_0

    .line 1029
    :cond_0
    return-void
.end method

.method public setCheck(Z)V
    .locals 0
    .parameter "a"

    .prologue
    .line 1004
    iput-boolean p1, p0, Lcom/pdonlon/mines2/Board;->showCheck:Z

    .line 1005
    return-void
.end method

.method public setDiffX(F)V
    .locals 0
    .parameter "a"

    .prologue
    .line 296
    iput p1, p0, Lcom/pdonlon/mines2/Board;->diffX:F

    .line 297
    return-void
.end method

.method public setDiffY(F)V
    .locals 0
    .parameter "a"

    .prologue
    .line 316
    iput p1, p0, Lcom/pdonlon/mines2/Board;->diffY:F

    .line 317
    return-void
.end method

.method public setDoneAnimating(Z)V
    .locals 0
    .parameter "a"

    .prologue
    .line 337
    sput-boolean p1, Lcom/pdonlon/mines2/Board;->doneAnimating:Z

    .line 338
    return-void
.end method

.method public setFlagCount(I)V
    .locals 0
    .parameter "count"

    .prologue
    .line 167
    iput p1, p0, Lcom/pdonlon/mines2/Board;->flagCount:I

    .line 168
    return-void
.end method

.method public setHeight(I)V
    .locals 0
    .parameter "a"

    .prologue
    .line 199
    iput p1, p0, Lcom/pdonlon/mines2/Board;->height:I

    .line 200
    return-void
.end method

.method public setLose(Z)V
    .locals 0
    .parameter "a"

    .prologue
    .line 254
    iput-boolean p1, p0, Lcom/pdonlon/mines2/Board;->lose:Z

    .line 255
    return-void
.end method

.method public setMillisecondsCounter(J)V
    .locals 1
    .parameter "counter"

    .prologue
    .line 147
    iput-wide p1, p0, Lcom/pdonlon/mines2/Board;->millisecondsCounter:J

    .line 148
    return-void
.end method

.method public setOffX(F)V
    .locals 0
    .parameter "a"

    .prologue
    .line 286
    iput p1, p0, Lcom/pdonlon/mines2/Board;->offX:F

    .line 287
    return-void
.end method

.method public setOffY(F)V
    .locals 0
    .parameter "a"

    .prologue
    .line 306
    iput p1, p0, Lcom/pdonlon/mines2/Board;->offY:F

    .line 307
    return-void
.end method

.method public setPressed(Z)V
    .locals 0
    .parameter "a"

    .prologue
    .line 409
    iput-boolean p1, p0, Lcom/pdonlon/mines2/Board;->beingPressed:Z

    .line 411
    return-void
.end method

.method public setPressedCords(II)V
    .locals 2
    .parameter "a"
    .parameter "b"

    .prologue
    .line 391
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->pressedCords:[I

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 392
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->pressedCords:[I

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 394
    return-void
.end method

.method public setSeed(I)V
    .locals 0
    .parameter "value"

    .prologue
    .line 172
    iput p1, p0, Lcom/pdonlon/mines2/Board;->seed:I

    .line 173
    return-void
.end method

.method public setStartXandY(II)V
    .locals 3
    .parameter "x"
    .parameter "y"

    .prologue
    .line 508
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->save:Landroid/content/SharedPreferences;

    const-string v1, "saveGame"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 510
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/DrawPanel;->saveGameInProgress(Z)V

    .line 512
    iput p1, p0, Lcom/pdonlon/mines2/Board;->startX:I

    .line 513
    iput p2, p0, Lcom/pdonlon/mines2/Board;->startY:I

    .line 515
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->placeBombs()V

    .line 516
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->placeBombsSurrounding()V

    .line 518
    sget-object v0, Lcom/pdonlon/mines2/Board;->timer:Ljava/util/Timer;

    if-nez v0, :cond_1

    .line 519
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    sput-object v0, Lcom/pdonlon/mines2/Board;->timer:Ljava/util/Timer;

    .line 522
    :goto_0
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->startTimer()V

    .line 524
    :cond_0
    return-void

    .line 521
    :cond_1
    invoke-virtual {p0}, Lcom/pdonlon/mines2/Board;->endTimer()V

    goto :goto_0
.end method

.method public setTheta(D)V
    .locals 1
    .parameter "theta"

    .prologue
    .line 137
    iput-wide p1, p0, Lcom/pdonlon/mines2/Board;->theta1:D

    .line 138
    return-void
.end method

.method public setTileSize(I)V
    .locals 1
    .parameter "a"

    .prologue
    .line 923
    int-to-float v0, p1

    iput v0, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    .line 924
    return-void
.end method

.method public setTimeCounter(I)V
    .locals 0
    .parameter "time"

    .prologue
    .line 162
    iput p1, p0, Lcom/pdonlon/mines2/Board;->timeCounter:I

    .line 163
    return-void
.end method

.method public setTotalBombs(I)V
    .locals 0
    .parameter "a"

    .prologue
    .line 219
    iput p1, p0, Lcom/pdonlon/mines2/Board;->totalBombs:I

    .line 220
    return-void
.end method

.method public setUp()V
    .locals 1

    .prologue
    .line 274
    iget v0, p0, Lcom/pdonlon/mines2/Board;->totalBombs:I

    iput v0, p0, Lcom/pdonlon/mines2/Board;->flagCount:I

    .line 275
    iget v0, p0, Lcom/pdonlon/mines2/Board;->totalBombs:I

    iput v0, p0, Lcom/pdonlon/mines2/Board;->unsafeBombCount:I

    .line 276
    iget v0, p0, Lcom/pdonlon/mines2/Board;->flagCount:I

    iput v0, p0, Lcom/pdonlon/mines2/Board;->flagLimit:I

    .line 277
    return-void
.end method

.method public setWidth(I)V
    .locals 0
    .parameter "a"

    .prologue
    .line 189
    iput p1, p0, Lcom/pdonlon/mines2/Board;->width:I

    .line 190
    return-void
.end method

.method public setWin(Z)V
    .locals 0
    .parameter "a"

    .prologue
    .line 244
    iput-boolean p1, p0, Lcom/pdonlon/mines2/Board;->win:Z

    .line 245
    return-void
.end method

.method public startTimer()V
    .locals 6

    .prologue
    .line 539
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pdonlon/mines2/Board;->timerActive:Z

    .line 540
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/pdonlon/mines2/Board;->millisecondsStart:J

    .line 541
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    sput-object v0, Lcom/pdonlon/mines2/Board;->timer:Ljava/util/Timer;

    .line 543
    sget-object v0, Lcom/pdonlon/mines2/Board;->timer:Ljava/util/Timer;

    new-instance v1, Lcom/pdonlon/mines2/Board$1;

    invoke-direct {v1, p0}, Lcom/pdonlon/mines2/Board$1;-><init>(Lcom/pdonlon/mines2/Board;)V

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x3e8

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 562
    return-void
.end method

.method public startup()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x0

    const/4 v2, 0x0

    .line 439
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->bombs:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/CheckList;->empty()V

    .line 441
    iget v0, p0, Lcom/pdonlon/mines2/Board;->width:I

    iget v1, p0, Lcom/pdonlon/mines2/Board;->height:I

    filled-new-array {v0, v1}, [I

    move-result-object v0

    const-class v1, Lcom/pdonlon/mines2/Mine;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Lcom/pdonlon/mines2/Mine;

    iput-object v0, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    .line 442
    iget v0, p0, Lcom/pdonlon/mines2/Board;->width:I

    iget v1, p0, Lcom/pdonlon/mines2/Board;->height:I

    mul-int/2addr v0, v1

    iput v0, p0, Lcom/pdonlon/mines2/Board;->totalBoxes:I

    .line 444
    iget v0, p0, Lcom/pdonlon/mines2/Board;->totalBombs:I

    iput v0, p0, Lcom/pdonlon/mines2/Board;->flagCount:I

    .line 445
    iget v0, p0, Lcom/pdonlon/mines2/Board;->totalBombs:I

    iput v0, p0, Lcom/pdonlon/mines2/Board;->unsafeBombCount:I

    .line 446
    iget v0, p0, Lcom/pdonlon/mines2/Board;->flagCount:I

    iput v0, p0, Lcom/pdonlon/mines2/Board;->flagLimit:I

    .line 448
    const/4 v0, -0x1

    iput v0, p0, Lcom/pdonlon/mines2/Board;->timeCounter:I

    .line 449
    iput-wide v4, p0, Lcom/pdonlon/mines2/Board;->millisecondsCounter:J

    .line 450
    iput-wide v4, p0, Lcom/pdonlon/mines2/Board;->millisecondsStart:J

    .line 451
    iput-boolean v2, p0, Lcom/pdonlon/mines2/Board;->win:Z

    .line 452
    iput-boolean v2, p0, Lcom/pdonlon/mines2/Board;->lose:Z

    .line 454
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pdonlon/mines2/Board;->firstTurn:Z

    .line 455
    iput-boolean v2, p0, Lcom/pdonlon/mines2/Board;->touchedBomb:Z

    .line 456
    return-void
.end method

.method public tikTok()V
    .locals 4

    .prologue
    .line 1263
    iget-wide v0, p0, Lcom/pdonlon/mines2/Board;->theta1:D

    const-wide/high16 v2, 0x4018

    invoke-static {v2, v3}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v2

    add-double/2addr v0, v2

    iput-wide v0, p0, Lcom/pdonlon/mines2/Board;->theta1:D

    .line 1265
    return-void
.end method

.method public tileAnimation()V
    .locals 2

    .prologue
    .line 826
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/pdonlon/mines2/Board$4;

    invoke-direct {v1, p0}, Lcom/pdonlon/mines2/Board$4;-><init>(Lcom/pdonlon/mines2/Board;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/pdonlon/mines2/Board;->t:Ljava/lang/Thread;

    .line 852
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->t:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 853
    return-void
.end method

.method public tileOpen()V
    .locals 3

    .prologue
    .line 746
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->fast:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/CheckList;->getValues()[I

    move-result-object v0

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->fast:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v1}, Lcom/pdonlon/mines2/CheckList;->getValues()[I

    move-result-object v1

    const/4 v2, 0x1

    aget v1, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/pdonlon/mines2/Board;->openBox(II)V

    .line 748
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->fast:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/CheckList;->deque()V

    .line 750
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    new-instance v1, Lcom/pdonlon/mines2/Board$3;

    invoke-direct {v1, p0}, Lcom/pdonlon/mines2/Board$3;-><init>(Lcom/pdonlon/mines2/Board;)V

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 753
    return-void
.end method

.method public tileTurn()V
    .locals 3

    .prologue
    .line 857
    :try_start_0
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->zeros:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v1}, Lcom/pdonlon/mines2/CheckList;->getValues()[I

    move-result-object v1

    const/4 v2, 0x0

    aget v1, v1, v2

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/pdonlon/mines2/Board;->zeros:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v1}, Lcom/pdonlon/mines2/CheckList;->getValues()[I

    move-result-object v1

    const/4 v2, 0x1

    aget v1, v1, v2

    aget-object v0, v0, v1

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/Mine;->setOpened(Z)V

    .line 859
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->zeros:Lcom/pdonlon/mines2/CheckList;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/CheckList;->deque()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 865
    :goto_0
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    new-instance v1, Lcom/pdonlon/mines2/Board$5;

    invoke-direct {v1, p0}, Lcom/pdonlon/mines2/Board$5;-><init>(Lcom/pdonlon/mines2/Board;)V

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 868
    return-void

    .line 861
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public unopenedAndUnflaggedAround(II)Z
    .locals 6
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v5, 0x2

    .line 643
    const/4 v2, 0x0

    .line 645
    .local v2, unopened:Z
    const/4 v0, -0x1

    .local v0, i:I
    :goto_0
    if-ge v0, v5, :cond_2

    .line 646
    const/4 v1, -0x1

    .local v1, j:I
    :goto_1
    if-ge v1, v5, :cond_1

    .line 648
    add-int v3, p1, v1

    add-int v4, p2, v0

    invoke-virtual {p0, v3, v4}, Lcom/pdonlon/mines2/Board;->isValid(II)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    add-int v4, p1, v1

    aget-object v3, v3, v4

    add-int v4, p2, v0

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Mine;->isOpened()Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    add-int v4, p1, v1

    aget-object v3, v3, v4

    add-int v4, p2, v0

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Mine;->isFlagged()Z

    move-result v3

    if-nez v3, :cond_0

    .line 649
    const/4 v2, 0x1

    .line 646
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 645
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 654
    .end local v1           #j:I
    :cond_2
    return v2
.end method

.method public unopenedAround(II)Z
    .locals 6
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v5, 0x2

    .line 627
    const/4 v2, 0x0

    .line 629
    .local v2, unopened:Z
    const/4 v0, -0x1

    .local v0, i:I
    :goto_0
    if-ge v0, v5, :cond_2

    .line 630
    const/4 v1, -0x1

    .local v1, j:I
    :goto_1
    if-ge v1, v5, :cond_1

    .line 632
    add-int v3, p1, v1

    add-int v4, p2, v0

    invoke-virtual {p0, v3, v4}, Lcom/pdonlon/mines2/Board;->isValid(II)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    add-int v4, p1, v1

    aget-object v3, v3, v4

    add-int v4, p2, v0

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Mine;->isOpened()Z

    move-result v3

    if-nez v3, :cond_0

    .line 633
    const/4 v2, 0x1

    .line 630
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 629
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 638
    .end local v1           #j:I
    :cond_2
    return v2
.end method

.method public unopenedSurrounding(II)I
    .locals 6
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v5, 0x2

    .line 946
    const/4 v2, 0x0

    .line 948
    .local v2, unopened:I
    const/4 v0, -0x1

    .local v0, i:I
    :goto_0
    if-ge v0, v5, :cond_2

    .line 949
    const/4 v1, -0x1

    .local v1, j:I
    :goto_1
    if-ge v1, v5, :cond_1

    .line 951
    add-int v3, p1, v1

    add-int v4, p2, v0

    invoke-virtual {p0, v3, v4}, Lcom/pdonlon/mines2/Board;->isValid(II)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    add-int v4, p1, v1

    aget-object v3, v3, v4

    add-int v4, p2, v0

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Mine;->isOpened()Z

    move-result v3

    if-nez v3, :cond_0

    .line 953
    iget-object v3, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    add-int v4, p1, v1

    aget-object v3, v3, v4

    add-int v4, p2, v0

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Mine;->isOpened()Z

    move-result v3

    if-nez v3, :cond_0

    .line 954
    add-int/lit8 v2, v2, 0x1

    .line 949
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 948
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 958
    .end local v1           #j:I
    :cond_2
    return v2
.end method

.method public wipeBoard()V
    .locals 9

    .prologue
    const/4 v1, 0x0

    .line 420
    const/4 v7, 0x0

    .local v7, y:I
    :goto_0
    iget v0, p0, Lcom/pdonlon/mines2/Board;->height:I

    if-ge v7, v0, :cond_1

    .line 421
    const/4 v6, 0x0

    .local v6, x:I
    :goto_1
    iget v0, p0, Lcom/pdonlon/mines2/Board;->width:I

    if-ge v6, v0, :cond_0

    .line 422
    iget-object v0, p0, Lcom/pdonlon/mines2/Board;->board:[[Lcom/pdonlon/mines2/Mine;

    aget-object v8, v0, v6

    new-instance v0, Lcom/pdonlon/mines2/Mine;

    move v2, v1

    move v3, v1

    move v4, v1

    move v5, v1

    invoke-direct/range {v0 .. v5}, Lcom/pdonlon/mines2/Mine;-><init>(ZIZZZ)V

    aput-object v0, v8, v7

    .line 421
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 420
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 425
    .end local v6           #x:I
    :cond_1
    return-void
.end method

.method public zoomIn(FF)V
    .locals 5
    .parameter "x"
    .parameter "y"

    .prologue
    const/high16 v4, 0x4000

    .line 1210
    iget v1, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v1, v4

    iput v1, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    .line 1212
    iget v1, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    neg-float v1, v1

    mul-float/2addr v1, p1

    div-float/2addr v1, v4

    iput v1, p0, Lcom/pdonlon/mines2/Board;->offX:F

    .line 1213
    iget v1, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    neg-float v1, v1

    mul-float/2addr v1, p2

    div-float/2addr v1, v4

    iput v1, p0, Lcom/pdonlon/mines2/Board;->offY:F

    .line 1219
    iget v1, p0, Lcom/pdonlon/mines2/Board;->width:I

    int-to-float v1, v1

    iget v2, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v1, v2

    iget v2, p0, Lcom/pdonlon/mines2/Board;->offX:F

    add-float/2addr v1, v2

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-float v2, v2

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_0

    .line 1220
    sget v1, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-float v1, v1

    iget v2, p0, Lcom/pdonlon/mines2/Board;->width:I

    int-to-float v2, v2

    iget v3, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    iget v3, p0, Lcom/pdonlon/mines2/Board;->offX:F

    add-float/2addr v2, v3

    sub-float v0, v1, v2

    .line 1221
    .local v0, difference:F
    iget v1, p0, Lcom/pdonlon/mines2/Board;->offX:F

    div-float v2, v0, v4

    add-float/2addr v1, v2

    iput v1, p0, Lcom/pdonlon/mines2/Board;->offX:F

    .line 1224
    .end local v0           #difference:F
    :cond_0
    iget v1, p0, Lcom/pdonlon/mines2/Board;->height:I

    int-to-float v1, v1

    iget v2, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v1, v2

    iget v2, p0, Lcom/pdonlon/mines2/Board;->offY:F

    add-float/2addr v1, v2

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenHeight:I

    int-to-float v2, v2

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_1

    .line 1225
    sget v1, Lcom/pdonlon/mines2/MainActivity;->screenHeight:I

    int-to-float v1, v1

    iget v2, p0, Lcom/pdonlon/mines2/Board;->height:I

    int-to-float v2, v2

    iget v3, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    iget v3, p0, Lcom/pdonlon/mines2/Board;->offY:F

    add-float/2addr v2, v3

    sub-float v0, v1, v2

    .line 1226
    .restart local v0       #difference:F
    iget v1, p0, Lcom/pdonlon/mines2/Board;->offY:F

    div-float v2, v0, v4

    add-float/2addr v1, v2

    iput v1, p0, Lcom/pdonlon/mines2/Board;->offY:F

    .line 1231
    .end local v0           #difference:F
    :cond_1
    iget v1, p0, Lcom/pdonlon/mines2/Board;->zoom:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/pdonlon/mines2/Board;->zoom:I

    .line 1233
    return-void
.end method

.method public zoomOut(FF)V
    .locals 5
    .parameter "x"
    .parameter "y"

    .prologue
    const/high16 v4, 0x4000

    .line 1240
    iget v1, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    div-float/2addr v1, v4

    iput v1, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    .line 1242
    iget v1, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    neg-float v1, v1

    div-float/2addr v1, p1

    iput v1, p0, Lcom/pdonlon/mines2/Board;->offX:F

    .line 1243
    iget v1, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    neg-float v1, v1

    div-float/2addr v1, p2

    iput v1, p0, Lcom/pdonlon/mines2/Board;->offY:F

    .line 1247
    iget v1, p0, Lcom/pdonlon/mines2/Board;->width:I

    int-to-float v1, v1

    iget v2, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v1, v2

    iget v2, p0, Lcom/pdonlon/mines2/Board;->offX:F

    add-float/2addr v1, v2

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-float v2, v2

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_0

    .line 1248
    sget v1, Lcom/pdonlon/mines2/MainActivity;->screenWidth:I

    int-to-float v1, v1

    iget v2, p0, Lcom/pdonlon/mines2/Board;->width:I

    int-to-float v2, v2

    iget v3, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    iget v3, p0, Lcom/pdonlon/mines2/Board;->offX:F

    add-float/2addr v2, v3

    sub-float v0, v1, v2

    .line 1249
    .local v0, difference:F
    iget v1, p0, Lcom/pdonlon/mines2/Board;->offX:F

    div-float v2, v0, v4

    add-float/2addr v1, v2

    iput v1, p0, Lcom/pdonlon/mines2/Board;->offX:F

    .line 1252
    .end local v0           #difference:F
    :cond_0
    iget v1, p0, Lcom/pdonlon/mines2/Board;->height:I

    int-to-float v1, v1

    iget v2, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v1, v2

    iget v2, p0, Lcom/pdonlon/mines2/Board;->offY:F

    add-float/2addr v1, v2

    sget v2, Lcom/pdonlon/mines2/MainActivity;->screenHeight:I

    int-to-float v2, v2

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_1

    .line 1253
    sget v1, Lcom/pdonlon/mines2/MainActivity;->screenHeight:I

    int-to-float v1, v1

    iget v2, p0, Lcom/pdonlon/mines2/Board;->height:I

    int-to-float v2, v2

    iget v3, p0, Lcom/pdonlon/mines2/Board;->tileSize:F

    mul-float/2addr v2, v3

    iget v3, p0, Lcom/pdonlon/mines2/Board;->offY:F

    add-float/2addr v2, v3

    sub-float v0, v1, v2

    .line 1254
    .restart local v0       #difference:F
    iget v1, p0, Lcom/pdonlon/mines2/Board;->offY:F

    div-float v2, v0, v4

    add-float/2addr v1, v2

    iput v1, p0, Lcom/pdonlon/mines2/Board;->offY:F

    .line 1257
    .end local v0           #difference:F
    :cond_1
    iget v1, p0, Lcom/pdonlon/mines2/Board;->zoom:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/pdonlon/mines2/Board;->zoom:I

    .line 1259
    return-void
.end method
