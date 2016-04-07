require 'minitest/autorun'
require 'minitest/pride'
require_relative 'ibiblio'

describe Ibiblio::Play do
  let(:xml) { File.read('./my_sample.xml') }

  describe 'characters in play' do
    subject { Ibiblio::Play.new(xml).characters_names }
    it { subject.must_equal ['BANQUO', 'First Murderer', 'Third Murderer'] }
  end

  describe 'speeches in play' do
    subject { Ibiblio::Play.new(xml).speeches }
    it { subject[0].must_equal(
        { character: 'BANQUO', lines: [ 'It will be rain to-night.' ]}) }
  end

  describe 'line_counts' do
    subject { Ibiblio::Play.new(xml).line_counting }
    it {
      subject[0].must_equal( { character: 'BANQUO', line_counting: 3 } )
    }
  end
end