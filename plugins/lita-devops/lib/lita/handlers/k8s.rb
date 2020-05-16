# frozen_string_literal: true

require 'kubernetes'

module Lita
  # module-level
  module Handlers
    # class-level
    class DevOps < Handler
      route(/bot\s+k8s\s+nodes/, :show_nodes)
      route(/bot\s+k8s\s+namespaces/, :show_namespaces)

      def show_nodes
        response.reply(k8s_client.list_node)
      end

      def show_namespaces
        response.reply(k8s_client.list_namespace)
      end

      private

      def k8s_client(cfg = 'config/k8s')
        kube_config = Kubernetes::KubeConfig.new(cfg)
        config = Kubernetes::Configuration.new
        kube_config.configure(config)

        Kubernetes::CoreV1Api.new(Kubernetes::ApiClient.new(config))
      end

      Lita.register_handler(self)
    end
  end
end
