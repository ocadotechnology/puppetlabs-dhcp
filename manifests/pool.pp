# == Define: dhcp::pool
#
define dhcp::pool (
  String                  $network,
  String                  $mask,
  String                  $gateway          = '',
  Variant[String, Array]  $range            = '',
  String                  $failover         = '',
  Variant[String, Array]  $options          = '',
  Variant[String, Array]  $parameters       = '',
  Optional[Array]         $nameservers      = undef,
  Optional[Array]         $nameservers_ipv6 = undef,
  Optional[String]        $pxeserver        = undef,
  Optional[Integer]       $mtu              = undef,
  String                  $domain_name      = '',
  Boolean                 $ignore_unknown   = false,
) {

  include ::dhcp::params

  $dhcp_dir = $dhcp::params::dhcp_dir

  concat::fragment { "dhcp_pool_${name}":
    target  => "${dhcp_dir}/dhcpd.pools",
    content => template('dhcp/dhcpd.pool.erb'),
  }
}
