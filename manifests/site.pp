
## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# PRIMARY FILEBUCKET
# This configures puppet agent and puppet inspect to back up file contents when
# they run. The Puppet Enterprise console needs this to display file contents
# and differences.

# Define filebucket 'main':
filebucket { 'main':
  server => 'se.nus.gw.172-29-34-66.6ehost.com',
  path   => false,
}

# Make filebucket 'main' the default backup location for all File resources:
File { backup => 'main' }

# Kill deprecation warnings in PE 3.3:
Package { allow_virtual => false }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.
#node "agent1.6monitor.com" {
#  hiera_include('classes')
#}
#node "master_cert", "se.nus.gw.172-29-34-66.6ehost.com" {
#  cron::job{
#    first_job:
#        command => '/bin/echo "this is the first cron jobs" >> /tmp/cron.out',
#        minute  =>  '51',
#        hour    =>  '13',
#        month   => '*',
#        weekday => '*',
#        user    => 'root',
#        environment => ['MAILTO=root', 'PATH="/usr/bin:/bin"'],
#  }
  
  #class { 'java':
  #	distribution => ‘jdk’,
#	version => ‘latest’,
#  }
#
#  class {'activemq':}
#  class {'::mcollective':
#        client 		 => true,
#	middleware_hosts => ['se.nus.gw.172-29-34-66.6ehost.com'],
#  }
#  hiera_include('classes')
#}

node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
  hiera_include('classes')
}
