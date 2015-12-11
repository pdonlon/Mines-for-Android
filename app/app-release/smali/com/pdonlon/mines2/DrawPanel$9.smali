.class Lcom/pdonlon/mines2/DrawPanel$9;
.super Ljava/lang/Object;
.source "DrawPanel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pdonlon/mines2/DrawPanel;->saveGame()V
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
    .line 610
    iput-object p1, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    .line 613
    monitor-enter p0

    .line 614
    :try_start_0
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    const-string v9, "difficulty"

    iget-object v10, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v10, v10, Lcom/pdonlon/mines2/DrawPanel;->difficulty:Ljava/lang/String;

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 615
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    const-string v9, "gold"

    sget-boolean v10, Lcom/pdonlon/mines2/Board;->pro:Z

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 616
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v8}, Lcom/pdonlon/mines2/Board;->endTimer()V

    .line 617
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    const-string v9, "time"

    iget-object v10, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v10, v10, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v10}, Lcom/pdonlon/mines2/Board;->getTimeCounter()I

    move-result v10

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 619
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-boolean v8, v8, Lcom/pdonlon/mines2/DrawPanel;->gameOver:Z

    if-nez v8, :cond_0

    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v8}, Lcom/pdonlon/mines2/Board;->getTimeCounter()I

    move-result v8

    if-lez v8, :cond_0

    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v8}, Lcom/pdonlon/mines2/Board;->getOpenedBoxCount()I

    move-result v8

    if-nez v8, :cond_1

    .line 621
    :cond_0
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    const-string v9, "saveGame"

    const/4 v10, 0x0

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 622
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    const-string v9, "done saving"

    const/4 v10, 0x1

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 623
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 624
    monitor-exit p0

    .line 660
    :goto_0
    return-void

    .line 627
    :cond_1
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->bombsSurrounding:Landroid/content/SharedPreferences;

    invoke-interface {v8}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 628
    .local v0, bsEditor:Landroid/content/SharedPreferences$Editor;
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->cellOpen:Landroid/content/SharedPreferences;

    invoke-interface {v8}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 629
    .local v3, coEditor:Landroid/content/SharedPreferences$Editor;
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->cellBomb:Landroid/content/SharedPreferences;

    invoke-interface {v8}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 630
    .local v1, cbEditor:Landroid/content/SharedPreferences$Editor;
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->cellFlag:Landroid/content/SharedPreferences;

    invoke-interface {v8}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 632
    .local v2, cfEditor:Landroid/content/SharedPreferences$Editor;
    const/4 v4, 0x0

    .line 633
    .local v4, counter:I
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    const-string v9, "save"

    const/4 v10, 0x1

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 634
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    const-string v9, "theta"

    iget-object v10, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v10, v10, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v10}, Lcom/pdonlon/mines2/Board;->getTheta()D

    move-result-wide v10

    double-to-float v10, v10

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    .line 635
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    const-string v9, "total bombs"

    iget-object v10, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v10, v10, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v10}, Lcom/pdonlon/mines2/Board;->getTotalBombs()I

    move-result v10

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 636
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    const-string v9, "flag count"

    iget-object v10, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v10, v10, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v10}, Lcom/pdonlon/mines2/Board;->getFlagCount()I

    move-result v10

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 638
    const/4 v7, 0x0

    .local v7, y:I
    :goto_1
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v8}, Lcom/pdonlon/mines2/Board;->getHeight()I

    move-result v8

    if-ge v7, v8, :cond_3

    .line 639
    const/4 v6, 0x0

    .local v6, x:I
    :goto_2
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v8}, Lcom/pdonlon/mines2/Board;->getWidth()I

    move-result v8

    if-ge v6, v8, :cond_2

    .line 641
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 643
    .local v5, key:Ljava/lang/String;
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v8, v6, v7}, Lcom/pdonlon/mines2/Board;->getBombsSurrounding(II)I

    move-result v8

    invoke-interface {v0, v5, v8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 644
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    const-string v9, "bomb"

    invoke-virtual {v8, v6, v7, v9}, Lcom/pdonlon/mines2/Board;->isThis(IILjava/lang/String;)Z

    move-result v8

    invoke-interface {v1, v5, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 645
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    const-string v9, "open"

    invoke-virtual {v8, v6, v7, v9}, Lcom/pdonlon/mines2/Board;->isThis(IILjava/lang/String;)Z

    move-result v8

    invoke-interface {v3, v5, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 646
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    const-string v9, "flag"

    invoke-virtual {v8, v6, v7, v9}, Lcom/pdonlon/mines2/Board;->isThis(IILjava/lang/String;)Z

    move-result v8

    invoke-interface {v2, v5, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 647
    add-int/lit8 v4, v4, 0x1

    .line 639
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 638
    .end local v5           #key:Ljava/lang/String;
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 649
    .end local v6           #x:I
    :cond_3
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v8}, Lcom/pdonlon/mines2/Board;->saveBombLocations()V

    .line 651
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 652
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 653
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 654
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 656
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    const-string v9, "done saving"

    const/4 v10, 0x1

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 657
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->saveEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 658
    iget-object v8, p0, Lcom/pdonlon/mines2/DrawPanel$9;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v8, v8, Lcom/pdonlon/mines2/DrawPanel;->mactivity:Lcom/pdonlon/mines2/MainActivity;

    invoke-virtual {v8}, Lcom/pdonlon/mines2/MainActivity;->finish()V

    .line 659
    monitor-exit p0

    goto/16 :goto_0

    .end local v0           #bsEditor:Landroid/content/SharedPreferences$Editor;
    .end local v1           #cbEditor:Landroid/content/SharedPreferences$Editor;
    .end local v2           #cfEditor:Landroid/content/SharedPreferences$Editor;
    .end local v3           #coEditor:Landroid/content/SharedPreferences$Editor;
    .end local v4           #counter:I
    .end local v7           #y:I
    :catchall_0
    move-exception v8

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v8
.end method
