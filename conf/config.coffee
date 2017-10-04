
module.exports =
  nikita:
    domain: true
    cache_dir: "#{__dirname}/../cache"
    log_serializer: true
    debug: false
    log_md:
      archive: false
      rotate: true
    ssh:
      private_key: """
      -----BEGIN RSA PRIVATE KEY-----
      MIIEogIBAAKCAQEArBDFt50aN9jfIJ629pRGIMA1fCMb9RyTHt9A+jx3FOsIOtJs
      eaBIpv98drbFVURr+cUs/CrgGVk5k2NIeiz0bG4ONV5nTwx38z5CzqLb7UryZS3i
      a/TS14fWOxvWTRR27R71ePX90G/ZIReKFeTrucw9y9Pl+xAzsmeblRwLBxv/SWBX
      Uai2mHAZaejlG9dGkn9f2n+oPmbgk6krLMCjLhlNBnkdroBNSXGA9ewLPFF4y54Q
      kBqmG3eLzCqAKAzwyJ5PpybtNGAWfN81gY/P5LBzC66WdtEzpwsYAv1wCioqggtg
      xVZN2s0ajxQrCxahRkXstBI2IDcm2qUTxaDbUwIDAQABAoIBAFruOi7AvXxKBhCt
      D6/bx/vC2AEUZM/yG+Wywhn8HkpVsvGzBlR4Wiy208XA7SQUlqNWimFxHyEGQCEd
      1M2MOFedCbE2hI4H3tQTUSb2dhc/Bj5mM0QuC8aPKK3wFh6B9B93vu3/wfSHR03v
      rK/JXLHBt96hyuYVN9zOWDBCs6k7SdQ2BcsQLiPg6feTsZelJDuO+DO65kKLMiz3
      mNPThErklRaKovNk47LSYakk6gsJXrpG6JWQ6nwsRenwplDwZ8Zs9mlRi7f3nChM
      3I1WlISN8y2kcQBQ94YZKk8wzH/lzmxsabcLa5ETNubxQ6ThDu1oYUIIUsQyNPm+
      DkW0VwECgYEA5MttelspKexWS39Y3sQYvZ/v8VZBQl4tRbpUWWc+PNEtcEwOBza/
      H4jBWYd2eWKTApJT1st58E4b34Mv88nQVElLb3sE7uJMkihPyNpABGbCvr63hDYw
      PyL53nKaPelY/aDnL0F8LmREfdKw/uy6+UChgkPfdo2VVk1oyvsZaRMCgYEAwIZ+
      lCmeXQ4mU6uxO+ChhDn7zw9rR5qlCyfJiLPe2lV20vaHV5ZfKIWGegsVJSpFr2ST
      5ghh+FVIneoNRtTHEKwNWCK7I6qeF+WAaci+KsLQigJQHsw58n9cdA7wHHc475n/
      pf7efoPcvk6qYOS2mpDgC87m+o3C4Dyspqp9TMECgYA4/ed+dBjT5Zg1ZDp5+zUC
      f0Wgw1CsPJNgbCK4xnv9YEnGUFuqNlvzefhX2eOMJx7hpBuYRMVSM9LDoYUfYCUx
      6bQNyAIZk2tpePsu2BbcQdC+/PjvySPJhmfhnoCHbYoKW7tazSAm2jkpcoM+bS/C
      CPRyY3/Voz0Q62VwMo5I2wKBgB4mMbZUGieqapgZwASHdeO2DNftKzioYAYyMd5F
      hLWeQqBg2Or/cmFvH5MHH0WVrBn+Xybb0zPHbzrDh1a7RX035FMUBUhdlKpbV1O5
      iwY5Qd0K5a8c/koaZckK+dELXpAvBpjhI8ieL7hhq07HIk1sOJnAye0cvBLPjZ3/
      /uVBAoGAVAs6tFpS0pFlxmg4tfGEm7/aP6FhyBHNhv2QGluw8vv/XVMzUItxGIef
      HcSMWBm08IJMRJLgmoo1cuQv6hBui7JpDeZk/20qoF2oZW9lJ9fdRObJqi61wufP
      BNiriqexq/eTy2uF9RCCjLItWxUscVMlVt4V65HLkCF5WxCQw+o=
      -----END RSA PRIVATE KEY-----
      """
      public_key: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsEMW3nRo32N8gnrb2lEYgwDV8Ixv1HJMe30D6PHcU6wg60mx5oEim/3x2tsVVRGv5xSz8KuAZWTmTY0h6LPRsbg41XmdPDHfzPkLOotvtSvJlLeJr9NLXh9Y7G9ZNFHbtHvV49f3Qb9khF4oV5Ou5zD3L0+X7EDOyZ5uVHAsHG/9JYFdRqLaYcBlp6OUb10aSf1/af6g+ZuCTqSsswKMuGU0GeR2ugE1JcYD17As8UXjLnhCQGqYbd4vMKoAoDPDInk+nJu00YBZ83zWBj8/ksHMLrpZ20TOnCxgC/XAKKiqCC2DFVk3azRqPFCsLFqFGRey0EjYgNybapRPFoNtT Ryba Hadoop'
      root:
        username: 'vagrant'
        private_key_path: "~/.vagrant.d/insecure_private_key"
  services:
    'masson/core/system':
      constraints: tags: 'environment': 'dev'
      config: system:
        selinux: false
        limits: {}
        users: {}
    'masson/core/yum':
      constraints: tags: 'environment': 'dev'
      config: yum:
        update: true
        epel:
          enabled: true
        packages:
          'tree': true, 'git': true, 'htop': false, 'vim': true, 
          'bash-completion': true, 'unzip': true,
          'net-tools': true # Install netstat
          # 'bind-utils': true # Install dig
    'masson/core/ssh':
      constraints: tags: 'environment': 'dev'
      config: ssh:
        banner:
          target: '/etc/banner'
          content: "Welcome to OpenNebula!"
        sshd_config:
          PermitRootLogin: 'without-password'
    'masson/core/ntp':
      constraints: tags: 'environment': 'dev'
      config: ntp:
        servers: ['nebula03.nebula.ryba']
    'masson/core/network':
      constraints: tags: 'environment': 'dev'
      config: network:
        hosts:
          '10.10.10.10': 'repos.ryba ryba'
        hosts_auto: true
        resolv: false
    'masson/core/ssl':
      constraints: tags: 'environment': 'dev'
      config: ssl:
        cacert:
          source: "#{__dirname}/certs/ca.cert.pem"
          local: true
    'masson/commons/mariadb/server':
      constraints: nodes: ['nebula01.nebula.ryba', 'nebula02.nebula.ryba']
      config: mariadb: server:
        current_password: ''
        admin_password: 'Maria123-'
        repl_master: password: 'MariaReqpl123-'
        my_conf: {}
    'masson/commons/mariadb/client':
      constraints: tags: 'environment': 'dev'
    'ryba/incubator/nebula/base':
      config: nebula: base:
        password: "secret"
        private_key: 
          source: './conf/nebula_key/id_rsa'
          local: true
        public_key:
          source: './conf/nebula_key/id_rsa.pub'
          local: true
    'ryba/incubator/nebula/front':
      constraints: nodes: ['nebula01.nebula.ryba']
      config: nebula: front:
        password: "secret"
    'ryba/incubator/nebula/node':
      constraints: nodes: ['nebula02.nebula.ryba', 'nebula03.nebula.ryba']
      config: nebula: node: {}
  nodes:
    'nebula01.nebula.ryba':
      tags:
        'environment': 'dev'
        'role': 'master'
      config:
        ip: '10.10.10.41'
        ssl:
          'cert': source: "#{__dirname}/certs/nebula01.cert.pem", local: true
          'key': source: "#{__dirname}/certs/nebula01.key.pem", local: true
    'nebula02.nebula.ryba':
      tags:
        'environment': 'dev'
        'role': 'master'
      config:
        ip: '10.10.10.42'
        ssl:
          'cert': source: "#{__dirname}/certs/nebula02.cert.pem", local: true
          'key': source: "#{__dirname}/certs/nebula02.key.pem", local: true
    'nebula03.nebula.ryba':
      tags:
        'environment': 'dev'
        'role': 'master'
      config:
        ip: '10.10.10.43'
        ssl:
          'cert': source: "#{__dirname}/certs/nebula03.cert.pem", local: true
          'key': source: "#{__dirname}/certs/nebula03.key.pem", local: true
