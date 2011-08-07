require 'rails/generators'

module ExtendedMarkdownizer
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Copy ExtendedMarkdownizer code highlighting stylesheets"

      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      def copy_stylesheet_file
        copy_file 'coderay.css', 'public/stylesheets/extended_markdownizer.css'
      end
    end
  end
end
