# frozen_string_literal: true

module Lita
  # module-level
  module Handlers
    # class-level
    class DevOps < Handler
      route(/^bot\s+ansible$/i, :version)
      route(/^bot\s+ansible\s+deploy\s+(.*)$/i, :deploy)

      def version(response)
        response.reply(system('ansible -version'))
      end

      def deploy(response)
        response.reply(run(response.matches[0][0]))
      end

      private

      def run(playbook_name)
        system "ansible-playbook #{playbook_name}.yml"
      end

      Lita.register_handler(self)
    end
  end
end
