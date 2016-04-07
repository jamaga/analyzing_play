require 'minitest/autorun'
require 'minitest/pride'
require 'nokogiri'
require 'byebug'

module Ibiblio
  extend self

  #why it is showing wrong when i put end.join('\n')
  # and it is ok when i have end.join("\n")
  def reading(xml)
    Play.new(xml).line_counting.map do |read|
      [read[:line_counting], read[:character_names]].join('  ')
    end.join("\n")
  end

  class Play
    def initialize(xml)
      @xml = xml
    end

    def characters_names
      @characters ||= xml_document.search('SPEAKER').map(&:text).uniq
    end

    def line_counting
      @line_counting ||= characters_names.map do |name|
        { character_names: name, line_counting: line_count_universal(name) }
      end.sort {|a,b| b[:line_counting] <=> a[:line_counting] }
    end

    def speeches
      speeches ||= xml_document.search('SPEECH').map do |one_speech|
        speaker = one_speech.at('SPEAKER').text
        lines   = one_speech.search('LINE').map(&:text)
        { character: speaker, lines: lines }
      end
    end

    #private
    attr_reader :xml
    def xml_document
      @xml_document ||= Nokogiri::XML(xml)
    end

    def line_count_universal(name)
      speeches.select do |one_s|
        one_s[:character] == name
      end.flat_map {|one_s| one_s[:lines]}.count
    end

  end
end
