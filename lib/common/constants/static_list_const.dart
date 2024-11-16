class StaticListConst {
  static List<String> get publicMenus => [''];
  static List<String> get officeMenus => [''];
  static List<String> get adminMenus => [
        'Configs App',
        'Manage Users',
        'Manage CMS Mission',
        'Manage CMS TPS',
        'Verification Article',
        'Verification Complaint',
        'Manage Avatar',
        'Manage Achievement',
      ];

  static List<String> get listCategoryArticle => [
        'Terbaru',
        'Popular',
        'Lingkungan Hidup',
        'Pengolahan Sampah',
        'Daur Ulang',
      ];

  static List<String> get listCategoryInformation => [
        'Lingkungan 101',
        'Sampah 101',
        'Daur Ulang 101',
      ];

  static List<String> get listReqImage => [
        'assets/icons/icon_storage.png',
        'assets/icons/icon_camera.png',
        'assets/icons/icon_location.png',
      ];

  static List<String> get listReqTitle => [
        'Akses ke Media',
        'Akses ke Kamera',
        'Akses ke Lokasi',
      ];

  static List<String> get listReqDesc => [
        'Izinkan kami mengakses penyimpanan media untuk menyimpan dokumen/gambar yang di download dari aplikasi.',
        'Izinkan kami mengakses kamera untuk mengambil foto dari complaint yang akan di buat.',
        'Izinkan kami mengakses lokasi untuk menampilkan marker titik titik TPS.',
      ];
}
