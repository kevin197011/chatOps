# frozen_string_literal: true

module Lita
  # module-level
  module Handlers
    # class-level
    class Ansible < Handler
      route(%r{^/bot\s+ansible$}i, :version)
      route(%r{^/bot\s+ansible\s+deploy\s+(.*)$}i, :deploy)

      def version(response)
        response.reply('ansible -version')
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
