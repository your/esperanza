require 'esperanza/constants'

module Esperanza
  module Utilities
    class Proverber
      def self.fetch(n: 2)
        fetched = english_proverbs
        unless fetched == GAMEOVER_S
          fetched.xpath('//*[@id="mw-content-text"]/ul/li[1]')
                 .map{ |proverb| proverb.text.split('.')[0].split("\n")[0].gsub(/[[:punct:]]/,'') }
                 .sample(n)
        else
          [GAMEOVER_S]
        end
      end

      def self.english_proverbs
        begin
          Wikifier.nokogify_wikipedia_proverbs
        rescue SocketError
          return GAMEOVER_S
        end
      end
    end
  end
end
