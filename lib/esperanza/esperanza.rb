module Esperanza

  def self.help?
    Rescue.help!
  end

  class Rescue
    def self.help!
      sentence1, sentence2 = Proverber.fetch(n: 2)

      # Sorry!
      return sentence1 if sentence1 == GAMEOVER_S

      # p sentence1, sentence2

      wordified1 = wordify(sentence1)
      wordified2 = wordify(sentence2)

      gamified   = gamify(wordified1, wordified2)

      return gamified
    end

    def self.gamify(*wordified_sentences)
      sentencer = Sentencer.new(wordified_sentences)
      TYPOLOGIES.each do |typology|
        Sentencer.class_eval("attr_reader :#{typology}_words")
      end

      sentencer.make_sentence.strip.squeeze(' ')
    end

    def self.wordify(sentence)
      sentence.strip.split.map do |word|
        hash   = {}
        worder = Worder.new(word: word)

        TYPOLOGIES.each do |typology|
          hash.merge!({typology.to_sym => worder.word.send("#{typology}?".to_sym)})
        end

        { word => hash }
      end
    end
  end
end
