.class public Lcom/google/android/gms/drive/internal/GetChangesRequest;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/drive/internal/GetChangesRequest;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final mVersionCode:I

.field final zzajA:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/drive/DriveSpace;",
            ">;"
        }
    .end annotation
.end field

.field private final zzajB:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/drive/DriveSpace;",
            ">;"
        }
    .end annotation
.end field

.field final zzalA:Lcom/google/android/gms/drive/ChangeSequenceNumber;

.field final zzalB:I

.field final zzalC:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/drive/internal/zzah;

    invoke-direct {v0}, Lcom/google/android/gms/drive/internal/zzah;-><init>()V

    sput-object v0, Lcom/google/android/gms/drive/internal/GetChangesRequest;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(ILcom/google/android/gms/drive/ChangeSequenceNumber;ILjava/util/List;Ljava/util/Set;Z)V
    .locals 0
    .parameter "versionCode"
    .parameter "fromSequenceNumber"
    .parameter "maxResults"
    .parameter
    .parameter
    .parameter "includeUnsubscribed"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/android/gms/drive/ChangeSequenceNumber;",
            "I",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/drive/DriveSpace;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/drive/DriveSpace;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .local p4, spacesList:Ljava/util/List;,"Ljava/util/List<Lcom/google/android/gms/drive/DriveSpace;>;"
    .local p5, spaces:Ljava/util/Set;,"Ljava/util/Set<Lcom/google/android/gms/drive/DriveSpace;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/drive/internal/GetChangesRequest;->mVersionCode:I

    iput-object p2, p0, Lcom/google/android/gms/drive/internal/GetChangesRequest;->zzalA:Lcom/google/android/gms/drive/ChangeSequenceNumber;

    iput p3, p0, Lcom/google/android/gms/drive/internal/GetChangesRequest;->zzalB:I

    iput-object p4, p0, Lcom/google/android/gms/drive/internal/GetChangesRequest;->zzajA:Ljava/util/List;

    iput-object p5, p0, Lcom/google/android/gms/drive/internal/GetChangesRequest;->zzajB:Ljava/util/Set;

    iput-boolean p6, p0, Lcom/google/android/gms/drive/internal/GetChangesRequest;->zzalC:Z

    return-void
.end method

.method constructor <init>(ILcom/google/android/gms/drive/ChangeSequenceNumber;ILjava/util/List;Z)V
    .locals 7
    .parameter "versionCode"
    .parameter "fromSequenceNumber"
    .parameter "maxResults"
    .parameter
    .parameter "includeUnsubscribed"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/android/gms/drive/ChangeSequenceNumber;",
            "I",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/drive/DriveSpace;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .local p4, spacesList:Ljava/util/List;,"Ljava/util/List<Lcom/google/android/gms/drive/DriveSpace;>;"
    if-nez p4, :cond_0

    const/4 v5, 0x0

    :goto_0
    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/drive/internal/GetChangesRequest;-><init>(ILcom/google/android/gms/drive/ChangeSequenceNumber;ILjava/util/List;Ljava/util/Set;Z)V

    return-void

    :cond_0
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5, p4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    goto :goto_0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0
    .parameter "dest"
    .parameter "flags"

    .prologue
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/drive/internal/zzah;->zza(Lcom/google/android/gms/drive/internal/GetChangesRequest;Landroid/os/Parcel;I)V

    return-void
.end method
