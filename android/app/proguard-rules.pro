-keep class androidx.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class com.google.crypto.tink.** { *; }
-keep class com.google.android.material.** { *; }

-keepattributes *Annotation*

# Jangan obfuscate class dengan kode refleksi
-keepclassmembers class ** {
    @javax.annotation.Nullable *;
    @javax.annotation.concurrent.GuardedBy *;
}

# Hapus log dari semua library
-assumenosideeffects class android.util.Log {
    public static int v(...);
    public static int d(...);
    public static int i(...);
    public static int w(...);
    public static int e(...);
}

# Jangan obfuscate metode getter/setter
-keepclassmembers class * {
    void set*(***);
    *** get*();
}


# Tambahan untuk menangani dependency Joda-Time
-dontwarn org.joda.time.**

-dontwarn javax.annotation.**

-dontwarn com.google.api.client.http.GenericUrl
-dontwarn com.google.api.client.http.HttpHeaders
-dontwarn com.google.api.client.http.HttpRequest
-dontwarn com.google.api.client.http.HttpRequestFactory
-dontwarn com.google.api.client.http.HttpResponse
-dontwarn com.google.api.client.http.HttpTransport
-dontwarn com.google.api.client.http.javanet.NetHttpTransport$Builder
-dontwarn com.google.api.client.http.javanet.NetHttpTransport

# Tambahan untuk mencegah peringatan dari Google Play Core
-dontwarn com.google.android.play.core.**