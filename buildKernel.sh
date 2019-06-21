#!/system/bin/sh
echo "SET VARIABLE...!!!!";
kernel_path=$PWD/kernel_pbh/X00TD/
defconfigOK=X00T_defconfig
clear

echo "SETTING PATH....!!!!";
sleep 5
clear;
export ARCH=arm64 
&&
export CROSS_COMPILE=$PWD/ZB601KL_S340_kernel_code/kernel/aarch64-linux-android-4.9/bin/aarch64-linux-android- 
&&
export CROSS_COMPILE_ARM32=$PWD/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
sleep 5;
clear;


echo "=============== Menu ============"
echo ""
echo " (1.   Using Defconfig"
echo " (2.	 Just Compile It"
echo " (3.	 Open Menu Config"
echo ""
echo "=============== Menu ============"
while :
do
  read input
  case $input in
	1)
		echo "OK... USING DEFCONFIG sir....";
		cd kernel_path
		make clean
		make mrproper
		make $defconfigOK
		;;
	2)
		echo "OK sir.... JUST COMPILE IT.....";
		cd $kernel_path
		sleep 5
		make -j7
		break
		;;
	3)
		echo "Open Menu Config Kernel...!!!";
		cd $kernel_path
		sleep 5
		make menuconfig
		break
		;;
	*)
		clear
		echo "Sorry, I don't understand";

		;;
  esac
done
