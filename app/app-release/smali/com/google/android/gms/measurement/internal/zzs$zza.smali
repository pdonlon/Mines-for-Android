.class public final Lcom/google/android/gms/measurement/internal/zzs$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/measurement/internal/zzs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "zza"
.end annotation


# instance fields
.field private final zzaNp:J

.field private zzaNq:Z

.field final synthetic zzaNr:Lcom/google/android/gms/measurement/internal/zzs;

.field private zzavc:J

.field private final zzue:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/zzs;Ljava/lang/String;J)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzs$zza;->zzaNr:Lcom/google/android/gms/measurement/internal/zzs;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzx;->zzcr(Ljava/lang/String;)Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzs$zza;->zzue:Ljava/lang/String;

    iput-wide p3, p0, Lcom/google/android/gms/measurement/internal/zzs$zza;->zzaNp:J

    return-void
.end method

.method private zzzX()V
    .locals 4

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzs$zza;->zzaNq:Z

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzs$zza;->zzaNq:Z

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzs$zza;->zzaNr:Lcom/google/android/gms/measurement/internal/zzs;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzs;->zza(Lcom/google/android/gms/measurement/internal/zzs;)Landroid/content/SharedPreferences;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzs$zza;->zzue:Ljava/lang/String;

    iget-wide v2, p0, Lcom/google/android/gms/measurement/internal/zzs$zza;->zzaNp:J

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzs$zza;->zzavc:J

    goto :goto_0
.end method


# virtual methods
.method public get()J
    .locals 2

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzs$zza;->zzzX()V

    iget-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzs$zza;->zzavc:J

    return-wide v0
.end method

.method public set(J)V
    .locals 3
    .parameter "value"

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzs$zza;->zzaNr:Lcom/google/android/gms/measurement/internal/zzs;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzs;->zza(Lcom/google/android/gms/measurement/internal/zzs;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzs$zza;->zzue:Ljava/lang/String;

    invoke-interface {v0, v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iput-wide p1, p0, Lcom/google/android/gms/measurement/internal/zzs$zza;->zzavc:J

    return-void
.end method
