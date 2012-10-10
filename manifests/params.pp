# Class: heartbeat::params
#
# This class defines default parameters used by the main module class heartbeat
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to heartbeat class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class heartbeat::params {

  $config_file_resources = $::operatingsystem ? {
    default => '/etc/ha.d/haresources',
  }

  $config_file_authkeys = $::operatingsystem ? {
    default => '/etc/ha.d/authkeys',
  }

  $source_resources = ''
  $source_authkeys = ''

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'heartbeat',
  }

  $service = $::operatingsystem ? {
    default => 'heartbeat',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'heartbeat',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'root',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/ha.d',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/ha.d/ha.cf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/heartbeat',
    default                   => '/etc/sysconfig/heartbeat',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/heartbeat/heartbeat.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/var/lib/heartbeat',
  }

  $log_dir = $::operatingsystem ? {
    default => '',
  }

  $log_file = $::operatingsystem ? {
    default => [ '/var/log/ha-log' , '/var/log/ha-debug' ]
  }

  $port = ''
  $protocol = ''

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false

}
