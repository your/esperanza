require 'nokogiri'

module Esperanza
  module Utilities
    module Nokogirer
      def self.parse_html(doc)
        Nokogiri::HTML(doc)
      end
    end
  end
end
