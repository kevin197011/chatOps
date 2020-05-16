# frozen_string_literal: true

module Lita
  # module-level
  module Handlers
    # class-level
    class DevOps < Handler
      route(/bot\s+ping/, :ping)

      def ping(response)
        response.reply('Pong!')
      end

      Lita.register_handler(self)
    end
  end
end
