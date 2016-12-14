class wordpress::web {

  class { 'apache':
    mpm_module => 'prefork',
    default_vhost => false,
  }

  apache::vhost { 'wordpress':
    port     => '80',
    docroot  => '/var/www/wordpress',
  }

  include apache::mod::php

  package {
  "php5-mysql":
    ensure  => present;
  }

}


