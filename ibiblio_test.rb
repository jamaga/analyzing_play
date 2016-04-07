require 'minitest/autorun'
require 'minitest/pride'
require_relative 'ibiblio'

describe Ibiblio::Play do
  let(:xml) { File.read('./my_sample.xml') }

  describe 'characters in play' do
    subject { Ibiblio::Play.new(xml).characters_names }
    it { subject.must_equal ['First Witch', 'Second Witch', 'Third Witch'] }
  end

  describe 'speeches in play' do
    subject { Ibiblio::Play.new(xml).speeches }
    it { subject[0].must_equal(
        { character: 'First Witch', lines: [ 'When shall we three meet again',
                                             'In thunder, lightning, or in rain?' ]}) }
  end

  describe 'line_counts' do
    subject { Ibiblio::Play.new(xml).line_counting }
    it {
      subject[0].must_equal( { character: 'First Witch', line_counting: 3 } )
    }
  end
end