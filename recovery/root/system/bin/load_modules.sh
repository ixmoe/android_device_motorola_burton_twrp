#!/system/bin/sh

# touch_class_path=/sys/class/touchscreen
# touch_path=
# firmware_path=/vendor/firmware
# firmware_file=
# device=$(getprop ro.boot.device)

# Load Device-Specific Modules (Based on Device Variant)
load()
{
    is_fastboot_twrp=$(getprop ro.boot.fastboot)
    if [ ! -z "$is_fastboot_twrp" ]; then
        insmod /vendor/lib/modules/sensors_class.ko
        insmod /vendor/lib/modules/mmi_annotate.ko
        insmod /vendor/lib/modules/mmi_info.ko
        insmod /vendor/lib/modules/mmi_sys_temp.ko
        insmod /vendor/lib/modules/aw8697.ko
        insmod /vendor/lib/modules/touchscreen_mmi.ko
        insmod /vendor/lib/modules/sec_mmi.ko
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
        cp /v/lib/modules/aw8697.ko /vendor/lib/modules/aw8697.ko
        cp /v/lib/modules/sec_mmi.ko /vendor/lib/modules/sec_mmi.ko
        cp /v/lib/modules/sensors_class.ko /vendor/lib/modules/sensors_class.ko
        cp /v/lib/modules/touchscreen_mmi.ko /vendor/lib/modules/touchscreen_mmi.ko
        cp /v/lib/modules/mmi_info.ko /vendor/lib/modules/mmi_info.ko
        cp /v/lib/modules/mmi_annotate.ko /vendor/lib/modules/mmi_annotate.ko
        cp /v/lib/modules/mmi_sys_temp.ko /vendor/lib/modules/mmi_sys_temp.ko


        insmod /vendor/lib/modules/sensors_class.ko
        insmod /vendor/lib/modules/mmi_annotate.ko
        insmod /vendor/lib/modules/mmi_info.ko
        insmod /vendor/lib/modules/mmi_sys_temp.ko
        insmod /vendor/lib/modules/aw8697.ko
        insmod /vendor/lib/modules/touchscreen_mmi.ko
        insmod /vendor/lib/modules/sec_mmi.ko
        umount /v
        rmdir /v
    fi
}

load
wait 1

setprop modules.loaded 1

exit 0
