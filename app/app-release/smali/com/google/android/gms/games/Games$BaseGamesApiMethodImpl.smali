.class public abstract Lcom/google/android/gms/games/Games$BaseGamesApiMethodImpl;
.super Lcom/google/android/gms/internal/zzlb$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/games/Games;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "BaseGamesApiMethodImpl"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R::",
        "Lcom/google/android/gms/common/api/Result;",
        ">",
        "Lcom/google/android/gms/internal/zzlb$zza",
        "<TR;",
        "Lcom/google/android/gms/games/internal/GamesClientImpl;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .locals 1
    .parameter "googleApiClient"

    .prologue
    .local p0, this:Lcom/google/android/gms/games/Games$BaseGamesApiMethodImpl;,"Lcom/google/android/gms/games/Games$BaseGamesApiMethodImpl<TR;>;"
    sget-object v0, Lcom/google/android/gms/games/Games;->zzRk:Lcom/google/android/gms/common/api/Api$zzc;

    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/internal/zzlb$zza;-><init>(Lcom/google/android/gms/common/api/Api$zzc;Lcom/google/android/gms/common/api/GoogleApiClient;)V

    return-void
.end method
