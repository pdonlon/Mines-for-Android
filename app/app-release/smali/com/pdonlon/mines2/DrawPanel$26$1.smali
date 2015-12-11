.class Lcom/pdonlon/mines2/DrawPanel$26$1;
.super Ljava/lang/Object;
.source "DrawPanel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pdonlon/mines2/DrawPanel$26;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pdonlon/mines2/DrawPanel$26;


# direct methods
.method constructor <init>(Lcom/pdonlon/mines2/DrawPanel$26;)V
    .locals 0
    .parameter

    .prologue
    .line 1123
    iput-object p1, p0, Lcom/pdonlon/mines2/DrawPanel$26$1;->this$1:Lcom/pdonlon/mines2/DrawPanel$26;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1125
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$26$1;->this$1:Lcom/pdonlon/mines2/DrawPanel$26;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/DrawPanel;->invalidate()V

    .line 1127
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$26$1;->this$1:Lcom/pdonlon/mines2/DrawPanel$26;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-boolean v0, v0, Lcom/pdonlon/mines2/DrawPanel;->winMessage:Z

    if-eqz v0, :cond_0

    .line 1128
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$26$1;->this$1:Lcom/pdonlon/mines2/DrawPanel$26;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel$26;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/DrawPanel;->winMessage()V

    .line 1129
    :cond_0
    return-void
.end method
