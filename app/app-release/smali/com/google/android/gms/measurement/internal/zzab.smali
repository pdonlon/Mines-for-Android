.class public Lcom/google/android/gms/measurement/internal/zzab;
.super Lcom/google/android/gms/measurement/internal/zzy;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/measurement/internal/zzab$zza;
    }
.end annotation


# instance fields
.field private final zzaOl:Lcom/google/android/gms/measurement/internal/zzab$zza;

.field private zzaOm:Lcom/google/android/gms/measurement/internal/zzm;

.field private zzaOn:Ljava/lang/Boolean;

.field private final zzaOo:Lcom/google/android/gms/measurement/internal/zze;

.field private final zzaOp:Lcom/google/android/gms/measurement/internal/zzac;

.field private final zzaOq:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private final zzaOr:Lcom/google/android/gms/measurement/internal/zze;


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/measurement/internal/zzv;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzy;-><init>(Lcom/google/android/gms/measurement/internal/zzv;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOq:Ljava/util/List;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzac;

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzv;->zzit()Lcom/google/android/gms/internal/zzmn;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/measurement/internal/zzac;-><init>(Lcom/google/android/gms/internal/zzmn;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOp:Lcom/google/android/gms/measurement/internal/zzac;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzab$zza;

    invoke-direct {v0, p0}, Lcom/google/android/gms/measurement/internal/zzab$zza;-><init>(Lcom/google/android/gms/measurement/internal/zzab;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOl:Lcom/google/android/gms/measurement/internal/zzab$zza;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzab$1;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/measurement/internal/zzab$1;-><init>(Lcom/google/android/gms/measurement/internal/zzab;Lcom/google/android/gms/measurement/internal/zzv;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOo:Lcom/google/android/gms/measurement/internal/zze;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzab$2;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/measurement/internal/zzab$2;-><init>(Lcom/google/android/gms/measurement/internal/zzab;Lcom/google/android/gms/measurement/internal/zzv;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOr:Lcom/google/android/gms/measurement/internal/zze;

    return-void
.end method

.method private onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .parameter "name"

    .prologue
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzis()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOm:Lcom/google/android/gms/measurement/internal/zzm;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOm:Lcom/google/android/gms/measurement/internal/zzm;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzyd()Lcom/google/android/gms/measurement/internal/zzp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzp;->zzzQ()Lcom/google/android/gms/measurement/internal/zzp$zza;

    move-result-object v0

    const-string v1, "Disconnected from device MeasurementService"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzp$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzAu()V

    :cond_0
    return-void
.end method

.method private zzAs()Z
    .locals 4

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->getContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/google/android/gms/measurement/AppMeasurementService;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private zzAt()Z
    .locals 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzis()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zziE()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzzt()Lcom/google/android/gms/measurement/internal/zzc;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzc;->zzjA()Z

    move-result v2

    if-eqz v2, :cond_0

    :goto_0
    return v0

    :cond_0
    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.google.android.gms.measurement.START"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v3, Landroid/content/ComponentName;

    const-string v4, "com.google.android.gms"

    const-string v5, "com.google.android.gms.measurement.service.MeasurementBrokerService"

    invoke-direct {v3, v4, v5}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    invoke-static {}, Lcom/google/android/gms/common/stats/zzb;->zzqh()Lcom/google/android/gms/common/stats/zzb;

    move-result-object v3

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzyd()Lcom/google/android/gms/measurement/internal/zzp;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzp;->zzzQ()Lcom/google/android/gms/measurement/internal/zzp$zza;

    move-result-object v4

    const-string v5, "Checking service availability"

    invoke-virtual {v4, v5}, Lcom/google/android/gms/measurement/internal/zzp$zza;->zzec(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->getContext()Landroid/content/Context;

    move-result-object v4

    new-instance v5, Lcom/google/android/gms/measurement/internal/zzab$4;

    invoke-direct {v5, p0}, Lcom/google/android/gms/measurement/internal/zzab$4;-><init>(Lcom/google/android/gms/measurement/internal/zzab;)V

    invoke-virtual {v3, v4, v2, v5, v1}, Lcom/google/android/gms/common/stats/zzb;->zza(Landroid/content/Context;Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzyd()Lcom/google/android/gms/measurement/internal/zzp;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzp;->zzzQ()Lcom/google/android/gms/measurement/internal/zzp$zza;

    move-result-object v1

    const-string v2, "Service available"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzp$zza;->zzec(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method private zzAu()V
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzis()V

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzjg()V

    return-void
.end method

.method private zzAv()V
    .locals 3

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzis()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzyd()Lcom/google/android/gms/measurement/internal/zzp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzp;->zzzQ()Lcom/google/android/gms/measurement/internal/zzp$zza;

    move-result-object v0

    const-string v1, "Flushing task queue"

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOq:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzp$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOq:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzzr()Lcom/google/android/gms/measurement/internal/zzu;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/google/android/gms/measurement/internal/zzu;->zzh(Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOq:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOr:Lcom/google/android/gms/measurement/internal/zze;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zze;->cancel()V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/measurement/internal/zzab;)Lcom/google/android/gms/measurement/internal/zzab$zza;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOl:Lcom/google/android/gms/measurement/internal/zzab$zza;

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/measurement/internal/zzab;Landroid/content/ComponentName;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzab;->onServiceDisconnected(Landroid/content/ComponentName;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/measurement/internal/zzab;Lcom/google/android/gms/measurement/internal/zzm;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzab;->zza(Lcom/google/android/gms/measurement/internal/zzm;)V

    return-void
.end method

.method private zza(Lcom/google/android/gms/measurement/internal/zzm;)V
    .locals 0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzis()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzw(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOm:Lcom/google/android/gms/measurement/internal/zzm;

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zziR()V

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzAv()V

    return-void
.end method

.method static synthetic zzb(Lcom/google/android/gms/measurement/internal/zzab;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zziS()V

    return-void
.end method

.method static synthetic zzc(Lcom/google/android/gms/measurement/internal/zzab;)Lcom/google/android/gms/measurement/internal/zzm;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOm:Lcom/google/android/gms/measurement/internal/zzm;

    return-object v0
.end method

.method static synthetic zzd(Lcom/google/android/gms/measurement/internal/zzab;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zziR()V

    return-void
.end method

.method private zziR()V
    .locals 4

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzis()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOp:Lcom/google/android/gms/measurement/internal/zzac;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzac;->start()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOo:Lcom/google/android/gms/measurement/internal/zze;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzzt()Lcom/google/android/gms/measurement/internal/zzc;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzc;->zzjV()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zze;->zzt(J)V

    return-void
.end method

.method private zziS()V
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzis()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzyd()Lcom/google/android/gms/measurement/internal/zzp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzp;->zzzQ()Lcom/google/android/gms/measurement/internal/zzp$zza;

    move-result-object v0

    const-string v1, "Inactivity, disconnecting from AppMeasurementService"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzp$zza;->zzec(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->disconnect()V

    goto :goto_0
.end method

.method private zzj(Ljava/lang/Runnable;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzis()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOq:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzzt()Lcom/google/android/gms/measurement/internal/zzc;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzc;->zzze()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzyd()Lcom/google/android/gms/measurement/internal/zzp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzp;->zzzK()Lcom/google/android/gms/measurement/internal/zzp$zza;

    move-result-object v0

    const-string v1, "Discarding data. Max runnable queue size reached"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzp$zza;->zzec(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOq:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOr:Lcom/google/android/gms/measurement/internal/zze;

    const-wide/32 v2, 0xea60

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zze;->zzt(J)V

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzjg()V

    goto :goto_0
.end method

.method private zzjg()V
    .locals 4

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzis()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zziE()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOn:Ljava/lang/Boolean;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzzs()Lcom/google/android/gms/measurement/internal/zzs;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzs;->zzzW()Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOn:Ljava/lang/Boolean;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOn:Ljava/lang/Boolean;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzyd()Lcom/google/android/gms/measurement/internal/zzp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzp;->zzzQ()Lcom/google/android/gms/measurement/internal/zzp$zza;

    move-result-object v0

    const-string v1, "State of service unknown"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzp$zza;->zzec(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzAt()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOn:Ljava/lang/Boolean;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzzs()Lcom/google/android/gms/measurement/internal/zzs;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOn:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzs;->zzan(Z)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOn:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzyd()Lcom/google/android/gms/measurement/internal/zzp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzp;->zzzQ()Lcom/google/android/gms/measurement/internal/zzp$zza;

    move-result-object v0

    const-string v1, "Using measurement service"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzp$zza;->zzec(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOl:Lcom/google/android/gms/measurement/internal/zzab$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzab$zza;->zzAw()V

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzAs()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzyd()Lcom/google/android/gms/measurement/internal/zzp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzp;->zzzQ()Lcom/google/android/gms/measurement/internal/zzp$zza;

    move-result-object v0

    const-string v1, "Using local app measurement service"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzp$zza;->zzec(Ljava/lang/String;)V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.google.android.gms.measurement.START"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v1, Landroid/content/ComponentName;

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->getContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/google/android/gms/measurement/AppMeasurementService;

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOl:Lcom/google/android/gms/measurement/internal/zzab$zza;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/measurement/internal/zzab$zza;->zzu(Landroid/content/Intent;)V

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzzt()Lcom/google/android/gms/measurement/internal/zzc;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzc;->zzjB()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzyd()Lcom/google/android/gms/measurement/internal/zzp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzp;->zzzQ()Lcom/google/android/gms/measurement/internal/zzp$zza;

    move-result-object v0

    const-string v1, "Using direct local measurement implementation"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzp$zza;->zzec(Ljava/lang/String;)V

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzw;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaKG:Lcom/google/android/gms/measurement/internal/zzv;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzw;-><init>(Lcom/google/android/gms/measurement/internal/zzv;Z)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzab;->zza(Lcom/google/android/gms/measurement/internal/zzm;)V

    goto/16 :goto_0

    :cond_4
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzyd()Lcom/google/android/gms/measurement/internal/zzp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzp;->zzzK()Lcom/google/android/gms/measurement/internal/zzp$zza;

    move-result-object v0

    const-string v1, "Not in main process. Unable to use local measurement implementation. Please register the AppMeasurementService service in the app manifest"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzp$zza;->zzec(Ljava/lang/String;)V

    goto/16 :goto_0
.end method


# virtual methods
.method public disconnect()V
    .locals 3

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzis()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zziE()V

    :try_start_0
    invoke-static {}, Lcom/google/android/gms/common/stats/zzb;->zzqh()Lcom/google/android/gms/common/stats/zzb;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOl:Lcom/google/android/gms/measurement/internal/zzab$zza;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/stats/zzb;->zza(Landroid/content/Context;Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOm:Lcom/google/android/gms/measurement/internal/zzm;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOm:Lcom/google/android/gms/measurement/internal/zzm;

    :cond_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0
.end method

.method public bridge synthetic getContext()Landroid/content/Context;
    .locals 1

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzy;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public isConnected()Z
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzis()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zziE()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab;->zzaOm:Lcom/google/android/gms/measurement/internal/zzm;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected zzAr()V
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zzis()V

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzab;->zziE()V

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzab$3;

    invoke-direct {v0, p0}, Lcom/google/android/gms/measurement/internal/zzab$3;-><init>(Lcom/google/android/gms/measurement/internal/zzab;)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzab;->zzj(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected zzhR()V
    .locals 0

    return-void
.end method

.method public bridge synthetic zzir()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzy;->zzir()V

    return-void
.end method

.method public bridge synthetic zzis()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzy;->zzis()V

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

.method public bridge synthetic zzzn()V
    .locals 0

    invoke-super {p0}, Lcom/google/android/gms/measurement/internal/zzy;->zzzn()V

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
