
module.exports =
  services:
    'masson/core/yum':
      config: yum:
        clean: true
        config: proxy: null
        source: "#{__dirname}/offline/centos.repo"
        epel:
          enabled: true
          url: null
          source: "#{__dirname}/offline/epel.repo"
    'masson/core/network':
      config: network:
        ifcfg:
          eth0:
            PEERDNS: 'yes' # Prevent dhcp-client to overwrite /etc/resolv.conf
          eth1:
            PEERDNS: 'yes' # Prevent dhcp-client to overwrite /etc/resolv.conf
    'masson/core/ntp':
      config: ntp:
        fudge: true
    './lib/nebula':
      config: nebula:
        repo: "#{__dirname}/offline/opennebula.repo"
