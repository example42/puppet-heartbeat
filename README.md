# Puppet module: heartbeat

This is a Puppet module for heartbeat based on the second generation layout ("NextGen") of Example42 Puppet Modules.

Made by Alessandro Franceschi / Lab42

Official site: http://www.example42.com

Official git repository: http://github.com/example42/puppet-heartbeat

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.

## USAGE - Module specific parameters

* Install heartbeat with custom source files for ha.cf haresources and authkeys

        class { 'heartbeat':
          source             => 'puppet:///modules/example42/heartbeat/ha.cf',
          source_haresources => 'puppet:///modules/example42/heartbeat/haresources',
          source_authkeys    => 'puppet:///modules/example42/heartbeat/authkeys',
        }

* Install heartbeat with custom templates for ha.cf haresources and authkeys

        class { 'heartbeat':
          template             => 'example42/heartbeat/ha.cf',
          template_haresources => 'example42/heartbeat/haresources',
          template_authkeys    => 'example42/heartbeat/authkeys',
        }

* Install heartbeat with custom source files for ha.cf and authkeys and template for haresources

        class { 'heartbeat':
          source               => 'puppet:///modules/example42/heartbeat/ha.cf',
          template_haresources => 'example42/heartbeat/haresources',
          source_authkeys      => 'puppet:///modules/example42/heartbeat/authkeys',
        }


## USAGE - Basic management

* Install heartbeat with default settings

        class { 'heartbeat': }

* Install a specific version of heartbeat package

        class { 'heartbeat':
          version => '1.0.1',
        }

* Disable heartbeat service.

        class { 'heartbeat':
          disable => true
        }

* Remove heartbeat package

        class { 'heartbeat':
          absent => true
        }

* Enable auditing without without making changes on existing heartbeat configuration files

        class { 'heartbeat':
          audit_only => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'heartbeat':
          source => [ "puppet:///modules/example42/heartbeat/heartbeat.conf-${hostname}" , "puppet:///modules/example42/heartbeat/heartbeat.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'heartbeat':
          source_dir       => 'puppet:///modules/example42/heartbeat/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'heartbeat':
          template => 'example42/heartbeat/heartbeat.conf.erb',
        }

* Automatically include a custom subclass

        class { 'heartbeat':
          my_class => 'example42::my_heartbeat',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)

        class { 'heartbeat':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands 

        class { 'heartbeat':
          puppi        => true,
          puppi_helper => 'myhelper', 
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'heartbeat':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'heartbeat':       
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }


[![Build Status](https://travis-ci.org/example42/puppet-heartbeat.png?branch=master)](https://travis-ci.org/example42/puppet-heartbeat)
