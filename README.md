# Sparky Bind

Verify Bind installation cookbook on Rocky Linux using Sparky

## Cookbook

<https://docs.rockylinux.org/guides/dns/private_dns_server_using_bind/>

## Report example

```console
[task stdout]
15:04:04 :: Last metadata expiration check: 0:04:10 ago on Thu 02 Oct 2025 02:59:54 PM CDT.
15:04:04 :: Package bind-32:9.16.23-31.el9_6.x86_64 is already installed.
15:04:04 :: Package bind-utils-32:9.16.23-31.el9_6.x86_64 is already installed.
15:04:04 :: Dependencies resolved.
15:04:04 :: Nothing to do.
15:04:04 :: Complete!
15:04:04 :: //
15:04:04 :: // named.conf
15:04:04 :: //
15:04:04 :: // Provided by Red Hat bind package to configure the ISC BIND named(8) DNS
15:04:04 :: // server as a caching only nameserver (as a localhost DNS resolver only).
15:04:04 :: //
15:04:04 :: // See /usr/share/doc/bind*/sample/ for example named configuration files.
15:04:04 :: //
15:04:04 :: 
15:04:04 :: options {
15:04:04 :: #       listen-on port 53 { 127.0.0.1; };
15:04:04 :: #       listen-on-v6 port 53 { ::1; };
15:04:04 ::         directory       "/var/named";
15:04:04 ::         dump-file       "/var/named/data/cache_dump.db";
15:04:04 ::         statistics-file "/var/named/data/named_stats.txt";
15:04:04 ::         memstatistics-file "/var/named/data/named_mem_stats.txt";
15:04:04 ::         secroots-file   "/var/named/data/named.secroots";
15:04:04 ::         recursing-file  "/var/named/data/named.recursing";
15:04:04 ::         allow-query     { localhost; };
15:04:04 :: 
15:04:04 ::         /*
15:04:04 ::          - If you are building an AUTHORITATIVE DNS server, do NOT enable recursion.
15:04:04 ::          - If you are building a RECURSIVE (caching) DNS server, you need to enable
15:04:04 ::            recursion.
15:04:04 ::          - If your recursive DNS server has a public IP address, you MUST enable access
15:04:04 ::            control to limit queries to your legitimate users. Failing to do so will
15:04:04 ::            cause your server to become part of large scale DNS amplification
15:04:04 ::            attacks. Implementing BCP38 within your network would greatly
15:04:04 ::            reduce such attack surface
15:04:04 ::         */
15:04:04 ::         recursion yes;
15:04:04 :: 
15:04:04 ::         dnssec-validation yes;
15:04:04 :: 
15:04:04 ::         managed-keys-directory "/var/named/dynamic";
15:04:04 ::         geoip-directory "/usr/share/GeoIP";
15:04:04 :: 
15:04:04 ::         pid-file "/run/named/named.pid";
15:04:04 ::         session-keyfile "/run/named/session.key";
15:04:04 :: 
15:04:04 ::         /* https://fedoraproject.org/wiki/Changes/CryptoPolicy */
15:04:04 ::         include "/etc/crypto-policies/back-ends/bind.config";
15:04:04 :: };
15:04:04 :: 
15:04:04 :: logging {
15:04:04 ::         channel default_debug {
15:04:04 ::                 file "data/named.run";
15:04:04 ::                 severity dynamic;
15:04:04 ::         };
15:04:04 :: };
15:04:04 :: 
15:04:04 :: zone "." IN {
15:04:04 ::         type hint;
15:04:04 ::         file "named.ca";
15:04:04 :: };
15:04:04 :: 
15:04:04 :: include "/etc/named.rfc1912.zones";
15:04:04 :: include "/etc/named.root.key";
15:04:04 :: 
15:04:04 :: # primary forward and reverse zones
15:04:04 :: //forward zone
15:04:04 :: zone "ourdomain.lan" IN {
15:04:04 ::      type master;
15:04:04 ::      file "ourdomain.lan.db";
15:04:04 ::      allow-update { none; };
15:04:04 ::     allow-query {any; };
15:04:04 :: };
15:04:04 :: //reverse zone
15:04:04 :: zone "1.168.192.in-addr.arpa" IN {
15:04:04 ::      type master;
15:04:04 ::      file "ourdomain.lan.rev";
15:04:04 ::      allow-update { none; };
15:04:04 ::     allow-query { any; };
15:04:04 :: };
15:04:04 :: $TTL 86400
15:04:04 :: @ IN SOA dns-primary.ourdomain.lan. admin.ourdomain.lan. (
15:04:04 ::     2019061800 ;Serial
15:04:04 ::     3600 ;Refresh
15:04:04 ::     1800 ;Retry
15:04:04 ::     604800 ;Expire
15:04:04 ::     86400 ;Minimum TTL
15:04:04 :: )
15:04:04 :: 
15:04:04 :: ;Name Server Information
15:04:04 :: @ IN NS dns-primary.ourdomain.lan.
15:04:04 :: 
15:04:04 :: ;IP for Name Server
15:04:04 :: dns-primary IN A 192.168.1.136
15:04:04 :: 
15:04:04 :: ;A Record for IP address to Hostname
15:04:04 :: wiki IN A 192.168.1.13
15:04:04 :: www IN A 192.168.1.14
15:04:04 :: devel IN A 192.168.1.15
15:04:04 :: $TTL 86400
15:04:04 :: @ IN SOA dns-primary.ourdomain.lan. admin.ourdomain.lan. (
15:04:04 ::     2019061800 ;Serial
15:04:04 ::     3600 ;Refresh
15:04:04 ::     1800 ;Retry
15:04:04 ::     604800 ;Expire
15:04:04 ::     86400 ;Minimum TTL
15:04:04 :: )
15:04:04 :: ;Name Server Information
15:04:04 :: @ IN NS dns-primary.ourdomain.lan.
15:04:04 :: 
15:04:04 :: ;Reverse lookup for Name Server
15:04:04 :: 136 IN PTR dns-primary.ourdomain.lan.
15:04:04 :: 
15:04:04 :: ;PTR Record IP address to HostName
15:04:04 :: 13 IN PTR wiki.ourdomain.lan.
15:04:04 :: 14 IN PTR www.ourdomain.lan.
15:04:04 :: 15 IN PTR devel.ourdomain.lan.


[task stderr]
15:04:19 :: Removed "/etc/systemd/system/multi-user.target.wants/named.service".
15:04:19 :: Created symlink /etc/systemd/system/multi-user.target.wants/named.service → /usr/lib/systemd/system/named.service.
[task run: task.bash - tasks/bind-test]
[task stdout]
15:04:19 :: enabled
15:04:19 :: active
15:04:20 :: ok
15:04:20 :: zone ourdomain.lan/IN: loaded serial 2019061800
15:04:20 :: OK
15:04:20 :: zone 192.168.1.136/IN: loaded serial 2019061800
15:04:20 :: OK
15:04:20 :: 192.168.1.13
15:04:20 :: 192.168.1.14
15:04:20 :: 192.168.1.15
[task check]
```
