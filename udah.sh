clear
echo "+-------------------------------------------------------------------+"
echo "+ Sebelum Memulai Compile Kernelnya Jawab Dulu Yak Pertanyaannya :D +"
echo "+-------------------------------------------------------------------+"
echo " [?] Dimana Kamu Menyimpan Source Kernel ?                           "
read dimana
cd $dimana
echo " [?] Silahkan Masukan Pilihan Anda [arm/arm64] ?                     "
read pilih
export ARCH=$pilih
echo " Masukan Nama User "
read user
export KBUILD_BUILD_USER=$user
echo " Masukan Nama Host "
read host
export KBUILD_BUILD_HOST=$host
echo " Dimana Kamu Menyimpan Toolchainnya ? "
read toolchain
export CROSS_COMPILE=$toolchain
echo " Membersihkan Sampah File Di /arch/arm64/boot "
make clean && make mrproper
echo " Defconfig yang akan kamu gunakan "
read defconfig
echo " Mengkonfigurasi Kernel . . . "
make $defconfig
echo " Mengkompil Kernel . . . "
echo " Di Bagian Sini Mending Ditinggal Tidur Soalnya Bakalan Lama Bet Sekitar +- 2 Jam lah "
make -j4
echo " Udah Selesai Nih Bro Ambil Image/zImage nya di Arch/arm64/boot "
echo " Kalo Ada Ya Sukses Kalo Ga Ada Ya Gagal, Dah Gitu Aja "
echo " Perkenalkan Namaku $nama. Aku adalah seorang jones yang berumur $umur tahun. Aku Tinggal di $tinggal. Saat ini aku memiliki sebuah Smartphone $smartphone. Aku build kernel untuk $tujuan"
echo " $user@$host "
