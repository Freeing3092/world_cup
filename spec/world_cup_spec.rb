require 'rspec'
require './lib/player'
require './lib/team'
require './lib/world_cup'

RSpec.describe WorldCup do
  let(:player1) {Player.new("Christiano Ronaldo", "forward")}
  let(:player2) {Player.new("Rui Silva", "defender")}
  let(:portugal) {Team.new("Portugal")}
  let(:player3) {Player.new("Lionel Messi", "forward")}
  let(:player4) {Player.new("Leandro Paredes", "midfielder")}
  let(:argentina) {Team.new("Argentina")}
  let(:world_cup) {WorldCup.new(2022, [portugal, argentina])}
  
  it "is an instance of its class" do
    expect(world_cup).to be_a WorldCup
  end
  
  it "has a year attribute" do
    expect(world_cup.year).to eq(2022)
  end
  
  it "has teams array" do
    result = [portugal, argentina]
    
    expect(world_cup.teams).to eq(result)
  end
  
  it "#active_players_by_position returns all players of a given position" do
    portugal.add_player(player1)
    portugal.add_player(player2)
    argentina.add_player(player3)
    argentina.add_player(player4)
    
    result = [player1, player3]
    
    expect(world_cup.active_players_by_position("forward")).to eq(result)
    
    result = [player3]
    
    portugal.eliminated = true
    expect(world_cup.active_players_by_position("forward")).to eq(result)
  end
  
  it "#all_players_by_position returns hash of players by position" do
    portugal.add_player(player1)
    portugal.add_player(player2)
    argentina.add_player(player3)
    argentina.add_player(player4)
    
    result = {
      "forward" => [player1, player3],
      "defender" => [player2],
      "midfielder" => [player4]
    }
    
    expect(world_cup.all_players_by_position).to eq(result)
  end
  
end


















