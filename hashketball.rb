require 'pry' 

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
        :player_name => "Alan Anderson",
        :number => 0, 
        :shoe => 16, 
        :points => 22, 
        :rebounds => 12, 
        :assists => 12, 
        :steals => 3, 
        :blocks => 1, 
        :slam_dunks => 1
        },
        {
        :player_name => "Reggie Evans",
        :number => 30, 
        :shoe => 14, 
        :points => 12, 
        :rebounds => 12, 
        :assists => 12, 
        :steals => 12, 
        :blocks => 12, 
        :slam_dunks => 7
        },
        {
        :player_name => "Brook Lopez",
        :number => 11, 
        :shoe => 17, 
        :points => 17, 
        :rebounds => 19, 
        :assists => 10, 
        :steals => 3, 
        :blocks => 1, 
        :slam_dunks => 15
        },
        {
        :player_name => "Mason Plumlee",
        :number => 1, 
        :shoe => 19, 
        :points => 26, 
        :rebounds => 11, 
        :assists => 6, 
        :steals => 3, 
        :blocks => 8, 
        :slam_dunks => 5
        },
        {
        :player_name => "Jason Terry",
        :number => 31, 
        :shoe => 15, 
        :points => 19, 
        :rebounds => 2, 
        :assists => 2, 
        :steals => 4, 
        :blocks => 11, 
        :slam_dunks => 1
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
        :player_name => "Jeff Adrien",
        :number => 4, 
        :shoe => 18, 
        :points => 10, 
        :rebounds => 1, 
        :assists => 1, 
        :steals => 2, 
        :blocks => 7, 
        :slam_dunks => 2
        },
        {
        :player_name => "Bismack Biyombo",
        :number => 0, 
        :shoe => 16, 
        :points => 12, 
        :rebounds => 4, 
        :assists => 7, 
        :steals => 22, 
        :blocks => 15, 
        :slam_dunks => 10
        },
        {
        :player_name => "DeSagna Diop",
        :number => 2, 
        :shoe => 14, 
        :points => 24, 
        :rebounds => 12, 
        :assists => 12, 
        :steals => 4, 
        :blocks => 5, 
        :slam_dunks => 5
        },
        {
        :player_name => "Ben Gordon",
        :number => 8, 
        :shoe => 15, 
        :points => 33, 
        :rebounds => 3, 
        :assists => 2, 
        :steals => 1, 
        :blocks => 1, 
        :slam_dunks => 0
        },
        {
        :player_name => "Kemba Walker",
        :number => 33, 
        :shoe => 15, 
        :points => 6, 
        :rebounds => 12, 
        :assists => 12, 
        :steals => 7, 
        :blocks => 5, 
        :slam_dunks => 12
        }
      ]
    }
  }
end

def num_points_scored(name)
  game_hash.map do |team, team_level_stats|
    team_level_stats.map do |team_level_keys, team_level_values|
     if team_level_keys == :players
      team_level_values.map do |player|
        if player[:player_name] == name
          return player[:points]
        end
      end
     end
    end
  end
end

def shoe_size(name)
  game_hash.map do |team, team_level_stats|
    team_level_stats.map do |team_level_keys, team_level_values|
     if team_level_keys == :players
      team_level_values.map do |player|
        if player[:player_name] == name
          return player[:shoe]
        end
      end
     end
    end
  end    
end

def team_colors(team_name)
  game_hash.map do |team, team_level_stats|
    team_level_stats.map do |team_level_keys, team_level_values|
      if team_level_values == team_name
        team_level_stats.map do |team_level_keys, team_level_values|
          return team_level_stats[:colors]
        end
      end
    end
  end
end

def team_names
  team_names_array = []
  game_hash.map do |team, team_level_stats|
    team_level_stats.map do |team_level_keys, team_level_values|
      if team_level_keys == :team_name
        team_names_array.push(team_level_values)
      end
    end
  end
  team_names_array.flatten.reject { |name| name == nil }
end

def player_numbers(input_team)
  player_numbers_array = []
  game_hash.map do |team, team_level_stats|
    if team_level_stats[:team_name] == input_team
      team_level_stats.map do |team_level_keys, team_level_values|
        if team_level_keys == :players
          team_level_values.map do |player|
            player_numbers_array << player[:number]
          end
        end
      end
    end
  end
  player_numbers_array.flatten.reject { |name| name == nil }
end

def player_stats(name)
  game_hash.map do |team, team_level_stats|
    team_level_stats.map do |team_level_keys, team_level_values|
     if team_level_keys == :players
      team_level_values.map do |player|
        if player[:player_name] == name
          return player.select{ |stat| stat != :player_name }
        end
      end
     end
    end
  end
end

def big_shoe_rebounds
  game_hash.map do |team, team_level_stats|
    team_level_stats.map do |team_level_keys, team_level_values|
     if team_level_keys == :players
      big_shoe_player = team_level_values.max_by{ |player_hash| player_hash[:shoe] }
      return big_shoe_player[:rebounds]
     end
    end
  end
end

def most_points_scored
  most_points_scored_player = nil
  game_hash.map do |team, team_level_stats|
    team_level_stats.map do |team_level_keys, team_level_values|
     if team_level_keys == :players
      most_points_scored_player = team_level_values.max_by{ |player_hash| player_hash[:points] }
     end
    end
  end
  most_points_scored_player[:player_name]
end

def winning_team
  brooklyn_points = num_points_scored("Alan Anderson") + num_points_scored("Reggie Evans") + num_points_scored("Brook Lopez") + num_points_scored("Mason Plumlee") + num_points_scored("Jason Terry")
  charlotte_points = num_points_scored("Jeff Adrien") + num_points_scored("Bismack Biyombo") + num_points_scored("DeSagna Diop") + num_points_scored("Ben Gordon") + num_points_scored("Kemba Walker")
  if brooklyn_points > charlotte_points
    return "Brooklyn Nets"
  else
    return "Charlotte Hornets"
  end
end

def player_with_longest_name
  longest_name = nil
  game_hash.map do |team, team_level_stats|
    team_level_stats.map do |team_level_keys, team_level_values|
     if team_level_keys == :players
      longest_name = team_level_values.max_by{ |player_hash| player_hash[:player_name].length }
     end
    end
  end
  longest_name[:player_name]
end

def long_name_steals_a_ton?
  long_name_player = player_with_longest_name
  most_steals_player = nil
  game_hash.map do |team, team_level_stats|
    team_level_stats.map do |team_level_keys, team_level_values|
     if team_level_keys == :players
      most_steals_player = team_level_values.max_by{ |player_hash| player_hash[:steals] }
     end
    end
  end
  if most_steals_player[:player_name] == long_name_player
    return true
  end
end
