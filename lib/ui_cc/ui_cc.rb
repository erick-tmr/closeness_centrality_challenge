module UserInterface
  class UserInterface
    def initialize
    end

    def use_facebook_data?
      puts "Do you want to analize the CC from a (F)acebook App or from an (A)djacency List? (chose among the letters that are enclosed in round brackets)"
      input = gets.chomp.downcase
      case input
      when "f"
        true
      when "a"
        false
      else
        puts "Illegal input, try again.\n\n"
        use_facebook_data?
      end
    end

    def get_local_data
      puts "Enter with your Adjacency List file name: (example: edges.dat)"
      gets.chomp
    end

    def local_data_menu
      puts "Select one of the options below:\n\n"
      puts "(1) See the Closeness Centrality rank."
      puts "(2) See the nodes in the registered graph."
      puts "(3) Exit."
      print "Option: "
      input = gets.chomp.to_i
      case input
      when 1
        "cc_rank"
      when 2
        "print_nodes"
      when 3
        puts "Bye bye."
        nil
      else
        puts "Illegal input, try again.\n\n"
        local_data_menu
      end
    end

    def select_user
      puts "Enter with the id of the user that you want to analyze: "
      gets.chomp
    end

    def print_message(message)
      puts message
    end

    def print_message_no_endl(message)
      print message
    end

    def print_welcome_message
      puts "Welcome to the Facebook Closeness Centrality(CC) Social Analyzer!\n\n"
    end
  end
end
