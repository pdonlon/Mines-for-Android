.class Lcom/pdonlon/mines2/Board$3;
.super Ljava/lang/Object;
.source "Board.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pdonlon/mines2/Board;->tileOpen()V
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
    .line 750
    iput-object p1, p0, Lcom/pdonlon/mines2/Board$3;->this$0:Lcom/pdonlon/mines2/Board;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 751
    iget-object v0, p0, Lcom/pdonlon/mines2/Board$3;->this$0:Lcom/pdonlon/mines2/Board;

    iget-object v0, v0, Lcom/pdonlon/mines2/Board;->game:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/DrawPanel;->invalidate()V

    return-void
.end method
