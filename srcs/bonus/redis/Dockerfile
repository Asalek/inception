FROM debian:buster

RUN apt-get update && apt install redis-server -y && \
    echo "maxmemory 256mb" >> /etc/redis/redis.conf && \
    echo "maxmemory-policy allkeys-lfu" >> /etc/redis/redis.conf && \
    sed -i "s/bind 127.0.0.1/#bind 127.0.0.0/" /etc/redis/redis.conf && \
    mkdir -p /var/www/html

CMD [ "redis-server",  "--protected-mode", "no" ]

# noeviction: Returns an error when the Redis instance reaches maxmemory. Does not overwrite or evict any data.
# allkeys-lfu: Available in Redis version 4.0, or later. Evicts the least frequently used (LFU) keys from the entire keyset.
# allkeys-lru: Evicts the least recently used (LRU) keys from the entire keyset.
# volatile-lfu: Available in Redis version 4.0, or later. Evicts the least-frequently-used keys that are set with TTL (time to live) expirations.
# volatile-lru: Evicts the least recently used (LRU) keys that are set with TTL expirations.
# allkeys-random: Evicts random keys from the entire keyspace.
# volatile-random: Evicts random keys from among those set with TTL expirations.
# volatile-ttl: Evicts the keys with the shortest TTL from among those set with TTL expirations.
