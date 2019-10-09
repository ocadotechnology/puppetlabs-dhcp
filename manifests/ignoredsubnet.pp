# == Define: dhcp::ignoredsubnet
#
define dhcp::ignoredsubnet (
  String  $network,
  String  $mask,
) {

  include ::dhcp::params

  $dhcp_dir = $dhcp::params::dhcp_dir

  concat::fragment { "dhcp_ignoredsubnet_${name}":
    target  => "${dhcp_dir}/dhcpd.ignoredsubnets",
    content => template('dhcp/dhcpd.ignoredsubnet.erb'),
  }

}

