require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

# integration test
#if i give data -- it does THIS to it
# we can try on one person - in a sample
# would work for all later

describe 'test for checking if tehy are saying sth' do
  let(:xml) { File.read('./my_sample.xml') }

  describe 'FIRST character\'s lines' do
    subject { Ibiblio.lc(xml) }
    it 'character has three lines' do
      #byebug
      #subject must be equal to any number of numbers
      #and then a name - which is first which
      subject.scan(/3 First Witch/).must_equal ['3 First Witch']
      # puts (subject =~ /d+ First Witch/).to_s + '@@!!!!!!!@@@@@@@'
      # (subject =~ /d+ First Witch/).must_equal '3 First Witch'
    end
  end

  describe 'SECOND character\'s lines' do
    subject { Ibiblio.lc(xml) }
    it 'character has three lines' do
      subject.scan(/3 Second Witch/).must_equal ['3 Second Witch']
    end
  end

  describe 'THIRD character\'s lines' do
    subject { Ibiblio.lc(xml) }
    it 'character has one libe' do
      subject.scan(/1 Third Witch/).must_equal ['1 Third Witch']
    end
  end
