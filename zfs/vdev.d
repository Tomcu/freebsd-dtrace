#!/usr/sbin/dtrace -qs


/* 
 * Used for monitoring vdev_cache (per-disk block prefetch)
 *   vdev_cache_read(); Returns 1 on cache hit, errno on miss.
 *   vdev_cache_allocate(); Creates new cache entry in LRU
 *   vdev_cache_write(); Update cache entry on write
 *   vdev_cache_evict(); Evict entry to make room for new...
 *   vdev_cache_purge(); Purge cache.
 */

fbt:zfs:vdev_cache_read:entry
{
	self->io_offset = args[0]->io_offset;
	self->io_size = args[0]->io_size;
	self->vdev_guid = args[0]->io_vd->vdev_guid;
	self->start = timestamp;
}

fbt:zfs:vdev_cache_read:return
/self->io_offset/
{
	printf("%s: %d read %d bytes at offset %d: %s\n", probefunc, self->vdev_guid, self->io_size, self->io_offset, args[1] == 0 ? "HIT" : "MISS"); 
}

