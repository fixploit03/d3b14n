# Instal & Konfigurasi `sudo`

`sudo` adalah perintah yang memberikan izin sementara kepada pengguna biasa untuk menjalankan instruksi administratif atau sistem dengan hak akses penuh sebagai super user (root).

## Instalasi

```bash
# masuk ke user root
su -

# update repositori debian
apt-get update

# instal sudo
apt-get install sudo
```

## Konfigurasi

```bash
# menambahkan user ke dalam group sudo
usermod -aG sudo [nama_user]
```

## Restart Debian

```
reboot
```

## Konfirmasi

```bash
sudo whoami

# masukkan password user (bukan password root)
```

Output:

```
root
```

<div align="right">
  <p>[<a href="https://github.com/fixploit03/Belajar-Debian">Kembali</a>]</p>
</div>
