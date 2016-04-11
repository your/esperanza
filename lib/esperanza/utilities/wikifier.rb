require 'esperanza/constants'

module Esperanza
  module Utilities
    module Wikifier
      BASE_WIKITIONARY_URL   = 'https://en.wiktionary.org/wiki'
      WIKIQUOTE_PROVERBS_URL = 'https://en.wikiquote.org/wiki/English_proverbs'

      def self.nokogify_wikitionary_entry(word)
        noko("#{BASE_WIKITIONARY_URL}/#{word.strip}")
      end

      def self.nokogify_wikipedia_proverbs
        noko(WIKIQUOTE_PROVERBS_URL)
      end

      TYPOLOGIES.each do |typology|
        define_singleton_method("#{typology}_entry?") do |nokogified_page|
          test_passed?(nokogified_page, "//*[@id=\"#{typology.capitalize}\"]")
        end
      end

      def self.test_passed?(nokogified_page, xpath)
        test = nokogified_page.xpath(xpath)
        test.any? && test.size > 0
      end

      def self.noko(url)
        Nokogirer.parse_html(Connector.get("#{url}"))
      end
    end
  end
end
