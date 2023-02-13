#!/usr/bin/with-contenv bash
# shellcheck disable=2154

rm -rf "$mount_point"
mkdir -p "$mount_point"
chown -R abc:abc "$mount_point"

exec s6-setuidgid abc rclone --config /tmp/rclone.conf mount --allow-other "$remote_name" "$mount_point"  --vfs-read-chunk-size=64k --poll-interval=1h  --dir-cache-time=2h --buffer-size=0 --cache-dir /tmp/rclone --vfs-cache-mode full --no-checksum --no-modtime --vfs-read-wait 0 --max-read-ahead 0 --use-mmap --fast-list --cache-dir /tmp/rclone/ --checkers 2  --no-check-certificate  --multi-thread-cutoff 0 --multi-thread-streams 2 --vfs-cache-max-age 10000h -q --use-cookies
