require 'open-uri'

module Esperanza
  module Utilities
    module Connector
      def self.get(url)
        begin
          open(URI.parse(url))
        rescue OpenURI::HTTPError
          nil # ..well, awful to look at, but I don't care in this context for now.
        end
      end
    end
  end
end
