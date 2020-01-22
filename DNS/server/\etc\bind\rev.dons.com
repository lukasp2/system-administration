$TTL 864
@   IN  SOA         pri.dons.com. root.dons.com. (
        2018112803  ;Serial
        36          ;Refresh
        18          ;Retry
        6048        ;Expire
        864         ;Minimum TTL
)

@       IN  NS          pri.dons.com.
@       IN  PTR         dons.com.
pri     IN  A           10.0.0.2
2       IN  PTR         pri.dons.com.
3       IN  PTR         client-1.dons.com.
4       IN  PTR         client-2.dons.com.
