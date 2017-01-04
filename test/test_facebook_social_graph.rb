require 'test/unit'
require 'facebook_social_graph/facebook_social_graph'

class TestFacebookSocialGraph < Test::Unit::TestCase
  ACCESS_TOKEN_JOE = "EAAGRU7Czy3YBACnN98FCevZB1wj72svNyy6To01afmCsFhYk3WSJ2HZCW9ewEqgLZARRvLnbw7qcX3kWBWDpZAZBNZC5JIOQdWFtXZCaXw64lVMo1cDVHUSP75TeGLXGQIU39bJWMPCg542PdG82HnmOn5I6V6n25DCwE04BI7IG2ZAx0jsYY4j4"

  def setup
    @fb = FacebookSocialGraph::FacebookSocialGraph.new ACCESS_TOKEN_JOE
  end

  def teardown
  end

  def test_get_friends
    expected = ["128849220948727", "123274841507199", "114868659016309", "113989149104587", "109703649534188", "105447113294371"]
    returned = []
    @fb.get_friends.each do |friend|
      returned << friend["id"]
    end
    assert_equal(expected, returned)
  end

  def test_current_user
    expected = "106274503211446"
    assert_equal(expected, @fb.get_current_user["id"])
  end

  def test_get_mutual_friends
    expected = ["113989149104587", "105447113294371", "114868659016309"]
    returned = []
    @fb.get_mutual_friends("128849220948727").each do |friend|
      returned << friend["id"]
    end
    assert_equal(expected, returned)
  end
end
