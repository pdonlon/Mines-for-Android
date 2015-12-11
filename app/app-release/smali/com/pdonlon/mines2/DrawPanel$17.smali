.class Lcom/pdonlon/mines2/DrawPanel$17;
.super Ljava/lang/Object;
.source "DrawPanel.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pdonlon/mines2/DrawPanel;->showNewGame()V
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
    .line 889
    iput-object p1, p0, Lcom/pdonlon/mines2/DrawPanel$17;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "id"

    .prologue
    .line 894
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$17;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$17;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget v1, v1, Lcom/pdonlon/mines2/DrawPanel;->difficultySelect:I

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/DrawPanel;->gameSelect(I)V

    .line 895
    return-void
.end method
