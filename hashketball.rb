require "pry"

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

def num_points_scored(name) #players names
  game_hash.each do |team, team_stats| #put iterate game_hash and add to team and team_stats
  team_stats[:players].each do |player| #take players from team_stats and add to player
    if player[:player_name] == name #if player_name array/hash is true to name...
      return player[:points] #return the players points
      end
    end
  end
end

def shoe_size(name) #players name
  game_hash.each do |team, team_stats| #iterate over game_hash and add to team and team_stats
    team_stats[:players].each do |player| #pull players from team_stats and add to player
      if player[:player_name] == name #if player names is equal to name...
        return player[:shoe] #return palyers shoe size
      end
    end
  end
end

def team_colors(team_name_input) #team names
  if team_name_input == "Brooklyn Nets" #if team name is true to brooklyn nets...
    return game_hash[:home][:colors] #return game hash coordinating to home and the colors
  else return game_hash[:away][:colors] # or return game hash coordinating to away and the colors
  end
end

def team_names
  game_hash.map do |team, team_stats| #map game hash for new returned array and add to variables
    team_stats[:team_name] #return team_names from team_stats
  end
end

def player_numbers(team_name_input) #team_names
  array = [] #create empty array to be pushed to
  game_hash.each do |team, team_stats| #iterate over game hash and add to team and team_stats
    if team_stats[:team_name] == team_name_input #if team_name key is true to team names...
      team_stats.each do |key, value| #iterate over team_stats and add to key and value
        if key == :players #if key is true to players...
          value.each do |player| #iterate value and add to player
            array.push(player[:number]) #push player number empty array variable
          end
        end
      end
    end
  end
  return array #return the new array
end

def player_stats(name) #players names
  game_hash.each do |team, team_stats| #iterate over game hash and add to team and team stats
    team_stats.each do |key, value| #iterate over team stats and add to key and value
      if key == :players #if key is true to :players...
        value.each do |player| #iterate over value.each and add to player
          if name == player[:player_name] #if players names is true to :player_name...
            player.delete([:player_name]) #call player with delete to return copy of player name
            return player  #return player with stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  shoe_size = 0 #shoe variable set to 0
  rebounds = 0 #rebound variable set to 0
  game_hash.each do |team, team_stats| #iterate over game has and add to team and team stats
    team_stats[:players].each do |player| #iterate team_stats with :players and add to player
      if player[:shoe] > shoe_size #if player shoe size is greater than shoe size variable...
        shoe_size = player[:shoe] #let shoe size equal players shoe size...
        rebounds = player[:rebounds] #and let rebounds equal player rebounds
      end
    end
  end
  return rebounds #return rebounds to get data
end