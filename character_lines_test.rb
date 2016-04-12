require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
require './ibiblio'

describe 'test for checking if they are saying sth' do
  let(:xml) { File.read('./my_sample.xml') }

  describe 'BANQUO has 3 lines' do
    subject { Ibiblio.reading(xml) }
    it 'character Banquo has 3 lines' do
      subject.must_match /3 +BANQUO/
    end
  end

  describe 'First Murderer has 2 lines' do
    subject { Ibiblio.reading(xml) }
    it 'character First Murderer has 2 lines' do
      subject.must_match /2 +First Murderer/
    end
  end

  describe 'Third Murderer has 2 lines' do
    subject { Ibiblio.reading(xml) }
    it 'character Third Murderer has 2 lines' do
      subject.must_match /2 +Third Murderer/
    end
  end

end