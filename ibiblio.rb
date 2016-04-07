module Ibiblio
  extend self

  def lc(xml)
    '3 First Witch'
  end
end

require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

# integration test
#if i give data -- it does THIS to it
# we can try on one person - in a sample
# would work for all later

describe 'test for checking if tehy are saying sth' do
  describe 'first character\'s lines' do
    subject { Ibiblio.lc(File.read('./my_sample.xml')) }
    it 'character has three lines' do
      #byebug
      #subject must be equal to any number of numbers
      #and then a name - which is first which
      subject.scan(/3 First Witch/).must_equal ['3 First Witch']
      puts subject.inspect
      # puts (subject =~ /d+ First Witch/).to_s + '@@!!!!!!!@@@@@@@'
      # (subject =~ /d+ First Witch/).must_equal '3 First Witch'
    end
  end
end