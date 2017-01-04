require 'test/unit'
require 'closeness_centrality/closeness_centrality'

class TestClosenessCentrality < Test::Unit::TestCase
  PATH_TO_ADJ_LIST_FILE = File.join(File.dirname(__FILE__), "../data/simple_edges.dat")

  def setup
    @graph = BreadthFirstSearch::Graph.new PATH_TO_ADJ_LIST_FILE
    @cc = ClosenessCentrality::ClosenessCentrality.new @graph
  end

  def teardown
  end

  def test_calculated_values
    expected = { "C" => 0.8571, "E" => 0.75, "D" => 0.75, "A" => 0.6667, "F" => 0.5455, "B" => 0.4615 }
    assert_equal(expected, @cc.closeness_centrality)
  end
end
