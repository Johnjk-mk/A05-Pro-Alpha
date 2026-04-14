#!/system/bin/sh
# A05 PRO ALPHA - EXTREME ENGINE v20.0
sleep 15

# 1. SAMSUNG GOS BYPASS
# Stops Samsung from slowing down the game when the phone gets warm
pm disable-user com.samsung.android.game.gos
pm disable-user com.samsung.android.game.gamelab
pm disable-user com.samsung.android.game.mode.performance

# 2. HELIO G85 GPU & CPU LOCK
# Forces the processor to stay at max speed
echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "performance" > /sys/class/kgsl/kgsl-3d0/devfreq/governor
echo "1" > /sys/module/adreno_idler/parameters/adreno_idler_active

# 3. TOUCH RESPONSE & FPS SYNC
# For your 4-finger claw setup
setprop debug.performance.tuning 1
setprop video.accelerate.hw 1
setprop persist.sys.ui.hw 1
setprop windowsmgr.max_events_per_sec 120

# 4. RAM OPTIMIZATION
# Clears the 4GB/6GB RAM so PUBG gets everything
echo "0" > /sys/module/lowmemorykiller/parameters/enable_lmk
sync
echo 3 > /proc/sys/vm/drop_caches

log -t A05_PRO_ALPHA "Extreme Engine Active"
