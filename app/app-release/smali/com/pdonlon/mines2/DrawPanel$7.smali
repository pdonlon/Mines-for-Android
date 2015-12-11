.class Lcom/pdonlon/mines2/DrawPanel$7;
.super Ljava/lang/Object;
.source "DrawPanel.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pdonlon/mines2/DrawPanel;->joinGame()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pdonlon/mines2/DrawPanel;

.field final synthetic val$input:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/pdonlon/mines2/DrawPanel;Landroid/widget/EditText;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 542
    iput-object p1, p0, Lcom/pdonlon/mines2/DrawPanel$7;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iput-object p2, p0, Lcom/pdonlon/mines2/DrawPanel$7;->val$input:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 8
    .parameter "dialog"
    .parameter "which"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 546
    const/4 v2, 0x0

    .line 547
    .local v2, seedValue:I
    const/4 v0, 0x0

    .line 549
    .local v0, d:I
    :try_start_0
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel$7;->val$input:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/pdonlon/mines2/DrawPanel$7;->val$input:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->length()I

    move-result v5

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 550
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/pdonlon/mines2/DrawPanel$7;->val$input:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 558
    if-lt v2, v7, :cond_0

    const/4 v3, 0x3

    if-le v0, v3, :cond_1

    .line 559
    :cond_0
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel$7;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v3}, Lcom/pdonlon/mines2/DrawPanel;->resumeGame()V

    .line 571
    :goto_0
    return-void

    .line 552
    :catch_0
    move-exception v1

    .line 554
    .local v1, e:Ljava/lang/Exception;
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel$7;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v3}, Lcom/pdonlon/mines2/DrawPanel;->resumeGame()V

    goto :goto_0

    .line 562
    .end local v1           #e:Ljava/lang/Exception;
    :cond_1
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel$7;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v3, v0}, Lcom/pdonlon/mines2/DrawPanel;->gameSelect(I)V

    .line 563
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel$7;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v3, v3, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v3, v2}, Lcom/pdonlon/mines2/Board;->setSeed(I)V

    .line 566
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel$7;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v3, v3, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    new-instance v4, Lcom/pdonlon/mines2/DrawPanel$7$1;

    invoke-direct {v4, p0}, Lcom/pdonlon/mines2/DrawPanel$7$1;-><init>(Lcom/pdonlon/mines2/DrawPanel$7;)V

    invoke-virtual {v3, v4}, Lcom/pdonlon/mines2/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 569
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel$7;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iput-boolean v6, v3, Lcom/pdonlon/mines2/DrawPanel;->pauseAlertDialogUp:Z

    goto :goto_0
.end method
