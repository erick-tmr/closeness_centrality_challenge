require 'test/unit'
require 'breadth_first_search/breadth_first_search'
require 'breadth_first_search/graph'
require 'breadth_first_search/node'

class TestBreadthFirstSearch < Test::Unit::TestCase
  PATH_TO_ADJ_LIST_FILE = File.join(File.dirname(__FILE__), "../data/simple_edges.dat")

  def setup
    @graph = BreadthFirstSearch::Graph.new PATH_TO_ADJ_LIST_FILE
  end

  def teardown
  end

  def test_shortest_path_to
    expected_a_b = [@graph.nodes[0], @graph.nodes[1]]
    expected_a_f = [@graph.nodes[0], @graph.nodes[2], @graph.nodes[3], @graph.nodes[5]]

    bfs = BreadthFirstSearch::BreadthFirstSearch.new(@graph, @graph.nodes[0])
    assert_equal(expected_a_b, bfs.shortest_path_to(@graph.nodes[1]))
    assert_equal(expected_a_f, bfs.shortest_path_to(@graph.nodes[5]))
  end
end
