# == Class: consul
#
# Full description of class consul here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { consul:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Klynton Jessup <klynton@objectsyndicate.com>
#
# === Copyright
#
# Copyright 2014 Klynton Jessup, unless otherwise noted.
#
class consul {

  $consul_file = 'consul'
  $consul_path = '/usr/local/'
  $consul_version = '0.1.0'
  $consul_os = 'linux'
  $consul_arch = '386'

  file { "$consul_file":
    ensure => file,
    mode => '0755',
    path => '${consul_path}/${consul_file}'
    source => "puppet:///modules/consul/${consul_version}/${consul_os}/${consul_arch}/${consul_file}"
  }

  file { "$consul_path":
    ensure => directory,
    mode => '0644',
  }

}
