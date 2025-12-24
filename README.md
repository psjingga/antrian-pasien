# 🏥 Aplikasi Antrian Pasien (Flutter)
Aplikasi Antrian Pasien berbasis Flutter untuk menampilkan daftar antrian pasien.


## ✨ Fitur Utama
📋 Menampilkan list antrian pasien
🔍 Filter berdasarkan:
    - Status (All, Menunggu, Diproses, Selesai)
    - Poli (All, Umum, Gigi, Anak)
🔄 Pull to Refresh
⏳ Loading overlay (termasuk saat filter & refresh)
📭 Empty State jika data kosong
❌ Error State dengan pesan ramah pengguna
📡 Offline handling (cek koneksi internet)
💾 Penyimpanan filter menggunakan GetStorage
🎨 UI modern (Material Design)
🧩 Struktur widget modular & scalable


## 🛠 Teknologi & Package
- Flutter 3.35.7
- State Management: GetX
- HTTP Client: Dio
- Internet Checker: internet_connection_checker
- Local Storage: get_storage
