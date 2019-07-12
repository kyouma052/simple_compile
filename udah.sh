clear
# color
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White
nocol='\033[0m'         # Default
WAKTU=$(date)
BUILD_START=$(date +"%s")
echo "+----------------------------------------+"----"++++++++++++++++++++++++++++++++"
echo "+         KernelCompiler v2.39           +"----"+                              +"
echo "+----------------------------------------+"----"+     ##################       +++++++++"
echo "+ Author By   : Kyouma052                +"----"+     #              # #              +  +"
echo "+ Build By    : KyoumaDevTeam            +"----"+     #    #############       +++++++++"
echo "+ Build Date  : Mon, 10 Jun 22:09:52 WIB +"----"+     #    #                   +"
echo "+ Last Update : Tue, 11 Jun 13:25:03 WIB +"----"+     ######                   +"
echo "+----------------------------------------+"----"++++++++++++++++++++++++++++++++"
echo "+ Waktu : $WAKTU                                                               +"
echo "+------------------------------------------------------------------------------+"
echo "+                             Memulai Compile Kernel                           +"
echo "+------------------------------------------------------------------------------+"
echo "+ [?] Dimana Kamu Menyimpan Source Kernel ?                                    +"
read dimana
cd $dimana
echo "+ [?] Silahkan Masukan Pilihan Anda [arm/arm64] ?                              +"
read pilih
export ARCH=$pilih
echo "+ [?] Masukan Nama User                                                        +"
read user
export KBUILD_BUILD_USER=$user
echo "+ [?] Masukan Nama Host                                                        +"
read host
export KBUILD_BUILD_HOST=$host
echo "+ [?] Dimana Kamu Menyimpan Toolchainnya ?                                     +"
read toolchain
export CROSS_COMPILE=$toolchain
echo "+ [X] Membersihkan Sampah File Di /arch/$pilih/boot                            +"
make clean && make mrproper
ls $dimana/arch/$pilih/configs/
echo "+ [?] Pilih Defconfig Yang Tersedia ?                                          +"
read defconfig
echo "+ [X] Mengkonfigurasi Kernel . . .                                             +"
make $defconfig
echo "+ [X] Mengcompile Kernel . . .                                                 +"
make -j4
echo "+ [X] Membuat dtb.img . . .                                                    +"
scripts/dtbToolCM -o arch/$pilih/boot/dtb.img -s 2048 -p scripts/dtc/ arch/$pilih/boot/dts/
echo "+------------------------------------------------------------------------------+"
echo "+ [N] Dah Selesai Nih Bro Ambil Image/zImage nya di Arch/$pilih/boot           +"
echo "+ [N] Kalo Ada Ya Sukses Kalo Ga Ada Ya Gagal - Dah Ah Males Mau Beli Truck    +"
echo "+------------------------------------------------------------------------------+"
BUILD_END=$(date +"%s")
DIFF=$(($BUILD_END - $BUILD_START))
echo "+ $Red                                                                         +++++++++++++++++++++++++++++ +"
echo "+ $Green - Build Kernel Selesai Dalam Waktu $Blue $(($DIFF / 60)) Menit $(($DIFF % 60)) Detik.$nocol         +"
echo "+ $Red                                                                                                       +"
echo "+ $Green - Compiled kernel version : $Blue $(strings arch/$pilih/boot/Image | grep 'Linux version') $nocol   +"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
