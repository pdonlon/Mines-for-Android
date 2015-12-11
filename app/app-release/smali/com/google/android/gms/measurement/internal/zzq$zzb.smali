.class Lcom/google/android/gms/measurement/internal/zzq$zzb;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/measurement/internal/zzq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "zzb"
.end annotation


# instance fields
.field private final zzaMY:Lcom/google/android/gms/measurement/internal/zzq$zza;

.field private final zzaMZ:Ljava/lang/Throwable;

.field private final zzaNa:[B

.field private final zzys:I


# direct methods
.method private constructor <init>(Lcom/google/android/gms/measurement/internal/zzq$zza;ILjava/lang/Throwable;[B)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzq$zzb;->zzaMY:Lcom/google/android/gms/measurement/internal/zzq$zza;

    iput p2, p0, Lcom/google/android/gms/measurement/internal/zzq$zzb;->zzys:I

    iput-object p3, p0, Lcom/google/android/gms/measurement/internal/zzq$zzb;->zzaMZ:Ljava/lang/Throwable;

    iput-object p4, p0, Lcom/google/android/gms/measurement/internal/zzq$zzb;->zzaNa:[B

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/measurement/internal/zzq$zza;ILjava/lang/Throwable;[BLcom/google/android/gms/measurement/internal/zzq$1;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/measurement/internal/zzq$zzb;-><init>(Lcom/google/android/gms/measurement/internal/zzq$zza;ILjava/lang/Throwable;[B)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzq$zzb;->zzaMY:Lcom/google/android/gms/measurement/internal/zzq$zza;

    iget v1, p0, Lcom/google/android/gms/measurement/internal/zzq$zzb;->zzys:I

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzq$zzb;->zzaMZ:Ljava/lang/Throwable;

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zzq$zzb;->zzaNa:[B

    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zza(ILjava/lang/Throwable;[B)V

    return-void
.end method
