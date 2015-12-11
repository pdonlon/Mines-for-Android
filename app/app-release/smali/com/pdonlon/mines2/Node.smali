.class Lcom/pdonlon/mines2/Node;
.super Ljava/lang/Object;
.source "CheckList.java"


# instance fields
.field next:Lcom/pdonlon/mines2/Node;

.field xCord:I

.field yCord:I


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .parameter "x"
    .parameter "y"

    .prologue
    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    iput p1, p0, Lcom/pdonlon/mines2/Node;->xCord:I

    .line 140
    iput p2, p0, Lcom/pdonlon/mines2/Node;->yCord:I

    .line 142
    return-void
.end method


# virtual methods
.method public getNext()Lcom/pdonlon/mines2/Node;
    .locals 1

    .prologue
    .line 156
    iget-object v0, p0, Lcom/pdonlon/mines2/Node;->next:Lcom/pdonlon/mines2/Node;

    return-object v0
.end method

.method public getXCord()I
    .locals 1

    .prologue
    .line 145
    iget v0, p0, Lcom/pdonlon/mines2/Node;->xCord:I

    return v0
.end method

.method public getYCord()I
    .locals 1

    .prologue
    .line 149
    iget v0, p0, Lcom/pdonlon/mines2/Node;->yCord:I

    return v0
.end method

.method public setNext(Lcom/pdonlon/mines2/Node;)V
    .locals 0
    .parameter "a"

    .prologue
    .line 153
    iput-object p1, p0, Lcom/pdonlon/mines2/Node;->next:Lcom/pdonlon/mines2/Node;

    .line 154
    return-void
.end method
