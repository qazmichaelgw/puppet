######         ######
##  Configure R10k ##
######         ######

##  This manifest requires the zack/R10k module and will attempt to
##  configure R10k according to my blog post on directory environments.
##  Beware! (and good luck!)

class { 'r10k':
  version           => '1.3.2',
  sources           => {
    'puppet' => {
      'remote'  => 'https://github.com/qazmichaelgw/puppet.git',
      'basedir' => "${::settings::confdir}/environments",
      'prefix'  => false,
    },
    'hiera'  => {
      'remote'  => 'https://github.com/qazmichaelgw/hiera.git',
      'basedir' => "${::settings::confdir}/hiera",
      'prefix'  => true,
    }
  },
  purgedirs         => ["${::settings::confdir}/environments"],
  manage_modulepath => false,
}
