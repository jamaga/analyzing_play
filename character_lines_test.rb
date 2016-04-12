require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
require './ibiblio'

# integration test
#if i give data -- it does THIS to it
# we can try on one person - in a sample
# would work for all later

describe 'test for checking if they are saying sth' do
  let(:xml) { File.read('./my_sample.xml') }

  describe 'BANQUO has 3 lines' do
    subject { Ibiblio.reading(xml) }
    it 'character has 3 lines' do
      #byebug
      #subject must be equal to any number of numbers
      #and then a name - which is first which
      #subject.scan(/3 BANQUO/).must_equal ['3 BANQUO']
      subject.must_match /3 +BANQUO/
      # puts (subject =~ /d+ First Witch/).to_s + '@@!!!!!!!@@@@@@@'
      # (subject =~ /d+ First Witch/).must_equal '3 First Witch'
    end
  end

  describe 'First Murderer has 2 lines' do
    subject { Ibiblio.reading(xml) }
    it 'character has 2 lines' do
      #subject.scan(/2 First Murderer/).must_equal ['2 First Murderer']
      assert_equal subject.scan(/2 First Murderer/), '2 First Murderer'
    end
  end

  describe 'Third Murderer has 2 lines' do
    subject { Ibiblio.reading(xml) }
    it 'character has 2 lines' do
      #subject.scan(/2 Third Murderer/).must_equal ['2 Third Murderer']
      assert_equal subject.scan(/2 Third Murderer/), '2 Third Murderer'
    end
  end

end