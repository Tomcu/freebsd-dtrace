#### arc_adjust.v2.d
Shows adjustments to the ARC in realtime. Uses pragma destructive.

#### txg_delay.d
At 10 second intervals the number of writes delayed and throttled.

#### vdev.d
Used for monitoring vdev_cache (per-disk block prefetch)
vdev_cache_read(); Returns 1 on cache hit, errno on miss.

#### zfsio.d
This script will show read/write IOPs and throughput for ZFS filesystems and zvols on a per-dataset basis. It can be used to estimate which dataset is causing the most I/O load on the current system. It should  only be used for comparative analysis.
Note: Currently emits a lot of errors

#### ziolatency.d
Trace I/O latency on a per-vdev basis.
