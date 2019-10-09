# == Class: dhcp::failover
#
class dhcp::failover (
  String                    $peer_address,
  String                    $role                 = 'primary',
  String                    $address              = $::ipaddress,
  String                    $port                 = '519',
  String                    $max_response_delay   = '30',
  String                    $max_unacked_updates  = '10',
  String                    $mclt                 = '300',
  Variant[String, Integer]  $auto_partner_down    = undef,
  String                    $load_split           = '128',
  String                    $load_balance         = '3',
  String                    $omapi_key            = '',
  String                    $dhcp_dir             = $dhcp::params::dhcp_dir,
) inherits dhcp::params {

  concat::fragment { 'dhcp-conf-failover':
    target  => "${dhcp_dir}/dhcpd.conf",
    content => template('dhcp/dhcpd.conf.failover.erb'),
  }
}
