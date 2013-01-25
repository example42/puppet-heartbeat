# = Class: heartbeat
#
# This is the main heartbeat class
#
#
# == Parameters
# Module's specific variables
#
# [*config_file_haresources*]
#   Path of of haresources file
#
# [*source_haresources*]
#   Custom source file for the haresources file
#
# [*template_haresources*]
#   Custom template file for the haresources file
#   Note: source_haresources and template_haresources are alternative
#
# [*config_file_authkeys*]
#   Path of of authkeys file
#
# [*source_authkeys*]
#   Custom source file for the authkeys file
#
# [*template_authkeys*]
#   Custom template file for the authkeys file
#   Note: source_authkeys and template_authkeys are alternative
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, heartbeat class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $heartbeat_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, heartbeat main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $heartbeat_source
#
# [*source_dir*]
#   If defined, the whole heartbeat configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $heartbeat_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $heartbeat_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, heartbeat main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $heartbeat_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $heartbeat_options
#
# [*service_autorestart*]
#   Automatically restarts the heartbeat service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $heartbeat_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $heartbeat_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $heartbeat_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $heartbeat_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for heartbeat checks
#   Can be defined also by the (top scope) variables $heartbeat_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $heartbeat_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $heartbeat_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $heartbeat_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $heartbeat_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for heartbeat port(s)
#   Can be defined also by the (top scope) variables $heartbeat_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling heartbeat. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $heartbeat_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $heartbeat_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $heartbeat_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $heartbeat_audit_only
#   and $audit_only
#
# Default class params - As defined in heartbeat::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of heartbeat package
#
# [*service*]
#   The name of heartbeat service
#
# [*service_status*]
#   If the heartbeat service init script supports status argument
#
# [*process*]
#   The name of heartbeat process
#
# [*process_args*]
#   The name of heartbeat arguments. Used by puppi and monitor.
#   Used only in case the heartbeat process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user heartbeat runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $heartbeat_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $heartbeat_protocol
#
#
# == Examples
#
# You can use this class in 2 ways:
# - Set variables (at top scope level on in a ENC) and "include heartbeat"
# - Call heartbeat as a parametrized class
#
# See README for details.
#
#
# == Author
#   Alessandro Franceschi <al@lab42.it/>
#
class heartbeat (
  $config_file_haresources = params_lookup( 'config_file_haresources' ),
  $source_haresources      = params_lookup( 'source_haresources' ),
  $template_haresources    = params_lookup( 'template_haresources' ),
  $config_file_authkeys    = params_lookup( 'config_file_authkeys' ),
  $source_authkeys         = params_lookup( 'source_authkeys' ),
  $template_authkeys       = params_lookup( 'template_authkeys' ),
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template            = params_lookup( 'template' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $port                = params_lookup( 'port' ),
  $protocol            = params_lookup( 'protocol' )
  ) inherits heartbeat::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)

  ### Definition of some variables used in the module
  $manage_package = $heartbeat::bool_absent ? {
    true  => 'absent',
    false => $heartbeat::version,
  }

  $manage_service_enable = $heartbeat::bool_disableboot ? {
    true    => false,
    default => $heartbeat::bool_disable ? {
      true    => false,
      default => $heartbeat::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $heartbeat::bool_disable ? {
    true    => 'stopped',
    default =>  $heartbeat::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $heartbeat::bool_service_autorestart ? {
    true    => Service[heartbeat],
    false   => undef,
  }

  $manage_file = $heartbeat::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $heartbeat::bool_absent == true
  or $heartbeat::bool_disable == true
  or $heartbeat::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $heartbeat::bool_absent == true
  or $heartbeat::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $heartbeat::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $heartbeat::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $heartbeat::source ? {
    ''        => undef,
    default   => $heartbeat::source,
  }

  $manage_file_content = $heartbeat::template ? {
    ''        => undef,
    default   => template($heartbeat::template),
  }

  $manage_file_source_haresources = $heartbeat::source_haresources ? {
    ''        => undef,
    default   => $heartbeat::source_haresources,
  }

  $manage_file_content_haresources = $heartbeat::template_haresources ? {
    ''        => undef,
    default   => template($heartbeat::template_haresources),
  }

  $manage_file_source_authkeys = $heartbeat::source_authkeys ? {
    ''        => undef,
    default   => $heartbeat::source_authkeys,
  }

  $manage_file_content_authkeys = $heartbeat::template_authkeys ? {
    ''        => undef,
    default   => template($heartbeat::template_authkeys),
  }


  ### Managed resources
  package { $heartbeat::package:
    ensure => $heartbeat::manage_package,
  }

  service { 'heartbeat':
    ensure     => $heartbeat::manage_service_ensure,
    name       => $heartbeat::service,
    enable     => $heartbeat::manage_service_enable,
    hasstatus  => $heartbeat::service_status,
    pattern    => $heartbeat::process,
    require    => Package[$heartbeat::package],
  }

  file { 'heartbeat.conf':
    ensure  => $heartbeat::manage_file,
    path    => $heartbeat::config_file,
    mode    => $heartbeat::config_file_mode,
    owner   => $heartbeat::config_file_owner,
    group   => $heartbeat::config_file_group,
    require => Package[$heartbeat::package],
    notify  => $heartbeat::manage_service_autorestart,
    source  => $heartbeat::manage_file_source,
    content => $heartbeat::manage_file_content,
    replace => $heartbeat::manage_file_replace,
    audit   => $heartbeat::manage_audit,
  }

  if $heartbeat::source_haresources
  or $heartbeat::template_haresources {
    file { 'haresources':
      ensure  => $heartbeat::manage_file,
      path    => $heartbeat::config_file_haresources,
      mode    => $heartbeat::config_file_mode,
      owner   => $heartbeat::config_file_owner,
      group   => $heartbeat::config_file_group,
      require => Package[$heartbeat::package],
      notify  => $heartbeat::manage_service_autorestart,
      source  => $heartbeat::manage_file_source_haresources,
      content => $heartbeat::manage_file_content_haresources,
      replace => $heartbeat::manage_file_replace,
      audit   => $heartbeat::manage_audit,
    }
  }

  if $heartbeat::source_authkeys
  or $heartbeat::template_authkeys {
    file { 'authkeys':
      ensure  => $heartbeat::manage_file,
      path    => $heartbeat::config_file_authkeys,
      mode    => '0600',
      owner   => $heartbeat::config_file_owner,
      group   => $heartbeat::config_file_group,
      require => Package[$heartbeat::package],
      notify  => $heartbeat::manage_service_autorestart,
      source  => $heartbeat::manage_file_source_authkeys,
      content => $heartbeat::manage_file_content_authkeys,
      replace => $heartbeat::manage_file_replace,
      audit   => $heartbeat::manage_audit,
    }
  }

  # The whole heartbeat configuration directory can be recursively overriden
  if $heartbeat::source_dir {
    file { 'heartbeat.dir':
      ensure  => directory,
      path    => $heartbeat::config_dir,
      require => Package[$heartbeat::package],
      notify  => $heartbeat::manage_service_autorestart,
      source  => $heartbeat::source_dir,
      recurse => true,
      purge   => $heartbeat::bool_source_dir_purge,
      replace => $heartbeat::manage_file_replace,
      audit   => $heartbeat::manage_audit,
    }
  }


  ### Include custom class if $my_class is set
  if $heartbeat::my_class {
    include $heartbeat::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $heartbeat::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'heartbeat':
      ensure    => $heartbeat::manage_file,
      variables => $classvars,
      helper    => $heartbeat::puppi_helper,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $heartbeat::bool_monitor == true {
    if $heartbeat::port != '' {
      monitor::port { "heartbeat_${heartbeat::protocol}_${heartbeat::port}":
        protocol => $heartbeat::protocol,
        port     => $heartbeat::port,
        target   => $heartbeat::monitor_target,
        tool     => $heartbeat::monitor_tool,
        enable   => $heartbeat::manage_monitor,
      }
    }
    if $heartbeat::service != '' {
      monitor::process { 'heartbeat_process':
        process  => $heartbeat::process,
        service  => $heartbeat::service,
        pidfile  => $heartbeat::pid_file,
        user     => $heartbeat::process_user,
        argument => $heartbeat::process_args,
        tool     => $heartbeat::monitor_tool,
        enable   => $heartbeat::manage_monitor,
      }
    }
  }

  ### Firewall management, if enabled ( firewall => true )
  if $heartbeat::bool_firewall == true and $heartbeat::port != '' {
    firewall { "heartbeat_${heartbeat::protocol}_${heartbeat::port}":
      source      => $heartbeat::firewall_src,
      destination => $heartbeat::firewall_dst,
      protocol    => $heartbeat::protocol,
      port        => $heartbeat::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $heartbeat::firewall_tool,
      enable      => $heartbeat::manage_firewall,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $heartbeat::bool_debug == true {
    file { 'debug_heartbeat':
      ensure  => $heartbeat::manage_file,
      path    => "${settings::vardir}/debug-heartbeat",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
    }
  }

}
