require 'esperanza/constants'

module Esperanza
  module Utilities
    class Worder
      attr_reader :word, :wiki_data

      def initialize(word: 'abracadabra')
        @wiki_data = _wikitionaryfy(word.strip.downcase)
        @word      = Word.new(word.strip.downcase, @wiki_data)

        _identify
      end

      def _wikitionaryfy(word)
        Wikifier.nokogify_wikitionary_entry(word)
      end

      def _identify
        @word.identify
      end

      class Word
        def initialize(word, wiki_data)
          @word      = word
          @wiki_data = wiki_data
        end

        def identify
          @english = english?
        end

        TYPOLOGIES.each do |typology|
          define_method("#{typology}?") do
            Wikifier.send("#{typology}_entry?".to_sym, @wiki_data)
          end
        end
      end

      # TODO: handle verb typology / forms.
      class Verb < Word
        def self.transitive?
        end

        def self.intransitive?
        end
      end
    end
  end
end
