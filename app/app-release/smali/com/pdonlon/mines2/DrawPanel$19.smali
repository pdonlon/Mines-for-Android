.class Lcom/pdonlon/mines2/DrawPanel$19;
.super Ljava/lang/Object;
.source "DrawPanel.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pdonlon/mines2/DrawPanel;->alertTitleAndMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pdonlon/mines2/DrawPanel;

.field final synthetic val$button:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pdonlon/mines2/DrawPanel;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 943
    iput-object p1, p0, Lcom/pdonlon/mines2/DrawPanel$19;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iput-object p2, p0, Lcom/pdonlon/mines2/DrawPanel$19;->val$button:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "id"

    .prologue
    .line 946
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$19;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/DrawPanel;->resumeGame()V

    .line 947
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$19;->val$button:Ljava/lang/String;

    sget-object v1, Lcom/pdonlon/mines2/DrawPanel;->context:Landroid/content/Context;

    const v2, 0x7f050038

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 948
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$19;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$19;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, v1, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget v1, v1, Lcom/pdonlon/mines2/Board;->width:I

    div-int/lit8 v1, v1, 0x2

    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel$19;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v2, v2, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget v2, v2, Lcom/pdonlon/mines2/Board;->height:I

    div-int/lit8 v2, v2, 0x2

    invoke-virtual {v0, v1, v2}, Lcom/pdonlon/mines2/Board;->openBox(II)V

    .line 949
    :cond_0
    return-void
.end method
