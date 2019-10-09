# ----------
# Remove and Disable the DHCP server
# ----------
class dhcp::disable (
  String  $packagename = $dhcp::params::packagename,
  String  $servicename = $dhcp::params::servicename,
) inherits dhcp::params {



  package { $packagename:
    ensure => absent,
  }

  service { $servicename:
    ensure    => stopped,
    enable    => false,
    hasstatus => true,
    require   => Package[$packagename],
  }

}

