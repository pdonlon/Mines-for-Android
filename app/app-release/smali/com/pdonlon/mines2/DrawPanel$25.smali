.class Lcom/pdonlon/mines2/DrawPanel$25;
.super Ljava/lang/Object;
.source "DrawPanel.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pdonlon/mines2/DrawPanel;->showAllHighScores()V
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
    .line 1025
    iput-object p1, p0, Lcom/pdonlon/mines2/DrawPanel$25;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 1028
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$25;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iput p2, v0, Lcom/pdonlon/mines2/DrawPanel;->difficultySelect:I

    .line 1029
    return-void
.end method