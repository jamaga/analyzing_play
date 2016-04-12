require 'minitest/autorun'
require 'minitest/pride'
require_relative 'ibiblio'

describe Ibiblio::Play do
  let(:xml) { File.read('./my_sample.xml') }

  let(:play) { Ibiblio::Play.new(xml) }
  describe 'characters in play' do
    subject { play.characters_names }
    it 'checks correctness of character names in play' do
      assert_equal subject, ["First Murderer", "BANQUO", "Third Murderer"]
    end
  end

  describe 'speeches in play' do
    subject { Ibiblio::Play.new(xml).speeches }
    it 'checks first murderer' do
      assert_equal subject[0], {character: 'First Murderer', lines: [ 'Let it come down.' ]}
      end
  end

  describe 'line_counts' do
    subject { Ibiblio::Play.new(xml).line_counting }
    it 'checks lines of Banquo' do
      assert_equal subject[0], { character_names: 'BANQUO', line_counting: 3 }
    end
  end
end