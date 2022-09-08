require 'rspec'
require './lib/player'

RSpec.describe Player do
  let(:player) {Player.new("Ronaldo", "forward")}
  
  it "is an instance of its class" do
    expect(player).to be_a Player
  end
  
  it "has attributes for name and position" do
    expect(player.name).to eq("Ronaldo")
    expect(player.position).to eq("forward")
  end
end