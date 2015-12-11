.class Lcom/pdonlon/mines2/DrawPanel$10;
.super Ljava/lang/Object;
.source "DrawPanel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pdonlon/mines2/DrawPanel;->loadGame()V
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
    .line 677
    iput-object p1, p0, Lcom/pdonlon/mines2/DrawPanel$10;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    const/4 v14, 0x0

    .line 681
    const/4 v7, 0x0

    .line 682
    .local v7, counter:I
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$10;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-object v9, p0, Lcom/pdonlon/mines2/DrawPanel$10;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v9, v9, Lcom/pdonlon/mines2/DrawPanel;->save:Landroid/content/SharedPreferences;

    const-string v10, "theta"

    const-wide v12, 0x4070e00000000000L

    invoke-static {v12, v13}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v12

    double-to-float v11, v12

    invoke-interface {v9, v10, v11}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v9

    float-to-double v10, v9

    invoke-virtual {v0, v10, v11}, Lcom/pdonlon/mines2/Board;->setTheta(D)V

    .line 683
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$10;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-object v9, p0, Lcom/pdonlon/mines2/DrawPanel$10;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v9, v9, Lcom/pdonlon/mines2/DrawPanel;->save:Landroid/content/SharedPreferences;

    const-string v10, "flag count"

    iget-object v11, p0, Lcom/pdonlon/mines2/DrawPanel$10;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v11, v11, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v11}, Lcom/pdonlon/mines2/Board;->getFlagCount()I

    move-result v11

    invoke-interface {v9, v10, v11}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v9

    invoke-virtual {v0, v9}, Lcom/pdonlon/mines2/Board;->setFlagCount(I)V

    .line 684
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$10;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->save:Landroid/content/SharedPreferences;

    const-string v9, "gold"

    sget-boolean v10, Lcom/pdonlon/mines2/MainActivity;->pro:Z

    invoke-interface {v0, v9, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v0}, Lcom/pdonlon/mines2/Board;->setPro(Z)V

    .line 686
    const/4 v2, 0x0

    .local v2, y:I
    :goto_0
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$10;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->getHeight()I

    move-result v0

    if-ge v2, v0, :cond_1

    .line 687
    const/4 v1, 0x0

    .local v1, x:I
    :goto_1
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$10;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Board;->getWidth()I

    move-result v0

    if-ge v1, v0, :cond_0

    .line 689
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v9, ""

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 690
    .local v8, key:Ljava/lang/String;
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$10;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->bombsSurrounding:Landroid/content/SharedPreferences;

    invoke-interface {v0, v8, v14}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 691
    .local v3, bs:I
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$10;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->cellOpen:Landroid/content/SharedPreferences;

    invoke-interface {v0, v8, v14}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    .line 692
    .local v4, open:Z
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$10;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->cellBomb:Landroid/content/SharedPreferences;

    invoke-interface {v0, v8, v14}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    .line 693
    .local v5, bomb:Z
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$10;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->cellFlag:Landroid/content/SharedPreferences;

    invoke-interface {v0, v8, v14}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    .line 695
    .local v6, flagged:Z
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$10;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    invoke-virtual/range {v0 .. v6}, Lcom/pdonlon/mines2/Board;->createMine(IIIZZZ)V

    .line 696
    add-int/lit8 v7, v7, 0x1

    .line 687
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 686
    .end local v3           #bs:I
    .end local v4           #open:Z
    .end local v5           #bomb:Z
    .end local v6           #flagged:Z
    .end local v8           #key:Ljava/lang/String;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 699
    .end local v1           #x:I
    :cond_1
    const/4 v1, 0x0

    .restart local v1       #x:I
    :goto_2
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$10;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->save:Landroid/content/SharedPreferences;

    const-string v9, "total bombs"

    invoke-interface {v0, v9, v14}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-ge v1, v0, :cond_2

    .line 701
    iget-object v0, p0, Lcom/pdonlon/mines2/DrawPanel$10;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v0, v0, Lcom/pdonlon/mines2/DrawPanel;->playBoard:Lcom/pdonlon/mines2/Board;

    iget-object v9, p0, Lcom/pdonlon/mines2/DrawPanel$10;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v9, v9, Lcom/pdonlon/mines2/DrawPanel;->bombLocationX:Landroid/content/SharedPreferences;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10, v14}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v9

    iget-object v10, p0, Lcom/pdonlon/mines2/DrawPanel$10;->this$0:Lcom/pdonlon/mines2/DrawPanel;

    iget-object v10, v10, Lcom/pdonlon/mines2/DrawPanel;->bombLocationY:Landroid/content/SharedPreferences;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ""

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11, v14}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v10

    invoke-virtual {v0, v9, v10}, Lcom/pdonlon/mines2/Board;->placeBombLocation(II)V

    .line 699
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 704
    :cond_2
    return-void
.end method
