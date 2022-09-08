class WorldCup
  attr_reader :year, :teams
  
  def initialize(year, teams)
    @year = year
    @teams = teams
  end
  
  # Return array of players of a given position on a non-eliminated team
  def active_players_by_position(position)
    alive_teams = teams.select {|team| !team.eliminated?}
    
    alive_teams.map do |team|
      team.players.select do |player|
        player.position == position
      end
    end.flatten
  end
  
  # Return hash of players by position
  def all_players_by_position
    # players_by_position = Hash.new([])
    
    players_by_position = {
      "forward" => [],
      "defender" => [],
      "midfielder" => []
    }
    @teams.each do |team|
      team.players.each do |player|
        players_by_position[player.position] << player
      end
    end
    players_by_position
  end
end