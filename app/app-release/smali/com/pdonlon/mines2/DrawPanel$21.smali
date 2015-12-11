.class Lcom/pdonlon/mines2/DrawPanel$21;
.super Ljava/lang/Object;
.source "DrawPanel.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pdonlon/mines2/DrawPanel;->winMessage()V
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
    .line 989
    iput-object p1, p0, Lcom/pdonlon/mines2/DrawPanel$21;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .parameter "dialog"
    .parameter "id"

    .prologue
    .line 992
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$21;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/MainActivity;->isUserConnected()Z

    move-result v0

    if-nez v0, :cond_0

    .line 993
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$21;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/pdonlon/mines2/DrawPanel;->leaderboardPressed:Z

    .line 994
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$21;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/MainActivity;->onSignInClicked()V

    .line 997
    :goto_0
    return-void

    .line 996
    :cond_0
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$21;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    iget-object v1, p0, Lcom/pdonlon/mines2/DrawPanel$21;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v1, v1, Lcom/pdonlon/mines2/DrawPanel;->scores:Landroid/content/SharedPreferences;

    iget-object v2, p0, Lcom/pdonlon/mines2/DrawPanel$21;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v2, v2, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    const-wide/16 v4, 0x0

    invoke-interface {v1, v2, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pdonlon/mines2/MainActivity;->submitScore(Ljava/lang/Long;)V

    goto :goto_0
.end method
