.class Lcom/google/android/gms/measurement/internal/zzab$zza$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzab$zza;->onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaOv:Lcom/google/android/gms/measurement/internal/zzm;

.field final synthetic zzaOw:Lcom/google/android/gms/measurement/internal/zzab$zza;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzab$zza;Lcom/google/android/gms/measurement/internal/zzm;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzab$zza$1;->zzaOw:Lcom/google/android/gms/measurement/internal/zzab$zza;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzab$zza$1;->zzaOv:Lcom/google/android/gms/measurement/internal/zzm;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab$zza$1;->zzaOw:Lcom/google/android/gms/measurement/internal/zzab$zza;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzab$zza;->zzaOs:Lcom/google/android/gms/measurement/internal/zzab;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzab;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab$zza$1;->zzaOw:Lcom/google/android/gms/measurement/internal/zzab$zza;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzab$zza;->zzaOs:Lcom/google/android/gms/measurement/internal/zzab;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzab;->zzyd()Lcom/google/android/gms/measurement/internal/zzp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzp;->zzzP()Lcom/google/android/gms/measurement/internal/zzp$zza;

    move-result-object v0

    const-string v1, "Connected to service"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzp$zza;->zzec(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab$zza$1;->zzaOw:Lcom/google/android/gms/measurement/internal/zzab$zza;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzab$zza;->zzaOs:Lcom/google/android/gms/measurement/internal/zzab;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzab$zza$1;->zzaOv:Lcom/google/android/gms/measurement/internal/zzm;

    invoke-static {v0, v1}, Lcom/google/android/gms/measurement/internal/zzab;->zza(Lcom/google/android/gms/measurement/internal/zzab;Lcom/google/android/gms/measurement/internal/zzm;)V

    :cond_0
    return-void
.end method
