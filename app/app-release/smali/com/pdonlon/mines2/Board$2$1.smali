.class Lcom/pdonlon/mines2/Board$2$1;
.super Ljava/lang/Object;
.source "Board.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pdonlon/mines2/Board$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pdonlon/mines2/Board$2;


# direct methods
.method constructor <init>(Lcom/pdonlon/mines2/Board$2;)V
    .locals 0
    .parameter

    .prologue
    .line 723
    iput-object p1, p0, Lcom/pdonlon/mines2/Board$2$1;->this$1:Lcom/pdonlon/mines2/Board$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 726
    iget-object v0, p0, Lcom/pdonlon/mines2/Board$2$1;->this$1:Lcom/pdonlon/mines2/Board$2;

    iget-object v0, v0, Lcom/pdonlon/mines2/Board$2;->this$0:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->checkWin()V

    .line 727
    iget-object v0, p0, Lcom/pdonlon/mines2/Board$2$1;->this$1:Lcom/pdonlon/mines2/Board$2;

    iget-object v0, v0, Lcom/pdonlon/mines2/Board$2;->this$0:Lcom/pdonlon/mines2/Board;

    iget-boolean v0, v0, Lcom/pdonlon/mines2/Board;->win:Z

    if-eqz v0, :cond_0

    .line 728
    iget-object v0, p0, Lcom/pdonlon/mines2/Board$2$1;->this$1:Lcom/pdonlon/mines2/Board$2;

    iget-object v0, v0, Lcom/pdonlon/mines2/Board$2;->this$0:Lcom/pdonlon/mines2/Board;

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    iget-boolean v0, v0, Lcom/pdonlon/mines2/DrawPanel;->winMessage:Z

    if-eqz v0, :cond_0

    .line 729
    iget-object v0, p0, Lcom/pdonlon/mines2/Board$2$1;->this$1:Lcom/pdonlon/mines2/Board$2;

    iget-object v0, v0, Lcom/pdonlon/mines2/Board$2;->this$0:Lcom/pdonlon/mines2/Board;

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/DrawPanel;->winMessage()V

    .line 733
    :cond_0
    return-void
.end method
