# 🏥 Aplikasi Antrian Pasien (Flutter)
Aplikasi Antrian Pasien berbasis Flutter untuk menampilkan daftar antrian pasien, data yang dipakai data Dummy dari API Online.

---

## ✨ Fitur Utama
- 📋 Menampilkan **list antrian pasien**
- 🔍 Filter berdasarkan:
  - **Status** (All, Menunggu, Diproses, Selesai)
  - **Poli** (All, Umum, Gigi, Anak)
- 🔄 **Pull to Refresh**
- ⏳ **Loading overlay** (initial load, filter, refresh)
- 📭 **Empty State** jika data kosong
- ❌ **Error State** dengan pesan ramah pengguna
- 📡 **Offline handling**
- 💾 Penyimpanan filter menggunakan **GetStorage**
- 🎨 UI modern (Material Design)
- 🧩 Widget modular & scalable

---

## 🛠 Teknologi & Package
- Flutter 3.35.7
- State Management: GetX
- HTTP Client: Dio
- Internet Checker: internet_connection_checker
- Local Storage: get_storage


## 📡 Contoh API Data
``` json
[
  {
    "name": "Budi",
    "status": "Menunggu",
    "poly": "Umum"
  },
  {
    "name": "Siti",
    "status": "Diproses",
    "poly": "Gigi"
  }
]
```


## 📄 Lisensi
Project ini bebas digunakan untuk keperluan pembelajaran dan pengembangan.