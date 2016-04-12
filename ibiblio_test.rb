require 'minitest/autorun'
require 'minitest/pride'
require_relative 'ibiblio'

describe Ibiblio::Play do
  let(:xml) { File.read('./my_sample.xml') }

  let(:play) { Ibiblio::Play.new(xml) }
  describe 'characters in play' do
    subject { play.characters_names }
    it { subject.must_equal ["First Murderer", "BANQUO", "Third Murderer"] }
  end

  describe 'speeches in play' do
    subject { Ibiblio::Play.new(xml).speeches }
    it { subject[0].must_equal(
        { character: 'First Murderer', lines: [ 'Let it come down.' ]}) }
  end

  describe 'line_counts' do
    subject { Ibiblio::Play.new(xml).line_counting }
    it {
      subject[0].must_equal( { character_names: 'BANQUO', line_counting: 3 } )
    }
  end
end