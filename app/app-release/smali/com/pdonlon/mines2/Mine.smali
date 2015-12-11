.class public Lcom/pdonlon/mines2/Mine;
.super Ljava/lang/Object;
.source "Mine.java"


# instance fields
.field bomb:Z

.field bombsSurrounding:I

.field explode:Z

.field flagCount:I

.field flagged:Z

.field opened:Z

.field openedCount:I

.field questionMarked:Z

.field wrong:Z


# direct methods
.method public constructor <init>(ZIZZZ)V
    .locals 0
    .parameter "opened"
    .parameter "bs"
    .parameter "flagged"
    .parameter "bomb"
    .parameter "wrong"

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-boolean p1, p0, Lcom/pdonlon/mines2/Mine;->opened:Z

    .line 28
    iput p2, p0, Lcom/pdonlon/mines2/Mine;->bombsSurrounding:I

    .line 29
    iput-boolean p3, p0, Lcom/pdonlon/mines2/Mine;->flagged:Z

    .line 30
    iput-boolean p4, p0, Lcom/pdonlon/mines2/Mine;->bomb:Z

    .line 31
    iput-boolean p5, p0, Lcom/pdonlon/mines2/Mine;->wrong:Z

    .line 33
    return-void
.end method


# virtual methods
.method public addOneBombSurrounding()V
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lcom/pdonlon/mines2/Mine;->bombsSurrounding:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/pdonlon/mines2/Mine;->bombsSurrounding:I

    .line 48
    return-void
.end method

.method public determineColor()I
    .locals 4

    .prologue
    .line 100
    iget-boolean v1, p0, Lcom/pdonlon/mines2/Mine;->wrong:Z

    if-eqz v1, :cond_0

    .line 101
    const/high16 v0, -0x100

    .line 139
    .local v0, color:I
    :goto_0
    return v0

    .line 103
    .end local v0           #color:I
    :cond_0
    iget-boolean v1, p0, Lcom/pdonlon/mines2/Mine;->flagged:Z

    if-eqz v1, :cond_1

    .line 104
    const/high16 v0, -0x1

    .restart local v0       #color:I
    goto :goto_0

    .line 106
    .end local v0           #color:I
    :cond_1
    iget-boolean v1, p0, Lcom/pdonlon/mines2/Mine;->bomb:Z

    if-nez v1, :cond_2

    iget-boolean v1, p0, Lcom/pdonlon/mines2/Mine;->opened:Z

    if-nez v1, :cond_3

    .line 107
    :cond_2
    const/high16 v0, -0x100

    .restart local v0       #color:I
    goto :goto_0

    .line 109
    .end local v0           #color:I
    :cond_3
    iget v1, p0, Lcom/pdonlon/mines2/Mine;->bombsSurrounding:I

    if-nez v1, :cond_4

    .line 110
    const/4 v0, -0x1

    .restart local v0       #color:I
    goto :goto_0

    .line 112
    .end local v0           #color:I
    :cond_4
    iget v1, p0, Lcom/pdonlon/mines2/Mine;->bombsSurrounding:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_5

    .line 113
    const v0, -0xff0001

    .restart local v0       #color:I
    goto :goto_0

    .line 115
    .end local v0           #color:I
    :cond_5
    iget v1, p0, Lcom/pdonlon/mines2/Mine;->bombsSurrounding:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_6

    .line 116
    const v0, -0xff0100

    .restart local v0       #color:I
    goto :goto_0

    .line 118
    .end local v0           #color:I
    :cond_6
    iget v1, p0, Lcom/pdonlon/mines2/Mine;->bombsSurrounding:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_7

    .line 119
    const/high16 v0, -0x1

    .restart local v0       #color:I
    goto :goto_0

    .line 121
    .end local v0           #color:I
    :cond_7
    iget v1, p0, Lcom/pdonlon/mines2/Mine;->bombsSurrounding:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_8

    .line 122
    const/16 v1, 0xff

    const/16 v2, 0xc8

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    .restart local v0       #color:I
    goto :goto_0

    .line 125
    .end local v0           #color:I
    :cond_8
    iget v1, p0, Lcom/pdonlon/mines2/Mine;->bombsSurrounding:I

    const/4 v2, 0x5

    if-ne v1, v2, :cond_9

    .line 126
    const v0, -0xff01

    .restart local v0       #color:I
    goto :goto_0

    .line 128
    .end local v0           #color:I
    :cond_9
    iget v1, p0, Lcom/pdonlon/mines2/Mine;->bombsSurrounding:I

    const/4 v2, 0x6

    if-ne v1, v2, :cond_a

    .line 129
    const/16 v0, -0x100

    .restart local v0       #color:I
    goto :goto_0

    .line 131
    .end local v0           #color:I
    :cond_a
    iget v1, p0, Lcom/pdonlon/mines2/Mine;->bombsSurrounding:I

    const/4 v2, 0x7

    if-ne v1, v2, :cond_b

    .line 132
    const v0, -0xffff01

    .restart local v0       #color:I
    goto :goto_0

    .line 135
    .end local v0           #color:I
    :cond_b
    const/high16 v0, -0x100

    .restart local v0       #color:I
    goto :goto_0
.end method

.method public exploded()Z
    .locals 1

    .prologue
    .line 78
    iget-boolean v0, p0, Lcom/pdonlon/mines2/Mine;->explode:Z

    return v0
.end method

.method public getBombsSurrounding()I
    .locals 1

    .prologue
    .line 52
    iget v0, p0, Lcom/pdonlon/mines2/Mine;->bombsSurrounding:I

    return v0
.end method

.method public isBomb()Z
    .locals 1

    .prologue
    .line 73
    iget-boolean v0, p0, Lcom/pdonlon/mines2/Mine;->bomb:Z

    return v0
.end method

.method public isFlagged()Z
    .locals 1

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/pdonlon/mines2/Mine;->flagged:Z

    return v0
.end method

.method public isOpened()Z
    .locals 1

    .prologue
    .line 42
    iget-boolean v0, p0, Lcom/pdonlon/mines2/Mine;->opened:Z

    return v0
.end method

.method public isWrong()Z
    .locals 1

    .prologue
    .line 88
    iget-boolean v0, p0, Lcom/pdonlon/mines2/Mine;->wrong:Z

    return v0
.end method

.method public setBomb(Z)V
    .locals 0
    .parameter "a"

    .prologue
    .line 67
    iput-boolean p1, p0, Lcom/pdonlon/mines2/Mine;->bomb:Z

    .line 69
    return-void
.end method

.method public setExplode(Z)V
    .locals 0
    .parameter "a"

    .prologue
    .line 83
    iput-boolean p1, p0, Lcom/pdonlon/mines2/Mine;->explode:Z

    .line 84
    return-void
.end method

.method public setFlagged(Z)V
    .locals 0
    .parameter "a"

    .prologue
    .line 57
    iput-boolean p1, p0, Lcom/pdonlon/mines2/Mine;->flagged:Z

    .line 58
    return-void
.end method

.method public setOpened(Z)V
    .locals 0
    .parameter "a"

    .prologue
    .line 37
    iput-boolean p1, p0, Lcom/pdonlon/mines2/Mine;->opened:Z

    .line 38
    return-void
.end method

.method public setWrong(Z)V
    .locals 0
    .parameter "a"

    .prologue
    .line 93
    iput-boolean p1, p0, Lcom/pdonlon/mines2/Mine;->wrong:Z

    .line 94
    return-void
.end method
