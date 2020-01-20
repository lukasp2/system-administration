$TTL 864
@   IN  SOA          pri.dons.com. root.dons.com. (
        2018112805  ;Serial
        36          ;Refresh
        18          ;Retry
        6048        ;Expire
        864         ;Minimum TTL
)

@       IN  NS      pri.dons.com.
@       IN  A       10.0.0.2
pri     IN  A       10.0.0.2
server  IN  A       10.0.0.2
client-1  IN  A     10.0.0.4
client-2  IN  A     10.0.0.3
