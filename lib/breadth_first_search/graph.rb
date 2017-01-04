require_relative 'node'
require 'ui_cc/ui_cc'

module BreadthFirstSearch
  class Graph
    attr_reader :nodes

    def initialize(adj_list_file)
      @edges = read_file(adj_list_file)
      @nodes = []
      @ui = UserInterface::UserInterface.new
      build_graph(@edges)
    end

    def print_nodes
      @ui.print_message "Collected nodes:\n\n"
      @nodes.each do |node|
        @ui.print_message node.name
        @ui.print_message "adjacents:"
        node.adjacents.each { |adj| @ui.print_message_no_endl "#{adj} "}
        @ui.print_message "\n\n"
      end
    end

    def number_of_nodes
      @nodes.size
    end

    private
    def add_edge(node_a, node_b)
      node_a.adjacents << node_b
      node_b.adjacents << node_a
    end

    def read_file(file_name)
      edges = []
      file = File.open(file_name, "r") do |file|
        file.each_line() do |line|
          line = line.chomp.split
          edges << line
        end
      end
      edges
    end

    def build_graph(edges)
      edges.each do |edge|
        nodes_in_edge = []
        edge.each do |node|
          node_added = @nodes.detect { |node_in_nodes| node_in_nodes.name == node }
          if node_added
            nodes_in_edge << node_added
          else
            node_obj = Node.new(node)
            nodes_in_edge << node_obj
            @nodes << node_obj
          end
        end
        add_edge nodes_in_edge[0], nodes_in_edge[1]
      end
      @ui.print_message "Graph builded!\n\n"
    end
  end
end
