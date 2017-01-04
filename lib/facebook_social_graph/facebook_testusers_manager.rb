require 'koala'

module FacebookSocialGraph
  class FacebookTestUsersManager
    def initialize(app_settings_file)
      @testusers = get_koala_testusers app_settings_file
    end

    def create_testuser(installed, params)
      @testusers.create(installed, params)
    end

    def list_testusers
      @testusers.list
    end

    def be_friend(user1, user2)
      @testusers.befriend(user1, user2)
    end

    private

    def get_koala_testusers(app_settings_file)
      temp = []
      File.open(app_settings_file, "r") do |file|
        file.each_line { |line| temp << line.chomp }
      end
      app_id = temp[0].split[1].to_i
      app_secret = temp[1].split[1]
      koala_testusers = Koala::Facebook::TestUsers.new(:app_id => app_id, :secret => app_secret)
    end
  end
end
