.class Lcom/google/android/gms/measurement/internal/zzab$zza$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzab$zza;->onConnectionSuspended(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaOw:Lcom/google/android/gms/measurement/internal/zzab$zza;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzab$zza;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzab$zza$4;->zzaOw:Lcom/google/android/gms/measurement/internal/zzab$zza;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzab$zza$4;->zzaOw:Lcom/google/android/gms/measurement/internal/zzab$zza;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzab$zza;->zzaOs:Lcom/google/android/gms/measurement/internal/zzab;

    new-instance v1, Landroid/content/ComponentName;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzab$zza$4;->zzaOw:Lcom/google/android/gms/measurement/internal/zzab$zza;

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzab$zza;->zzaOs:Lcom/google/android/gms/measurement/internal/zzab;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzab;->getContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/google/android/gms/measurement/AppMeasurementService;

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/measurement/internal/zzab;->zza(Lcom/google/android/gms/measurement/internal/zzab;Landroid/content/ComponentName;)V

    return-void
.end method
