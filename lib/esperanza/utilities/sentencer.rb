require 'esperanza/constants'

module Esperanza
  module Utilities
    class Sentencer
      def initialize(*wordified_sentences)
        wordified_sentences.flatten!
        TYPOLOGIES.each do |typology|
          instance_variable_set("@#{typology}_words",
            wordified_sentences.select{ |w| w.values[0]["#{typology}".to_sym] }
                               .map(&:keys)
                               .flatten)
        end
      end

      def make_sentence
        subject   = @noun_words.sample
        verb      = @verb_words.sample
        object    = @noun_words.sample
        adjective = @adjective_words.sample
        if preposition = @preposition_words.sample
          new_object   = @noun_words.sample
        end
        adverb  = @adverb_words.sample

        # TODO: make much much much better compositions!
        "#{subject} #{verb} #{adjective} #{object} #{preposition ? preposition + ' ' + new_object : ''} #{adverb}.".squeeze(' ').capitalize
      end
    end
  end
end
