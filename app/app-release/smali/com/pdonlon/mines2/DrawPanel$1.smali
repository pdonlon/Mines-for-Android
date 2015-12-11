.class Lcom/pdonlon/mines2/DrawPanel$1;
.super Ljava/lang/Object;
.source "DrawPanel.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pdonlon/mines2/DrawPanel;->gameLobby()V
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
    .line 425
    iput-object p1, p0, Lcom/pdonlon/mines2/DrawPanel$1;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "id"

    .prologue
    .line 428
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$1;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget v0, v0, Lcom/pdonlon/mines2/DrawPanel;->selection:I

    if-nez v0, :cond_1

    .line 429
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$1;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/DrawPanel;->hostGame()V

    .line 432
    :cond_0
    :goto_0
    return-void

    .line 430
    :cond_1
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$1;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget v0, v0, Lcom/pdonlon/mines2/DrawPanel;->selection:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 431
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$1;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/DrawPanel;->joinGame()V

    goto :goto_0
.end method
