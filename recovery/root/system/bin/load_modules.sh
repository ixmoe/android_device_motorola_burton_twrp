#!/system/bin/sh

# Load Device-Specific Modules (Based on Device Variant)
load()
{
    is_fastboot_twrp=$(getprop ro.boot.fastboot)
    if [ ! -z "$is_fastboot_twrp" ]; then
        insmod /vendor/lib/modules/aw8646.ko
        insmod /vendor/lib/modules/aw8695.ko
        insmod /vendor/lib/modules/ets_fps_mmi.ko
        insmod /vendor/lib/modules/focaltech_0flash_mmi.ko
        insmod /vendor/lib/modules/focaltech_mmi.ko
        insmod /vendor/lib/modules/mmi_parallel_charger.ko
        insmod /vendor/lib/modules/nova_0flash_mmi.ko
        insmod /vendor/lib/modules/sensors_class.ko
    else
        mkdir /v
        suffix=$(getprop ro.boot.slot_suffix)
        if [ -z "$suffix" ]; then
            suf=$(getprop ro.boot.slot)
            suffix="_$suf"
        fi
        venpath="/dev/block/mapper/vendor$suffix"
        mount -t ext4 -o ro "$venpath" /v
        mkdir -p /vendor/lib/modules
        cp /v/lib/modules/aw8646.ko /vendor/lib/modules/aw8646.ko
        cp /v/lib/modules/aw8695.ko /vendor/lib/modules/aw8695.ko
        cp /v/lib/modules/ets_fps_mmi.ko /vendor/lib/modules/ets_fps_mmi.ko
        cp /v/lib/modules/focaltech_mmi.ko /vendor/lib/modules/focaltech_mmi.ko
        cp /v/lib/modules/focaltech_0flash_mmi.ko /vendor/lib/modules/focaltech_0flash_mmi.ko
        cp /v/lib/modules/mmi_parallel_charger.ko /vendor/lib/modules/mmi_parallel_charger.ko
        cp /v/lib/modules/nova_0flash_mmi.ko /vendor/lib/modules/nova_0flash_mmi.ko
        cp /v/lib/modules/sensors_class.ko /vendor/lib/modules/sensors_class.ko

        insmod /vendor/lib/modules/aw8646.ko
        insmod /vendor/lib/modules/aw8695.ko
        insmod /vendor/lib/modules/ets_fps_mmi.ko
        insmod /vendor/lib/modules/focaltech_0flash_mmi.ko
        insmod /vendor/lib/modules/focaltech_mmi.ko
        insmod /vendor/lib/modules/mmi_parallel_charger.ko
        insmod /vendor/lib/modules/nova_0flash_mmi.ko
        insmod /vendor/lib/modules/sensors_class.ko
        umount /v
        rmdir /v
    fi
}

load
wait 1

setprop modules.loaded 1

exit 0
