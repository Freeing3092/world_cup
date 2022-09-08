require 'rspec'
require './lib/player'
require './lib/team'

RSpec.describe Team do
  let(:player) {Player.new("Ronaldo", "forward")}
  let(:player2) {Player.new("Rui Silva", "goal keeper")}
  let(:team) {Team.new("Portugal")}
  
  it "is an instance of its class" do
    expect(team).to be_a Team
  end
  
  it "has attributes for country" do
    expect(team.country).to eq("Portugal")
  end
  
  it "#eliminated? returns boolean value of eliminated state" do
    expect(team.eliminated?).to eq(false)
  end
  
  it "#eliminated attribute returns boolean value" do
    team.eliminated = true
    expect(team.eliminated?).to eq(true)
  end
  
  it "#add_player will add players to the team" do
    expect(team.players).to eq([])
    
    team.add_player(player)
    team.add_player(player2)
    result = [player, player2]
    
    expect(team.players).to eq(result)
  end
  
  it "#players_by_position returns the players for a given position" do
    team.add_player(player)
    team.add_player(player2)
    
    expect(team.players_by_position("goal keeper")).to eq([player2])
    expect(team.players_by_position("forward")).to eq([player])
    expect(team.players_by_position("midfielder")).to eq([])
  end
end