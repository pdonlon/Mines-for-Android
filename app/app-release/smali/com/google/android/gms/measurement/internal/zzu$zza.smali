.class final Lcom/google/android/gms/measurement/internal/zzu$zza;
.super Ljava/util/concurrent/FutureTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/measurement/internal/zzu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/FutureTask",
        "<TV;>;"
    }
.end annotation


# instance fields
.field private final zzaNH:Ljava/lang/String;

.field final synthetic zzaNI:Lcom/google/android/gms/measurement/internal/zzu;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzu;Ljava/lang/Runnable;Ljava/lang/String;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzu$zza;->zzaNI:Lcom/google/android/gms/measurement/internal/zzu;

    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/lang/Runnable;Ljava/lang/Object;)V

    invoke-static {p3}, Lcom/google/android/gms/common/internal/zzx;->zzw(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p3, p0, Lcom/google/android/gms/measurement/internal/zzu$zza;->zzaNH:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected setException(Ljava/lang/Throwable;)V
    .locals 2
    .parameter "error"

    .prologue
    .local p0, this:Lcom/google/android/gms/measurement/internal/zzu$zza;,"Lcom/google/android/gms/measurement/internal/zzu$zza<TV;>;"
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzu$zza;->zzaNI:Lcom/google/android/gms/measurement/internal/zzu;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzu;->zzyd()Lcom/google/android/gms/measurement/internal/zzp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzp;->zzzK()Lcom/google/android/gms/measurement/internal/zzp$zza;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzu$zza;->zzaNH:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzp$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-super {p0, p1}, Ljava/util/concurrent/FutureTask;->setException(Ljava/lang/Throwable;)V

    return-void
.end method
