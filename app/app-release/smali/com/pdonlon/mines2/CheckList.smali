.class public Lcom/pdonlon/mines2/CheckList;
.super Ljava/lang/Object;
.source "CheckList.java"


# instance fields
.field head:Lcom/pdonlon/mines2/Node;

.field tail:Lcom/pdonlon/mines2/Node;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public alreadyHead(II)Z
    .locals 3
    .parameter "x"
    .parameter "y"

    .prologue
    .line 81
    const/4 v0, 0x0

    .line 83
    .local v0, already:Z
    new-instance v1, Lcom/pdonlon/mines2/Node;

    invoke-direct {v1, p1, p2}, Lcom/pdonlon/mines2/Node;-><init>(II)V

    .line 85
    .local v1, check:Lcom/pdonlon/mines2/Node;
    iget-object v2, p0, Lcom/pdonlon/mines2/CheckList;->head:Lcom/pdonlon/mines2/Node;

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Node;->getXCord()I

    move-result v2

    if-ne v2, p1, :cond_0

    iget-object v2, p0, Lcom/pdonlon/mines2/CheckList;->head:Lcom/pdonlon/mines2/Node;

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Node;->getYCord()I

    move-result v2

    if-ne v2, p2, :cond_0

    .line 86
    const/4 v0, 0x1

    .line 88
    :cond_0
    return v0
.end method

.method public alreadyInCheckList(II)Z
    .locals 3
    .parameter "x"
    .parameter "y"

    .prologue
    .line 16
    const/4 v0, 0x0

    .line 17
    .local v0, already:Z
    iget-object v1, p0, Lcom/pdonlon/mines2/CheckList;->head:Lcom/pdonlon/mines2/Node;

    .line 19
    .local v1, pointer:Lcom/pdonlon/mines2/Node;
    :goto_0
    invoke-virtual {v1}, Lcom/pdonlon/mines2/Node;->getNext()Lcom/pdonlon/mines2/Node;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 21
    invoke-virtual {v1}, Lcom/pdonlon/mines2/Node;->getXCord()I

    move-result v2

    if-ne v2, p1, :cond_0

    invoke-virtual {v1}, Lcom/pdonlon/mines2/Node;->getYCord()I

    move-result v2

    if-ne v2, p2, :cond_0

    .line 22
    const/4 v0, 0x1

    .line 23
    :cond_0
    invoke-virtual {v1}, Lcom/pdonlon/mines2/Node;->getNext()Lcom/pdonlon/mines2/Node;

    move-result-object v1

    goto :goto_0

    .line 26
    :cond_1
    return v0
.end method

.method public deque()V
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/pdonlon/mines2/CheckList;->head:Lcom/pdonlon/mines2/Node;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/Node;->getNext()Lcom/pdonlon/mines2/Node;

    move-result-object v0

    iput-object v0, p0, Lcom/pdonlon/mines2/CheckList;->head:Lcom/pdonlon/mines2/Node;

    .line 123
    return-void
.end method

.method public empty()V
    .locals 1

    .prologue
    .line 127
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pdonlon/mines2/CheckList;->head:Lcom/pdonlon/mines2/Node;

    .line 128
    return-void
.end method

.method public enque(II)V
    .locals 2
    .parameter "x"
    .parameter "y"

    .prologue
    .line 60
    new-instance v0, Lcom/pdonlon/mines2/Node;

    invoke-direct {v0, p1, p2}, Lcom/pdonlon/mines2/Node;-><init>(II)V

    .line 62
    .local v0, entering:Lcom/pdonlon/mines2/Node;
    iget-object v1, p0, Lcom/pdonlon/mines2/CheckList;->tail:Lcom/pdonlon/mines2/Node;

    if-eqz v1, :cond_0

    .line 63
    iget-object v1, p0, Lcom/pdonlon/mines2/CheckList;->tail:Lcom/pdonlon/mines2/Node;

    invoke-virtual {v1, v0}, Lcom/pdonlon/mines2/Node;->setNext(Lcom/pdonlon/mines2/Node;)V

    .line 65
    :cond_0
    iput-object v0, p0, Lcom/pdonlon/mines2/CheckList;->tail:Lcom/pdonlon/mines2/Node;

    .line 67
    iget-object v1, p0, Lcom/pdonlon/mines2/CheckList;->head:Lcom/pdonlon/mines2/Node;

    if-nez v1, :cond_1

    .line 68
    iput-object v0, p0, Lcom/pdonlon/mines2/CheckList;->head:Lcom/pdonlon/mines2/Node;

    .line 69
    :cond_1
    return-void
.end method

.method public getHead()Lcom/pdonlon/mines2/Node;
    .locals 1

    .prologue
    .line 11
    iget-object v0, p0, Lcom/pdonlon/mines2/CheckList;->head:Lcom/pdonlon/mines2/Node;

    return-object v0
