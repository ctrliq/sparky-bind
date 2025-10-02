# Check nsd is enabled and running
sudo systemctl is-enabled named
sudo systemctl is-active named

# Check syntax of named.conf
sudo named-checkconf || echo error && echo ok
sudo named-checkzone ourdomain.lan /var/named/ourdomain.lan.db
sudo named-checkzone 192.168.1.136 /var/named/ourdomain.lan.rev

# Check individual records using dig command
dig a @127.0.0.1 +short wiki.ourdomain.lan
dig a @127.0.0.1 +short www.ourdomain.lan
dig a @127.0.0.1 +short devel.ourdomain.lan
