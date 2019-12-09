require 'pry'

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{
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
        :steals =>3,
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
      :players => [{
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

def num_points_scored(players_name)
  game_hash.each do |stats, team|
    team.each do |attribute, info|
      if attribute == :players
        info.each do |player|
          if player[:player_name] == players_name
            return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(players_name)
  game_hash.each do |stats, team|
    team.each do |attribute, info|
      if attribute == :players
        info.each do |player|
          if player[:player_name] == players_name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |stats, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
  new_array = []
  game_hash.each do |stats, team|
    new_array << team[:team_name]
  end
  return new_array
end

def player_numbers(team_name)
  nums = []
  game_hash.map do |stats, team|
    if team[:team_name] == team_name
      team.each do |attributes,info|
        if attributes == :players
          info.each do |player|
            nums << player[:number]
          end
        end
      end
    end
  end
  return nums
end

def player_stats(players_name)
  game_hash.map do |stats, team|
    team[:players].each do |player|
      if players_name == player[:player_name]
          player.delete(:player_name)
        return player
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = 0
  big_shoe_rebounds = 0
  game_hash.map do |stats, team|
    team[:players].each do |player|
      if player[:shoe] > biggest_shoe
        biggest_shoe = player[:shoe]
        big_shoe_rebounds = player[:rebounds]
      end
    end
  end
  return big_shoe_rebounds
end

def most_points_scored
  points_scored = 0
  points_player = " "
  game_hash.map do |stats, team|
    team[:players].each do |player|
      if player[:points] > points_scored
        points_scored = player[:points]
        points_player = player[:player_name]
      end
    end
  end
  return points_player
end

def winning_team
  total_home_points = 0
  total_away_points = 0

  game_hash.each do |home_away, team|
    if home_away == :home
      team.each do |attribute, info|
        if attribute == :players
          info.each do |player|
            total_home_points += player[:points]
          end
        end
      end
    end
  total_home_points

    if home_away == :away
      team.each do |attribute, info|
        if attribute == :players
          info.each do |player|
            total_away_points += player[:points]
          end
        end
      end
    end
  total_away_points

    if total_home_points > total_away_points
      return game_hash[:home][:team_name]
    else
      return game_hash[:away][:team_name]
    end
  end
end

def player_with_longest_name
  longest_name_count = 0
  longest_name = ""

  game_hash.each do |stats, team|
    team.each do |attribute, info|
      if attribute == :players
        info.each do |player|
          if player[:player_name].length > longest_name_count
            longest_name_count = player[:player_name].length
            longest_name = player[:player_name]
          end
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  highest_steals = 0
  player_with_most_steals = ""
  game_hash.each do |stats, team|
    team.each do |attribute, info|
      if attribute == :players
        info.each do |player|
          if player[:steals] > highest_steals
            highest_steals = player[:steals]
            player_with_most_steals = player[:player_name]
          end
        end
      end
    end
  end
  player_with_most_steals

  (player_with_most_steals == player_with_longest_name) ? true : false
end
