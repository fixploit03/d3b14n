# Konfigurasi PATH Environment Variable

Konfigurasi PATH Environment Variable adalah pengaturan daftar direktori sistem agar shell dapat menemukan dan menjalankan perintah atau tools secara langsung dari lokasi mana pun tanpa perlu mengetik alamat lengkap filenya.

## Langkah-Langkah

### 1. Buat Script Bash

```
sudo nano /etc/profile.d/set-path.sh
```

Isi dengan:

```
export PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
```

### 2. Save & Keluar

Tekan `CTRL+X`, `Y` lalu `Enter`.

### 3. Re-load PATH

```
source /etc/profile
```

### 4. Konfirmasi

```
iwconfig
```

Output

```
lo        no wireless extensions.

enp0s3    no wireless extensions.
```

<div align="right">
  <p>[<a href="https://github.com/fixploit03/Belajar-Debian/">Kembali</a>]</p>
</div>
