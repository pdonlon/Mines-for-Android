.class public Lcom/google/android/gms/drive/realtime/internal/event/ValuesSetDetails;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/drive/realtime/internal/event/ValuesSetDetails;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final mIndex:I

.field final mVersionCode:I

.field final zzaoF:I

.field final zzaoG:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/drive/realtime/internal/event/zzk;

    invoke-direct {v0}, Lcom/google/android/gms/drive/realtime/internal/event/zzk;-><init>()V

    sput-object v0, Lcom/google/android/gms/drive/realtime/internal/event/ValuesSetDetails;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(IIII)V
    .locals 0
    .parameter "versionCode"
    .parameter "index"
    .parameter "valueIndex"
    .parameter "valueCount"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/drive/realtime/internal/event/ValuesSetDetails;->mVersionCode:I

    iput p2, p0, Lcom/google/android/gms/drive/realtime/internal/event/ValuesSetDetails;->mIndex:I

    iput p3, p0, Lcom/google/android/gms/drive/realtime/internal/event/ValuesSetDetails;->zzaoF:I

    iput p4, p0, Lcom/google/android/gms/drive/realtime/internal/event/ValuesSetDetails;->zzaoG:I

    return-void
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
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/drive/realtime/internal/event/zzk;->zza(Lcom/google/android/gms/drive/realtime/internal/event/ValuesSetDetails;Landroid/os/Parcel;I)V

    return-void
.end method
