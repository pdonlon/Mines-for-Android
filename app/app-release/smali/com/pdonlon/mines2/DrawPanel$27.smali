.class Lcom/pdonlon/mines2/DrawPanel$27;
.super Ljava/lang/Object;
.source "DrawPanel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pdonlon/mines2/DrawPanel;->bombAnimation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pdonlon/mines2/DrawPanel;

.field final synthetic val$tempVibration:I


# direct methods
.method constructor <init>(Lcom/pdonlon/mines2/DrawPanel;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1198
    iput-object p1, p0, Lcom/pdonlon/mines2/DrawPanel$27;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iput p2, p0, Lcom/pdonlon/mines2/DrawPanel$27;->val$tempVibration:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 1201
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel$27;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v3, v3, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    const-string v4, "vibrator"

    invoke-virtual {v3, v4}, Lcom/pdonlon/mines2/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Vibrator;

    .line 1202
    .local v2, v:Landroid/os/Vibrator;
    const/4 v3, 0x0

    sput-boolean v3, Lcom/pdonlon/mines2/Board;->doneAnimating:Z

    .line 1204
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel$27;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v3, v3, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Board;->getUnsafeBombCount()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .line 1208
    .local v0, bombsLeft:I
    :goto_0
    if-lez v0, :cond_1

    .line 1211
    :try_start_0
    iget v3, p0, Lcom/pdonlon/mines2/DrawPanel$27;->val$tempVibration:I

    int-to-long v4, v3

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1216
    :goto_1
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel$27;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v3}, Lcom/pdonlon/mines2/DrawPanel;->explosion()V

    .line 1218
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel$27;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-boolean v3, v3, Lcom/pdonlon/mines2/DrawPanel;->vibration:Z

    if-eqz v3, :cond_0

    .line 1219
    iget v3, p0, Lcom/pdonlon/mines2/DrawPanel$27;->val$tempVibration:I

    int-to-long v4, v3

    invoke-virtual {v2, v4, v5}, Landroid/os/Vibrator;->vibrate(J)V

    .line 1220
    iget-object v3, p0, Lcom/pdonlon/mines2/DrawPanel$27;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-boolean v3, v3, Lcom/pdonlon/mines2/DrawPanel;->animations:Z

    if-nez v3, :cond_0

    .line 1221
    const-wide/16 v4, 0x64

    invoke-virtual {v2, v4, v5}, Landroid/os/Vibrator;->vibrate(J)V

    .line 1224
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 1212
    :catch_0
    move-exception v1

    .line 1213
    .local v1, ex:Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    goto :goto_1

    .line 1226
    .end local v1           #ex:Ljava/lang/InterruptedException;
    :cond_1
    const/4 v3, 0x1

    sput-boolean v3, Lcom/pdonlon/mines2/Board;->doneAnimating:Z

    .line 1227
    return-void
.end method
