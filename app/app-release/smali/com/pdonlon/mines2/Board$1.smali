.class Lcom/pdonlon/mines2/Board$1;
.super Ljava/util/TimerTask;
.source "Board.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pdonlon/mines2/Board;->startTimer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pdonlon/mines2/Board;


# direct methods
.method constructor <init>(Lcom/pdonlon/mines2/Board;)V
    .locals 0
    .parameter

    .prologue
    .line 544
    iput-object p1, p0, Lcom/pdonlon/mines2/Board$1;->this$0:Lcom/pdonlon/mines2/Board;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 548
    iget-object v0, p0, Lcom/pdonlon/mines2/Board$1;->this$0:Lcom/pdonlon/mines2/Board;

    iget v1, v0, Lcom/pdonlon/mines2/Board;->timeCounter:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/pdonlon/mines2/Board;->timeCounter:I

    .line 549
    iget-object v0, p0, Lcom/pdonlon/mines2/Board$1;->this$0:Lcom/pdonlon/mines2/Board;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/pdonlon/mines2/Board;->millisecondsStart:J

    .line 550
    iget-object v0, p0, Lcom/pdonlon/mines2/Board$1;->this$0:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->tikTok()V

    .line 552
    iget-object v0, p0, Lcom/pdonlon/mines2/Board$1;->this$0:Lcom/pdonlon/mines2/Board;

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    new-instance v1, Lcom/pdonlon/mines2/Board$1$1;

    invoke-direct {v1, p0}, Lcom/pdonlon/mines2/Board$1$1;-><init>(Lcom/pdonlon/mines2/Board$1;)V

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 559
    return-void
.end method
