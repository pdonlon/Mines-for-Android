.class Lcom/google/android/gms/measurement/internal/zzw$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzw;->zza(Lcom/google/android/gms/measurement/internal/EventParcel;Lcom/google/android/gms/measurement/internal/AppMetadata;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaOg:Lcom/google/android/gms/measurement/internal/EventParcel;

.field final synthetic zzaOh:Lcom/google/android/gms/measurement/internal/AppMetadata;

.field final synthetic zzaOi:Lcom/google/android/gms/measurement/internal/zzw;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzw;Lcom/google/android/gms/measurement/internal/EventParcel;Lcom/google/android/gms/measurement/internal/AppMetadata;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzw$1;->zzaOi:Lcom/google/android/gms/measurement/internal/zzw;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzw$1;->zzaOg:Lcom/google/android/gms/measurement/internal/EventParcel;

    iput-object p3, p0, Lcom/google/android/gms/measurement/internal/zzw$1;->zzaOh:Lcom/google/android/gms/measurement/internal/AppMetadata;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzw$1;->zzaOi:Lcom/google/android/gms/measurement/internal/zzw;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzw;->zza(Lcom/google/android/gms/measurement/internal/zzw;)Lcom/google/android/gms/measurement/internal/zzv;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzw$1;->zzaOg:Lcom/google/android/gms/measurement/internal/EventParcel;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzw$1;->zzaOh:Lcom/google/android/gms/measurement/internal/AppMetadata;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzv;->zzb(Lcom/google/android/gms/measurement/internal/EventParcel;Lcom/google/android/gms/measurement/internal/AppMetadata;)V

    return-void
.end method