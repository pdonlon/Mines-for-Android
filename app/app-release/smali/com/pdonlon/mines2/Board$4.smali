.class Lcom/pdonlon/mines2/Board$4;
.super Ljava/lang/Object;
.source "Board.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pdonlon/mines2/Board;->tileAnimation()V
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
    .line 826
    iput-object p1, p0, Lcom/pdonlon/mines2/Board$4;->this$0:Lcom/pdonlon/mines2/Board;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 829
    const/4 v2, 0x0

    sput-boolean v2, Lcom/pdonlon/mines2/Board;->doneAnimating:Z

    .line 831
    const/4 v0, 0x2

    .line 833
    .local v0, acceleration:I
    iget-object v2, p0, Lcom/pdonlon/mines2/Board$4;->this$0:Lcom/pdonlon/mines2/Board;

    iget-object v2, v2, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    iget-boolean v2, v2, Lcom/pdonlon/mines2/DrawPanel;->animations:Z

    if-nez v2, :cond_0

    .line 834
    const/4 v0, 0x0

    .line 836
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/pdonlon/mines2/Board$4;->this$0:Lcom/pdonlon/mines2/Board;

    iget v2, v2, Lcom/pdonlon/mines2/Board;->zeroCount:I

    if-lez v2, :cond_1

    .line 839
    int-to-long v2, v0

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 844
    :goto_1
    iget-object v2, p0, Lcom/pdonlon/mines2/Board$4;->this$0:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Board;->tileTurn()V

    .line 846
    iget-object v2, p0, Lcom/pdonlon/mines2/Board$4;->this$0:Lcom/pdonlon/mines2/Board;

    iget v3, v2, Lcom/pdonlon/mines2/Board;->zeroCount:I

    add-int/lit8 v3, v3, -0x1

    iput v3, v2, Lcom/pdonlon/mines2/Board;->zeroCount:I

    goto :goto_0

    .line 840
    :catch_0
    move-exception v1

    .line 841
    .local v1, ex:Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    goto :goto_1

    .line 848
    .end local v1           #ex:Ljava/lang/InterruptedException;
    :cond_1
    const/4 v2, 0x1

    sput-boolean v2, Lcom/pdonlon/mines2/Board;->doneAnimating:Z

    .line 849
    return-void
.end method
