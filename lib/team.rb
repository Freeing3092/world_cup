class Team
  attr_reader :country, :players
  attr_accessor :eliminated
  
  def initialize(country)
    @country = country
    @eliminated = false
    @players = []
  end
  
  def eliminated?
    @eliminated
  end
  
  def add_player(player)
    @players << player
  end
  
  def players_by_position(field_position)
    @players.select {|player| player.position == field_position}
  end
end