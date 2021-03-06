# -*- coding: utf-8 -*-
require 'graphviz'

module View
  #
  # Topology controller's GUI (graphviz).
  #
  class Graphviz
    def initialize(output = './topology.png')
      @nodes = {}
      @output = File.expand_path(output)
      @graphviz = GraphViz.new(:G, use: 'neato', overlap: false, splines: true)
    end

    def update(topology)
      @nodes.clear
      add_nodes(topology)
      add_edges(topology)
      @graphviz.output(png: @output)
    end

    private

    def add_nodes(topology)
      topology.each_switch do |dpid, ports|
<<<<<<< HEAD
       if dpid.class == Fixnum
         @nodes[dpid] = @graphviz.add_nodes(dpid.to_hex, 'shape' => 'box')
       else
         s = dpid.to_s.sub(".","0")
         @nodes[s] = @graphviz.add_nodes(dpid.to_s, 'shape' => 'ellipse')
       end
=======
        @nodes[dpid] = @graphviz.add_nodes(dpid.to_hex, 'shape' => 'box')
>>>>>>> 54b93a0a43d83e6190788d3e8bc28f2991be3131
      end
    end

    def add_edges(topology)
      topology.each_link do |each|
<<<<<<< HEAD
        #puts each.dpid_a.to_s + "--" + each.dpid_b.to_s

       if each.dpid_a.class == Fixnum
         node_a, node_b = @nodes[each.dpid_a], @nodes[each.dpid_b]
       else
         s = each.dpid_a.to_s.sub(".","0")
         node_a, node_b = @nodes[s], @nodes[each.dpid_b]
       end
         #puts node_a.to_s + "--" + node_b.to_s

=======
        node_a, node_b = @nodes[each.dpid_a], @nodes[each.dpid_b]
>>>>>>> 54b93a0a43d83e6190788d3e8bc28f2991be3131
        @graphviz.add_edges node_a, node_b if node_a && node_b
      end
    end

  end
end

### Local variables:
### mode: Ruby
### coding: utf-8-unix
### indent-tabs-mode: nil
### End:
