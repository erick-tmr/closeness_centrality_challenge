require 'test/unit'
require 'breadth_first_search/graph'

class TestGraph < Test::Unit::TestCase
  PATH_TO_ADJ_LIST_FILE = File.join(File.dirname(__FILE__), "../data/simple_edges.dat")

  def setup
    @graph = BreadthFirstSearch::Graph.new PATH_TO_ADJ_LIST_FILE
  end

  def teardown
  end

  def test_epmty_file
    assert_raises(RuntimeError) { graph_empty = BreadthFirstSearch::Graph.new File.join(File.dirname(__FILE__), "../data/empty.dat") }
  end

  def test_read_nodes
    expected = ["A", "B", "C", "D", "E", "F"]
    returned = []
    @graph.nodes.each { |node| returned << node.name }
    assert_equal(expected, returned)
  end
end
