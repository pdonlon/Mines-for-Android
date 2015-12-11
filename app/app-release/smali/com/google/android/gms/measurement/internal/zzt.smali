.class Lcom/google/android/gms/measurement/internal/zzt;
.super Ljava/lang/Object;


# instance fields
.field private zzaNA:I

.field private zzaNB:I

.field private zzaNC:Z

.field private final zzaNv:I

.field private final zzaNw:I

.field private final zzaNx:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final zzaNy:Ljava/util/concurrent/locks/ReentrantLock;

.field private final zzaNz:Ljava/util/concurrent/locks/Condition;


# direct methods
.method public constructor <init>(Ljava/util/Set;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    const/4 v1, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzw(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzZ(Z)V

    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNy:Ljava/util/concurrent/locks/ReentrantLock;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNy:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNz:Ljava/util/concurrent/locks/Condition;

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNw:I

    iget v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNw:I

    const/16 v2, 0xa

    if-le v0, v2, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "PrimingBarrier does not support more than 10 specified threads"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNw:I

    add-int/lit8 v0, v0, 0x1

    shl-int v0, v1, v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNv:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNx:Ljava/util/List;

    return-void
.end method

.method private zzP(J)I
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNx:Ljava/util/List;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_0

    iget v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNw:I

    :cond_0
    const/4 v1, 0x1

    shl-int v0, v1, v0

    return v0
.end method

.method private zzc(Ljava/lang/Thread;)Z
    .locals 4

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzt;->zzd(Ljava/lang/Thread;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNA:I

    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzt;->zzP(J)I

    move-result v1

    or-int/2addr v0, v1

    iput v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNA:I

    const/4 v0, 0x0

    goto :goto_0
.end method

.method private zzd(Ljava/lang/Thread;)Z
    .locals 4

    iget v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNA:I

    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzt;->zzP(J)I

    move-result v1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private zze(Ljava/lang/Thread;)Z
    .locals 4

    iget v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNB:I

    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzt;->zzP(J)I

    move-result v1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNB:I

    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzt;->zzP(J)I

    move-result v1

    or-int/2addr v0, v1

    iput v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNB:I

    const/4 v0, 0x0

    goto :goto_0
.end method

.method private zzzZ()Z
    .locals 2

    iget v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNB:I

    iget v1, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNv:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public zzb(Ljava/lang/Thread;)V
    .locals 3

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzw(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNy:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/measurement/internal/zzt;->zzP(J)I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNA:I

    xor-int/lit8 v2, v0, -0x1

    and-int/2addr v1, v2

    iput v1, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNA:I

    iget v1, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNB:I

    xor-int/lit8 v0, v0, -0x1

    and-int/2addr v0, v1

    iput v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNB:I

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNz:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNy:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNy:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method public zzzY()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    const/4 v1, 0x1

    const/4 v0, 0x0

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNy:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :try_start_0
    iget-boolean v2, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNC:Z

    if-eqz v2, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Tried to await a barrier that has already passed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNy:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0

    :cond_0
    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/measurement/internal/zzt;->zzb(Ljava/lang/Thread;)V

    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0

    :cond_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/gms/measurement/internal/zzt;->zzc(Ljava/lang/Thread;)Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/gms/measurement/internal/zzt;->zze(Ljava/lang/Thread;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNx:Ljava/util/List;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_2

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "PrimingBarrier thinks current thread is already awaiting."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Multiple threads called shutdown on the Scheduler."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzt;->zzzZ()Z

    move-result v2

    if-nez v2, :cond_5

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/google/android/gms/measurement/internal/zzt;->zzd(Ljava/lang/Thread;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v2

    if-nez v2, :cond_4

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNy:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    :goto_0
    return v0

    :cond_4
    :try_start_2
    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNz:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    :try_start_3
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/measurement/internal/zzt;->zzb(Ljava/lang/Thread;)V

    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0

    :catch_0
    move-exception v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/android/gms/measurement/internal/zzt;->zzb(Ljava/lang/Thread;)V

    throw v0

    :cond_5
    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNC:Z

    if-nez v0, :cond_6

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNC:Z

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNz:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNy:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    move v0, v1

    goto :goto_0

    :cond_7
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzt;->zzaNy:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_0
.end method