.end method

.method public getValues()[I
    .locals 4

    .prologue
    .line 94
    const/4 v3, 0x2

    new-array v0, v3, [I

    .line 96
    .local v0, array:[I
    iget-object v3, p0, Lcom/pdonlon/mines2/CheckList;->head:Lcom/pdonlon/mines2/Node;

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Node;->getXCord()I

    move-result v1

    .line 97
    .local v1, tempX:I
    const/4 v3, 0x0

    aput v1, v0, v3

    .line 98
    iget-object v3, p0, Lcom/pdonlon/mines2/CheckList;->head:Lcom/pdonlon/mines2/Node;

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Node;->getYCord()I

    move-result v2

    .line 99
    .local v2, tempY:I
    const/4 v3, 0x1

    aput v2, v0, v3

    .line 101
    return-object v0
.end method

.method public remove(II)Z
    .locals 4
    .parameter "x"
    .parameter "y"

    .prologue
    .line 31
    const/4 v0, 0x0

    .line 33
    .local v0, found:Z
    iget-object v1, p0, Lcom/pdonlon/mines2/CheckList;->head:Lcom/pdonlon/mines2/Node;

    .line 36
    .local v1, pointer:Lcom/pdonlon/mines2/Node;
    iget-object v3, p0, Lcom/pdonlon/mines2/CheckList;->head:Lcom/pdonlon/mines2/Node;

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Node;->getXCord()I

    move-result v3

    if-ne v3, p1, :cond_2

    iget-object v3, p0, Lcom/pdonlon/mines2/CheckList;->head:Lcom/pdonlon/mines2/Node;

    invoke-virtual {v3}, Lcom/pdonlon/mines2/Node;->getYCord()I

    move-result v3

    if-ne v3, p2, :cond_2

    .line 37
    iget-object v3, p0, Lcom/pdonlon/mines2/CheckList;->head:Lcom/pdonlon/mines2/Node;

    iget-object v3, v3, Lcom/pdonlon/mines2/Node;->next:Lcom/pdonlon/mines2/Node;

    iput-object v3, p0, Lcom/pdonlon/mines2/CheckList;->head:Lcom/pdonlon/mines2/Node;

    .line 55
    :cond_0
    :goto_0
    return v0

    .line 51
    .local v2, tempPointer:Lcom/pdonlon/mines2/Node;
    :cond_1
    iget-object v1, v1, Lcom/pdonlon/mines2/Node;->next:Lcom/pdonlon/mines2/Node;

    .line 41
    .end local v2           #tempPointer:Lcom/pdonlon/mines2/Node;
    :cond_2
    if-eqz v1, :cond_0

    .line 43
    invoke-virtual {v1}, Lcom/pdonlon/mines2/Node;->getNext()Lcom/pdonlon/mines2/Node;

    move-result-object v2

    .line 45
    .restart local v2       #tempPointer:Lcom/pdonlon/mines2/Node;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Node;->getXCord()I

    move-result v3

    if-ne v3, p1, :cond_1

    invoke-virtual {v2}, Lcom/pdonlon/mines2/Node;->getYCord()I

    move-result v3

    if-ne v3, p2, :cond_1

    .line 46
    invoke-virtual {v2}, Lcom/pdonlon/mines2/Node;->getNext()Lcom/pdonlon/mines2/Node;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/pdonlon/mines2/Node;->setNext(Lcom/pdonlon/mines2/Node;)V

    .line 47
    const/4 v0, 0x1

    .line 48
    goto :goto_0
.end method

.method public replaceHead(II)V
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 73
    new-instance v0, Lcom/pdonlon/mines2/Node;

    invoke-direct {v0, p1, p2}, Lcom/pdonlon/mines2/Node;-><init>(II)V

    .line 75
    .local v0, replacement:Lcom/pdonlon/mines2/Node;
    iput-object v0, p0, Lcom/pdonlon/mines2/CheckList;->head:Lcom/pdonlon/mines2/Node;

    .line 77
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 107
    const-string v1, ""

    .line 109
    .local v1, s:Ljava/lang/String;
    iget-object v0, p0, Lcom/pdonlon/mines2/CheckList;->head:Lcom/pdonlon/mines2/Node;

    .line 110
    .local v0, ptr:Lcom/pdonlon/mines2/Node;
    :goto_0
    if-eqz v0, :cond_0

    .line 112
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

    .line 113
    invoke-virtual {v0}, Lcom/pdonlon/mines2/Node;->getNext()Lcom/pdonlon/mines2/Node;

    move-result-object v0

    goto :goto_0

    .line 116
    :cond_0
    return-object v1
.end method
