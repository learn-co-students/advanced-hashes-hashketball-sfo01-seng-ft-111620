# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here

def num_points_scored(name)
  hash = game_hash
  
  hash.each { |location, team_hash|
    team_hash.each { |key, data|
      if key == :players
        data.each { |player_hash|
          if player_hash[:player_name] == name
            return player_hash[:points]
          end
        }
      end
    }
  }
end

def shoe_size(name)
  hash = game_hash
  
  hash.each { |location, team_hash|
    team_hash.each { |key, data|
      if key == :players
        data.each { |player_hash|
          if player_hash[:player_name] == name
            return player_hash[:shoe]
          end
        }
      end
    }
  }
end

def team_colors(team_name)
  hash = game_hash
  
  hash.each { |location, team_hash|
    if team_hash[:team_name] == team_name
      return team_hash[:colors]
    end
  }
end

def team_names
  #return array of team names
  result_array = []
  hash = game_hash
  hash.each { |location, team_hash|
    result_array << team_hash[:team_name]
  }
  result_array
end

def player_numbers(team_name)
  # returns array of the jersey numbers for that team
  result_array = []
  hash = game_hash
  hash.each { |location, team_hash|
    if team_hash[:team_name] == team_name
      team_hash[:players].each { |value|
        result_array << value[:number]
      }
    end
  }
  result_array
end

def player_stats(player_name)
  # returns hash of the players stats
  hash = game_hash
  
  hash.each { |location, team_hash|
    team_hash.each { |key, value|
      if key == :players
        value.each { |player_hash|
          if player_hash[:player_name] == player_name
            return player_hash
          end  
        }
      end
    }
  }
  
end

def big_shoe_rebounds 
  # returns the number of rebounds the player with the biggest shoe size has
  big_shoe = 0
  rebounds = 0
  
  hash = game_hash
  
  hash.each { |location, team_hash| 
    team_hash[:players].each { |player_hash|
      if big_shoe < player_hash[:shoe]
        big_shoe = player_hash[:shoe]
        rebounds = player_hash[:rebounds]
      end
    }
  }
  rebounds
end

def most_points_scored
  # returns the player name that has the most points scored
  most_points = 0
  most_points_name = ""
  hash = game_hash
  
  hash.each { |location, team_hash|
    team_hash.each { |key, value|
      if key == :players 
        value.each { |player_hash|
          if player_hash[:points] > most_points
            most_points = player_hash[:points]
            most_points_name = player_hash[:name]
          end
        }
      end
    }
  }
  most_points_name
end

def winning_team
  # returns the string of the winning team
  team1 = 0
  team_one = ""
  team2 = 0
  team_two = ""
  winner = ""
  hash = game_hash
  hash.each { |location, team_hash|
    if team_hash[:team_name] == "Brooklyn Nets"
      team_hash.each { |key, array|
        array.each { |player_hash|
          player_hash[:points] += team1
          team_one = team_hash[:team_name]
        }
      }
    else
      team_hash.each { |key, array|
        array.each { |player_hash|
          player_hash[:points] += team2
          team_two = team_hash[:team_name]
        }
      }
    end
  }
  if team1 > team2
    return team_one
  end
  return team_two
end

def player_with_longest_name
  # returns name of player with longest name
  name_length = 0
  name = ""
   hash.each { |location, team_hash| 
    team_hash[:players].each { |player_hash|
      if player_hash[:player_name].length > name_length
        name_length = player_hash[:player_name].length
        name = player_hash[:player_name]
      end
    }
  }
  name
end

def long_name_steals_a_ton?
  # returns true if the player with the longest name had the msot steals
  name_length = 0
  steals = 0
  name = ""
   ash.each { |location, team_hash| 
    team_hash[:players].each { |player_hash|
      if player_hash[:player_name].length > name_length
        name_length = player_hash[:player_name].length
        name = player_hash[:player_name]
      end
    }
  }
  
  hash.each { |location, team_hash| 
    team_hash[:players].each { |player_hash|
      if player_hash[:player_name] == name && player_hash[:steals] == steals
        return true
      end
    }
  }
  return false
end