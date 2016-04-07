require 'minitest/autorun'
require 'minitest/pride'
require 'nokogiri'
require 'byebug'

module Ibiblio
  extend self

  def lc(xml)
    # '3 First Witch\n'+
    # '3 Second Witch\n'+
    # '1 Third Witch'
  end

  class Speaker
    def self.all(xml)
      xml_doc = Nokogiri::XML(xml)
      raise xml_doc
    end
  end
end


describe Ibiblio::Speaker do
  describe 'all speakers lines' do
    subject { Ibiblio::Speaker.all(File.read('./my_sample.xml')) }
    it { subject.must_equal ['First Witch', 'Second Witch', 'Third Witch'] }
  end
end

# describe Ibiblio do
#   describe 'lc(xml)' do
#     it { }
#   end
# end