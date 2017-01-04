require 'koala'

module FacebookSocialGraph
  class FacebookSocialGraph
    def initialize(access_token)
      @koala_api = get_koala_api access_token
      @ui = UserInterface::UserInterface.new
      build_social_graph
    end

    def get_friends()
      @koala_api.get_connections "me", "friends"
    end

    def get_current_user()
      @koala_api.get_object "me"
    end

    def get_mutual_friends(user_id)
      obj = @koala_api.get_object("#{user_id}?fields=context.fields(mutual_friends)")
      obj['context']['mutual_friends']['data']
    end

    private

    def get_koala_api(access_token)
      Koala::Facebook::API.new access_token
    end

    def build_social_graph
      me = get_current_user
      path = File.join(File.dirname(__FILE__), "/../../data/#{me['name'].gsub(' ','_')}.dat")
      return if File.exists? path
      friends = get_friends
      File.open(path, "w") do |file|
        friends.each do |friend|
          file.puts "#{me['name'].gsub(' ','_')} #{friend['name'].gsub(' ','_')}"
          mutual_friends = get_mutual_friends friend['id']
          mutual_friends.each do |mutual_friend|
            file.puts "#{friend['name'].gsub(' ','_')} #{mutual_friend['name'].gsub(' ','_')}"
          end
        end
      end
      @ui.print_message "Social Graph File Builded!"
    end
  end
end
