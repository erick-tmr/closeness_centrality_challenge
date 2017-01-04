require 'breadth_first_search/graph'
require 'closeness_centrality/closeness_centrality'
require 'facebook_social_graph/facebook_testusers_manager'
require 'facebook_social_graph/facebook_social_graph'
require 'ui_cc/ui_cc'

PATH_TO_APP_SETTINGS = File.join(File.dirname(__FILE__), "../data/app_settings")

#the ui obj is used to comunicate with the user through the terminal
ui = UserInterface::UserInterface.new
ui.print_welcome_message

if ui.use_facebook_data?
  testusers = FacebookSocialGraph::FacebookTestUsersManager.new PATH_TO_APP_SETTINGS
  users = testusers.list_testusers
  selected_user = {}
  inputed_user = ui.select_user

  while selected_user.empty?
    users.each do |user|
      selected_user = user if user['id'] == inputed_user
    end
    if selected_user.empty?
      ui.print_message "You entered an invalid user id, please confirm the value in your app and try again."
      inputed_user = ui.select_user
    end
  end

  graph_api = FacebookSocialGraph::FacebookSocialGraph.new selected_user["access_token"]

  user_name_underscored = graph_api.get_current_user['name'].gsub(' ','_')
  path_to_edges = File.join(File.dirname(__FILE__), "../data/#{user_name_underscored}.dat")
  graph = BreadthFirstSearch::Graph.new path_to_edges
  cc = ClosenessCentrality::ClosenessCentrality.new graph

  option = ui.local_data_menu
  while !option.nil?
    case option
    when "cc_rank"
      cc.print_cc_rank
    when "print_nodes"
      graph.print_nodes
    end
    option = ui.local_data_menu
  end
else
  file_name = ui.get_local_data
  path_to_file = File.join(File.dirname(__FILE__), "../data/#{file_name}")
  graph = BreadthFirstSearch::Graph.new path_to_file
  cc = ClosenessCentrality::ClosenessCentrality.new graph
  option = ui.local_data_menu
  while !option.nil?
    case option
    when "cc_rank"
      cc.print_cc_rank
    when "print_nodes"
      graph.print_nodes
    end
    option = ui.local_data_menu
  end
end
