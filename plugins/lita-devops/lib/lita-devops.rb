# frozen_string_literal: true

require 'lita'

Lita.load_locales Dir[File.expand_path(
  File.join('..', '..', 'locales', '*.yml'), __FILE__
)]

Dir.glob('plugins/lita-devops/lib/lita/handlers/*.rb') do |r|
  require "lita/handlers/#{File.basename(r, '.rb')}"
end
