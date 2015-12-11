.class Lcom/pdonlon/mines2/DrawPanel$5;
.super Ljava/lang/Object;
.source "DrawPanel.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pdonlon/mines2/DrawPanel;->hostGame()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pdonlon/mines2/DrawPanel;

.field final synthetic val$randomSeed:I


# direct methods
.method constructor <init>(Lcom/pdonlon/mines2/DrawPanel;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 474
    iput-object p1, p0, Lcom/pdonlon/mines2/DrawPanel$5;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iput p2, p0, Lcom/pdonlon/mines2/DrawPanel$5;->val$randomSeed:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 478
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$5;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$5;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v1}, Lcom/pdonlon/mines2/DrawPanel;->getGameNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/DrawPanel;->gameSelect(I)V

    .line 479
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$5;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget v1, p0, Lcom/pdonlon/mines2/DrawPanel$5;->val$randomSeed:I

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/Board;->setSeed(I)V

    .line 481
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$5;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    new-instance v1, Lcom/pdonlon/mines2/DrawPanel$5$1;

    invoke-direct {v1, p0}, Lcom/pdonlon/mines2/DrawPanel$5$1;-><init>(Lcom/pdonlon/mines2/DrawPanel$5;)V

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 484
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$5;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/pdonlon/mines2/DrawPanel;->pauseAlertDialogUp:Z

    .line 486
    return-void
.end method
