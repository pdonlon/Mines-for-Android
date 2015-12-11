.class Lcom/pdonlon/mines2/MainActivity$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pdonlon/mines2/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pdonlon/mines2/MainActivity;


# direct methods
.method constructor <init>(Lcom/pdonlon/mines2/MainActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 596
    iput-object p1, p0, Lcom/pdonlon/mines2/MainActivity$2;->this$0:Lcom/pdonlon/mines2/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 597
    iget-object v0, p0, Lcom/pdonlon/mines2/MainActivity$2;->this$0:Lcom/pdonlon/mines2/MainActivity;

    iget-object v0, v0, Lcom/pdonlon/mines2/MainActivity;->drawView:Lcom/pdonlon/mines2/DrawPanel;

    invoke-virtual {v0}, Lcom/pdonlon/mines2/DrawPanel;->invalidate()V

    return-void
.end method
