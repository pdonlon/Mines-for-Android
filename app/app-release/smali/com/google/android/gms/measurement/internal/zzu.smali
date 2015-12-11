.class public Lcom/google/android/gms/measurement/internal/zzu;
.super Lcom/google/android/gms/measurement/internal/zzy;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/measurement/internal/zzu$zzb;,
        Lcom/google/android/gms/measurement/internal/zzu$zza;,
        Lcom/google/android/gms/measurement/internal/zzu$zzc;
    }
.end annotation


# instance fields
.field private volatile zzLA:Z

.field private final zzaND:Lcom/google/android/gms/measurement/internal/zzu$zzc;

.field private final zzaNE:Lcom/google/android/gms/measurement/internal/zzu$zzc;

.field private final zzaNF:Lcom/google/android/gms/measurement/internal/zzt;

.field private volatile zzaNG:Z


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzv;)V
    .locals 4

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzy;-><init>(Lcom/google/android/gms/measurement/internal/zzv;)V

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzu$zzc;

    const-string v1, "Measurement Worker"

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/measurement/internal/zzu$zzc;-><init>(Lcom/google/android/gms/measurement/internal/zzu;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzu;->zzaND:Lcom/google/android/gms/measurement/internal/zzu$zzc;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzu$zzc;

    const-string v1, "Measurement Network"

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/measurement/internal/zzu$zzc;-><init>(Lcom/google/android/gms/measurement/internal/zzu;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzu;->zzaNE:Lcom/google/android/gms/measurement/internal/zzu$zzc;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzu;->zzaND:Lcom/google/android/gms/measurement/internal/zzu$zzc;

    new-instance v1, Lcom/google/android/gms/measurement/internal/zzu$zzb;

    const-string v2, "Thread death: Uncaught exception on worker thread"

    invoke-direct {v1, p0, v2}, Lcom/google/android/gms/measurement/internal/zzu$zzb;-><init>(Lcom/google/android/gms/measurement/internal/zzu;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzu$zzc;->setUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzu;->zzaNE:Lcom/google/android/gms/measurement/internal/zzu$zzc;

    new-instance v1, Lcom/google/android/gms/measurement/internal/zzu$zzb;

    const-string v2, "Thread death: Uncaught exception on network thread"

    invoke-direct {v1, p0, v2}, Lcom/google/android/gms/measurement/internal/zzu$zzb;-><init>(Lcom/google/android/gms/measurement/internal/zzu;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzu$zzc;->setUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzu;->zzaND:Lcom/google/android/gms/measurement/internal/zzu$zzc;

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzu$zzc;->getId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzu;->zzaNE:Lcom/google/android/gms/measurement/internal/zzu$zzc;

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzu$zzc;->getId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/google/android/gms/measurement/internal/zzt;

    invoke-direct {v1, v0}, Lcom/google/android/gms/measurement/internal/zzt;-><init>(Ljava/util/Set;)V

    iput-object v1, p0, Lcom/google/android/gms/measurement/internal/zzu;->zzaNF:Lcom/google/android/gms/measurement/internal/zzt;

    return-void
.end method

.method private zza(Ljava/lang/Runnable;Lcom/google/android/gms/measurement/internal/zzu$zzc;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzu;->zziE()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzw(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzu$zza;

    invoke-direct {v0, p0, p1, p3}, Lcom/google/android/gms/measurement/internal/zzu$zza;-><init>(Lcom/google/android/gms/measurement/internal/zzu;Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Lcom/google/android/gms/measurement/internal/zzu$zzc;->zza(Ljava/util/concurrent/FutureTask;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/measurement/internal/zzu;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzu;->zzLA:Z

    return v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/measurement/internal/zzu;)Lcom/google/android/gms/measurement/internal/zzt;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzu;->zzaNF:Lcom/google/android/gms/measurement/internal/zzt;

    return-object v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/measurement/internal/zzu;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzu;->zzaNG:Z

    return v0
.end method


# virtual methods
.method public bridge synthetic getContext()Landroid/content/Context;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzy;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public zzh(Ljava/lang/Runnable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzu;->zzaND:Lcom/google/android/gms/measurement/internal/zzu$zzc;

    const-string v1, "Task exception on worker thread"

    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzu;->zza(Ljava/lang/Runnable;Lcom/google/android/gms/measurement/internal/zzu$zzc;Ljava/lang/String;)V

    return-void
.end method

.method protected zzhR()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzu;->zzaND:Lcom/google/android/gms/measurement/internal/zzu$zzc;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzu$zzc;->start()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzu;->zzaNE:Lcom/google/android/gms/measurement/internal/zzu$zzc;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzu$zzc;->start()V

    return-void
.end method

.method public zzi(Ljava/lang/Runnable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzu;->zzaNE:Lcom/google/android/gms/measurement/internal/zzu$zzc;

    const-string v1, "Task exception on network thread"

    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/gms/measurement/internal/zzu;->zza(Ljava/lang/Runnable;Lcom/google/android/gms/measurement/internal/zzu$zzc;Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic zzir()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzy;->zzir()V

    return-void
.end method

.method public zzis()V
    .locals 2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzu;->zzaND:Lcom/google/android/gms/measurement/internal/zzu$zzc;

    if-eq v0, v1, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Call expected from worker thread"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method

.method public bridge synthetic zzit()Lcom/google/android/gms/internal/zzmn;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzy;->zzit()Lcom/google/android/gms/internal/zzmn;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzyd()Lcom/google/android/gms/measurement/internal/zzp;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzy;->zzyd()Lcom/google/android/gms/measurement/internal/zzp;

    move-result-object v0

    return-object v0
.end method

.method public zzzn()V
    .locals 2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzu;->zzaNE:Lcom/google/android/gms/measurement/internal/zzu$zzc;

    if-eq v0, v1, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Call expected from network thread"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method

.method public bridge synthetic zzzo()Lcom/google/android/gms/measurement/internal/zzn;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzy;->zzzo()Lcom/google/android/gms/measurement/internal/zzn;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzzp()Lcom/google/android/gms/measurement/internal/zzab;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzy;->zzzp()Lcom/google/android/gms/measurement/internal/zzab;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzzq()Lcom/google/android/gms/measurement/internal/zzag;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzy;->zzzq()Lcom/google/android/gms/measurement/internal/zzag;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzzr()Lcom/google/android/gms/measurement/internal/zzu;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzy;->zzzr()Lcom/google/android/gms/measurement/internal/zzu;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzzs()Lcom/google/android/gms/measurement/internal/zzs;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzy;->zzzs()Lcom/google/android/gms/measurement/internal/zzs;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic zzzt()Lcom/google/android/gms/measurement/internal/zzc;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzy;->zzzt()Lcom/google/android/gms/measurement/internal/zzc;

    move-result-object v0

    return-object v0
.end method
