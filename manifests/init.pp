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
class consul (
    $bootstrap               = $consul::params::boostrap
    $bind_addr               = $consul::params::bind_addr
    $client_addr             = $consul::params::client_addr
    $datacenter              = $consul::params::datacenter
    $data_dir                = $consul::params::data_dir
    $log_level               = $consul::params::log_level
    $node_name               = $consul::params::node_name
    $protocol                = $consul::params::protocol
    $server                  = $consul::params::server
    $advertise_addr          = $consul::params::advertise_addr
    $ca_file                 = $consul::params::ca_file
    $cert_file               = $consul::params::cert_file
    $domain                  = $consul::params::domain
    $enable_debug            = $consul::params::enable_debug
    $encrypt                 = $consul::params::encrypt
    $key_file                = $consul::params::key_file
    $leave_on_terminate      = $consul::params::leave_on_terminate
    $ports                   = $consul::params::ports
    $dns                     = $consul::params::dns
    $http                    = $consul::params::http
    $rpc                     = $consul::params::rpc
    $serf_lan                = $consul::params::serf_lan
    $serf_wan                = $consul::params::serf_wan
    $server                  = $consul::params::server
    $recursor                = $consul::params::recursor
    $skip_leave_on_interrupt = $consul::params::skip_leave_on_interrupt
    $start_join              = $consul::params::start_join
    $statsite_addr           = $consul::params::statsite_addr
    $verify_incoming         = $consul::params::verify_incoming
    $verify_outgoing         = $consul::params::verify_outgoing
  ) inherits consul::params {

  File {
    mode => '0644'
  }

  $consul_file = 'consul'
  $consul_path = '/usr/local/bin'
  $consul_version = '0.1.0'
  $consul_os = 'linux'
  $consul_arch = '386'
  $consul_config_dir = '/etc/consul.d'
  $consul_state_dir = '/opt/consul'



  file { "$consul_file":
    ensure => file,
    mode   => '0755',
    path   => '${consul_path}/${consul_file}'
    source => "puppet:///modules/consul/${consul_version}/${consul_os}/${consul_arch}/${consul_file}"
  }

  file { "$consul_path":
    ensure => directory,
  }

  file { "$consul_config_dir":
    ensure => directory,
  }

  file { "$consul_state_dir":
    ensure => directory,
  }

}
