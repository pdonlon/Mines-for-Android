.class Lcom/pdonlon/mines2/DrawPanel$5$1;
.super Ljava/lang/Object;
.source "DrawPanel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pdonlon/mines2/DrawPanel$5;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pdonlon/mines2/DrawPanel$5;


# direct methods
.method constructor <init>(Lcom/pdonlon/mines2/DrawPanel$5;)V
    .locals 0
    .parameter

    .prologue
    .line 481
    iput-object p1, p0, Lcom/pdonlon/mines2/DrawPanel$5$1;->this$1:Lcom/pdonlon/mines2/DrawPanel$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 482
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$5$1;->this$1:Lcom/pdonlon/mines2/DrawPanel$5;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel$5;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$5$1;->this$1:Lcom/pdonlon/mines2/DrawPanel$5;

    iget-object v1, v1, Lcom/pdonlon/mines2/DrawPanel$5;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, v1, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget v1, v1, Lcom/pdonlon/mines2/Board;->width:I

    div-int/lit8 v1, v1, 0x2

    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel$5$1;->this$1:Lcom/pdonlon/mines2/DrawPanel$5;

    iget-object v2, v2, Lcom/pdonlon/mines2/DrawPanel$5;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v2, v2, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget v2, v2, Lcom/pdonlon/mines2/Board;->height:I

    div-int/lit8 v2, v2, 0x2

    invoke-virtual {v0, v1, v2}, Lcom/pdonlon/mines2/Board;->open(II)V

    .line 483
    return-void
.end method
