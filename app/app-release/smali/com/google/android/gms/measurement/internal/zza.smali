.class Lcom/google/android/gms/measurement/internal/zza;
.super Ljava/lang/Object;


# instance fields
.field final zzaLK:Ljava/lang/String;

.field final zzaLL:Ljava/lang/String;

.field final zzaLM:Ljava/lang/String;

.field final zzaLN:J

.field final zzaLO:J

.field final zzaLl:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzcr(Ljava/lang/String;)Ljava/lang/String;

    const-wide/16 v0, 0x0

    cmp-long v0, p5, v0

    if-ltz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzaa(Z)V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLl:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLK:Ljava/lang/String;

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p3, 0x0

    :cond_0
    iput-object p3, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLL:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLM:Ljava/lang/String;

    iput-wide p5, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLN:J

    iput-wide p7, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLO:J

    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public zzG(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zza;
    .locals 10

    new-instance v1, Lcom/google/android/gms/measurement/internal/zza;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLl:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLL:Ljava/lang/String;

    iget-wide v6, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLN:J

    iget-wide v8, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLO:J

    move-object v3, p1

    move-object v5, p2

    invoke-direct/range {v1 .. v9}, Lcom/google/android/gms/measurement/internal/zza;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V

    return-object v1
.end method

.method public zza(Lcom/google/android/gms/measurement/internal/zzp;J)Lcom/google/android/gms/measurement/internal/zza;
    .locals 10

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzw(Ljava/lang/Object;)Ljava/lang/Object;

    iget-wide v0, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLN:J

    const-wide/16 v2, 0x1

    add-long v6, v0, v2

    const-wide/32 v0, 0x7fffffff

    cmp-long v0, v6, v0

    if-lez v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzp;->zzzL()Lcom/google/android/gms/measurement/internal/zzp$zza;

    move-result-object v0

    const-string v1, "Bundle index overflow"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzp$zza;->zzec(Ljava/lang/String;)V

    const-wide/16 v6, 0x0

    :cond_0
    new-instance v1, Lcom/google/android/gms/measurement/internal/zza;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLl:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLK:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLL:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLM:Ljava/lang/String;

    move-wide v8, p2

    invoke-direct/range {v1 .. v9}, Lcom/google/android/gms/measurement/internal/zza;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V

    return-object v1
.end method

.method public zzdY(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zza;
    .locals 10

    new-instance v1, Lcom/google/android/gms/measurement/internal/zza;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLl:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLK:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLM:Ljava/lang/String;

    iget-wide v6, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLN:J

    iget-wide v8, p0, Lcom/google/android/gms/measurement/internal/zza;->zzaLO:J

    move-object v4, p1

    invoke-direct/range {v1 .. v9}, Lcom/google/android/gms/measurement/internal/zza;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V

    return-object v1
.end method
