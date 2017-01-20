max_stale = "2m"

template {
  source = "/root/amavisd.conf.template"
  destination = "/etc/amavisd.conf"
}

exec {
  command = "amavisd -c /etc/amavisd.conf foreground"
  splay = "60s"
}
