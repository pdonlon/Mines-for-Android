.class public Lcom/pdonlon/mines2/FullList;
.super Ljava/lang/Object;
.source "FullList.java"


# instance fields
.field head:Lcom/pdonlon/mines2/Node;

.field tail:Lcom/pdonlon/mines2/Node;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public add(II)V
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    .line 26
    new-instance v0, Lcom/pdonlon/mines2/Node;

    invoke-direct {v0, p1, p2}, Lcom/pdonlon/mines2/Node;-><init>(II)V

    .line 28
    .local v0, entering:Lcom/pdonlon/mines2/Node;
    iget-object v1, p0, Lcom/pdonlon/mines2/FullList;->tail:Lcom/pdonlon/mines2/Node;

    if-eqz v1, :cond_0

    .line 29
    iget-object v1, p0, Lcom/pdonlon/mines2/FullList;->tail:Lcom/pdonlon/mines2/Node;

    invoke-virtual {v1, v0}, Lcom/pdonlon/mines2/Node;->setNext(Lcom/pdonlon/mines2/Node;)V

    .line 31
    :cond_0
    iput-object v0, p0, Lcom/pdonlon/mines2/FullList;->tail:Lcom/pdonlon/mines2/Node;

    .line 33
    iget-object v1, p0, Lcom/pdonlon/mines2/FullList;->head:Lcom/pdonlon/mines2/Node;

    if-nez v1, :cond_1

    .line 34
    iput-object v0, p0, Lcom/pdonlon/mines2/FullList;->head:Lcom/pdonlon/mines2/Node;

    .line 36
    :cond_1
    return-void
.end method

.method public alreadyInFullList(II)Z
    .locals 3
    .parameter "x"
    .parameter "y"

    .prologue
    .line 11
    const/4 v0, 0x0

    .line 12
    .local v0, already:Z
    iget-object v1, p0, Lcom/pdonlon/mines2/FullList;->head:Lcom/pdonlon/mines2/Node;

    .line 14
    .local v1, pointer:Lcom/pdonlon/mines2/Node;
    :goto_0
    invoke-virtual {v1}, Lcom/pdonlon/mines2/Node;->getNext()Lcom/pdonlon/mines2/Node;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 16
    invoke-virtual {v1}, Lcom/pdonlon/mines2/Node;->getXCord()I

    move-result v2

    if-ne v2, p1, :cond_0

    invoke-virtual {v1}, Lcom/pdonlon/mines2/Node;->getYCord()I

    move-result v2

    if-ne v2, p2, :cond_0

    .line 17
    const/4 v0, 0x1

    .line 18
    :cond_0
    invoke-virtual {v1}, Lcom/pdonlon/mines2/Node;->getNext()Lcom/pdonlon/mines2/Node;

    move-result-object v1

    goto :goto_0

    .line 21
    :cond_1
    return v0
.end method

.method public getHead()Lcom/pdonlon/mines2/Node;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/pdonlon/mines2/FullList;->head:Lcom/pdonlon/mines2/Node;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 40
    const-string v1, ""

    .line 42
    .local v1, s:Ljava/lang/String;
    iget-object v0, p0, Lcom/pdonlon/mines2/FullList;->head:Lcom/pdonlon/mines2/Node;

    .line 43
    .local v0, ptr:Lcom/pdonlon/mines2/Node;
    :goto_0
    if-eqz v0, :cond_0

    .line 45
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Lcom/pdonlon/mines2/Node;->xCord:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Lcom/pdonlon/mines2/Node;->yCord:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 46
    invoke-virtual {v0}, Lcom/pdonlon/mines2/Node;->getNext()Lcom/pdonlon/mines2/Node;

    move-result-object v0

    goto :goto_0

    .line 49
    :cond_0
    return-object v1
.end method
