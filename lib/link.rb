# -*- coding: utf-8 -*-
require 'rubygems'
require 'pio/lldp'

#
# Edges between two switches.
#
class Link
  attr_reader :dpid_a
  attr_reader :dpid_b
  attr_reader :port_a
  attr_reader :port_b

  def initialize(dpid, packet_in)
<<<<<<< HEAD
    if !packet_in.ipv4? || (packet_in.ipv4_saddr.to_s == "0.0.0.0")
     lldp = Pio::Lldp.read(packet_in.data)
     @dpid_a = lldp.dpid
     @dpid_b = dpid
     @port_a = lldp.port_number
     @port_b = packet_in.in_port
    else 
     @dpid_a = packet_in.ipv4_saddr
     @dpid_b = dpid
     @port_a = 1
     @port_b = packet_in.in_port
    end
=======
    lldp = Pio::Lldp.read(packet_in.data)
    @dpid_a = lldp.dpid
    @dpid_b = dpid
    @port_a = lldp.port_number
    @port_b = packet_in.in_port
>>>>>>> 54b93a0a43d83e6190788d3e8bc28f2991be3131
  end

  def ==(other)
    (@dpid_a == other.dpid_a) &&
      (@dpid_b == other.dpid_b) &&
      (@port_a == other.port_a) &&
      (@port_b == other.port_b)
  end

  def <=>(other)
    to_s <=> other.to_s
  end

  def to_s
    format '%#x (port %d) <-> %#x (port %d)', dpid_a, port_a, dpid_b, port_b
  end

  def has?(dpid, port)
    ((@dpid_a == dpid) && (@port_a == port)) ||
      ((@dpid_b == dpid) && (@port_b == port))
  end
end

### Local variables:
### mode: Ruby
### coding: utf-8-unix
### indent-tabs-mode: nil
### End:
