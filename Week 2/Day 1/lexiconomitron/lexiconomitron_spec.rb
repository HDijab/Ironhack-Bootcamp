require 'rspec'
require './lexiconomitron'

describe 'Lexiconomitron' do 
  before :each do
    @lexi = Lexiconomitron.new
  end

  describe "#eat_t" do
    it "removes every letter t from the input" do
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end
  end

  describe "#shazam" do
    it "returns a reversed string of each item in array, with removed t's" do
      expect(@lexi.shazam(['This', 'is', 'a', 'boring', 'test'])).to eq(['sih', 'se'])
    end
  end

  describe "#oompa_loompa" do
    it "returns an array of 3<= length without t's" do
      expect(@lexi.oompa_loompa(['if', 'you', 'wanna', 'be', 'my', 'lover'])).to eq(['if', 'you', 'be', 'my'])
    end
  end
end
