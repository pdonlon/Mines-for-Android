.class Lcom/pdonlon/mines2/DrawPanel$26;
.super Ljava/util/TimerTask;
.source "DrawPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pdonlon/mines2/DrawPanel;->startTimer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pdonlon/mines2/DrawPanel;


# direct methods
.method constructor <init>(Lcom/pdonlon/mines2/DrawPanel;)V
    .locals 0
    .parameter

    .prologue
    .line 1075
    iput-object p1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 1079
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget v2, v1, Lcom/pdonlon/mines2/DrawPanel;->timeCounter:F

    float-to-double v2, v2

    const-wide v4, 0x3fb999999999999aL

    add-double/2addr v2, v4

    double-to-float v2, v2

    iput v2, v1, Lcom/pdonlon/mines2/DrawPanel;->timeCounter:F

    .line 1080
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-boolean v1, v1, Lcom/pdonlon/mines2/DrawPanel;->gameOver:Z

    if-eqz v1, :cond_1

    .line 1132
    :cond_0
    :goto_0
    return-void

    .line 1083
    :cond_1
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget v1, v1, Lcom/pdonlon/mines2/DrawPanel;->timeCounter:F

    float-to-double v2, v1

    const-wide/high16 v4, 0x400c

    cmpl-double v1, v2, v4

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-boolean v1, v1, Lcom/pdonlon/mines2/DrawPanel;->dragging:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, v1, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-boolean v1, v1, Lcom/pdonlon/mines2/Board;->beingPressed:Z

    if-eqz v1, :cond_0

    .line 1085
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v2, v2, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Board;->getPressedCords()[I

    move-result-object v2

    aget v2, v2, v7

    iput v2, v1, Lcom/pdonlon/mines2/DrawPanel;->x:I

    .line 1086
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v2, v2, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Board;->getPressedCords()[I

    move-result-object v2

    aget v2, v2, v6

    iput v2, v1, Lcom/pdonlon/mines2/DrawPanel;->y:I

    .line 1087
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, v1, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget v2, v2, Lcom/pdonlon/mines2/DrawPanel;->x:I

    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget v3, v3, Lcom/pdonlon/mines2/DrawPanel;->y:I

    const-string v4, "open"

    invoke-virtual {v1, v2, v3, v4}, Lcom/pdonlon/mines2/Board;->isThis(IILjava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 1089
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, v1, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    const-string v2, "vibrator"

    invoke-virtual {v1, v2}, Lcom/pdonlon/mines2/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    .line 1091
    .local v0, v:Landroid/os/Vibrator;
    const-wide/16 v2, 0x14

    invoke-virtual {v0, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V

    .line 1092
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-boolean v1, v1, Lcom/pdonlon/mines2/DrawPanel;->flagMode:Z

    if-nez v1, :cond_3

    .line 1093
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, v1, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget v2, v2, Lcom/pdonlon/mines2/DrawPanel;->x:I

    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget v3, v3, Lcom/pdonlon/mines2/DrawPanel;->y:I

    invoke-virtual {v1, v2, v3}, Lcom/pdonlon/mines2/Board;->markFlagged(II)V

    .line 1097
    :goto_1
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, v1, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v1, v7}, Lcom/pdonlon/mines2/Board;->setPressed(Z)V

    .line 1098
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iput-boolean v6, v1, Lcom/pdonlon/mines2/DrawPanel;->justFlagged:Z

    .line 1100
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-boolean v1, v1, Lcom/pdonlon/mines2/DrawPanel;->flagMode:Z

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, v1, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget v2, v2, Lcom/pdonlon/mines2/DrawPanel;->x:I

    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget v3, v3, Lcom/pdonlon/mines2/DrawPanel;->y:I

    const-string v4, "bomb"

    invoke-virtual {v1, v2, v3, v4}, Lcom/pdonlon/mines2/Board;->isThis(IILjava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    sget-boolean v1, Lcom/pdonlon/mines2/Board;->doneAnimating:Z

    if-eqz v1, :cond_4

    .line 1102
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, v1, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-object v1, v1, Lcom/pdonlon/mines2/Board;->bombs:Lcom/pdonlon/mines2/CheckList;

    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget v2, v2, Lcom/pdonlon/mines2/DrawPanel;->x:I

    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget v3, v3, Lcom/pdonlon/mines2/DrawPanel;->y:I

    invoke-virtual {v1, v2, v3}, Lcom/pdonlon/mines2/CheckList;->remove(II)Z

    .line 1103
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, v1, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-object v1, v1, Lcom/pdonlon/mines2/Board;->bombs:Lcom/pdonlon/mines2/CheckList;

    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget v2, v2, Lcom/pdonlon/mines2/DrawPanel;->x:I

    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget v3, v3, Lcom/pdonlon/mines2/DrawPanel;->y:I

    invoke-virtual {v1, v2, v3}, Lcom/pdonlon/mines2/CheckList;->enque(II)V

    .line 1104
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, v1, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v1}, Lcom/pdonlon/mines2/Board;->endOfGameSetWrong()V

    .line 1105
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, v1, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v1, v6}, Lcom/pdonlon/mines2/Board;->setLose(Z)V

    .line 1106
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iput-boolean v6, v1, Lcom/pdonlon/mines2/DrawPanel;->gameOver:Z

    .line 1107
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, v1, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v1}, Lcom/pdonlon/mines2/Board;->endTimer()V

    .line 1108
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v1}, Lcom/pdonlon/mines2/DrawPanel;->bombAnimation()V

    .line 1123
    .end local v0           #v:Landroid/os/Vibrator;
    :cond_2
    :goto_2
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, v1, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    new-instance v2, Lcom/pdonlon/mines2/DrawPanel$26$1;

    invoke-direct {v2, p0}, Lcom/pdonlon/mines2/DrawPanel$26$1;-><init>(Lcom/pdonlon/mines2/DrawPanel$26;)V

    invoke-virtual {v1, v2}, Lcom/pdonlon/mines2/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 1095
    .restart local v0       #v:Landroid/os/Vibrator;
    :cond_3
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, v1, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget v2, v2, Lcom/pdonlon/mines2/DrawPanel;->x:I

    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget v3, v3, Lcom/pdonlon/mines2/DrawPanel;->y:I

    invoke-virtual {v1, v2, v3}, Lcom/pdonlon/mines2/Board;->open(II)V

    goto/16 :goto_1

    .line 1110
    :cond_4
    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-boolean v1, v1, Lcom/pdonlon/mines2/DrawPanel;->flagMode:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, v1, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-boolean v1, v1, Lcom/pdonlon/mines2/Board;->win:Z

    if-eqz v1, :cond_2

    goto :goto_2
.end method
