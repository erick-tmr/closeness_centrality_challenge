require 'breadth_first_search/breadth_first_search'
require 'breadth_first_search/graph'
require 'ui_cc/ui_cc'

module ClosenessCentrality
  class ClosenessCentrality
    def initialize(graph)
      @shortest_paths_average = calculate_shortest_paths_average_lenght graph
      @closeness_centrality = calculate_closeness_centrality @shortest_paths_average
      @ui = UserInterface::UserInterface.new
    end

    def print_cc_rank
      @ui.print_message "Nodes rank (ordered by closeness):\n\n"
      @closeness_centrality.each { |key, value| @ui.print_message "Node #{key}: #{value}" }
    end

    private

    def calculate_shortest_paths_average_lenght(graph)
      n = graph.number_of_nodes
      shortest_paths_average = {}
      graph.nodes.each do |node|
        average = 0
        bfs = BreadthFirstSearch::BreadthFirstSearch.new graph, node
        graph.nodes.each do |other_node|
          shortest_path_lenght = bfs.shortest_path_to(other_node).size - 1 unless node == other_node
          average += shortest_path_lenght.to_f if shortest_path_lenght
        end
        average = average/n
        shortest_paths_average[node.name] = average.round(4)
      end
      shortest_paths_average
    end

    def calculate_closeness_centrality(shortest_paths_average)
      cc = shortest_paths_average.dup
      cc.each { |key, value| cc[key] = (1/value).round(4) }
      cc.sort_by { |key, value| value }.reverse.to_h
    end
  end
end
