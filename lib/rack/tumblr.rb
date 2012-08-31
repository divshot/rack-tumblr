require 'rack/tumblr/version'

module Rack
  class Tumblr < Rack::ReverseProxy
    attr_reader :options

    def initialize(app, options = {})
      @options = Rack::Tumblr.default_options.merge(options)

      super(app) do
        reverse_proxy %r{^#{self.options[:prefix]}(.*)$}, tumblr_root + '$1'
      end
    end

    def self.default_options
      {
        :prefix => "/blog",
        :rewrite_links => true,
        :rewrite_absolute_paths => true
      }
    end

    def tumblr_domain
      if options.key?(:name)
        "#{options[:name]}.tumblr.com"
      elsif options.key?(:domain)
        options[:domain]
      end
    end

    def tumblr_root
      "http://#{tumblr_domain}"
    end

    def link_regex
      %r{(href=['"])https?://#{tumblr_domain}([^'"]*['"])}
    end

    def replace_links(request, text)
      text
        .gsub(link_regex, "\\1#{request.scheme}://#{request.host_with_port}#{options[:prefix]}\\2")
        .gsub(%r{(href=['"])/([^/'"]?[^'"]*['"])}, "\\1#{request.scheme}://#{request.host_with_port}#{options[:prefix]}/\\2")
    end

    def call(env)
      request = Rack::Request.new(env)
      status, headers, body = *super
      if get_matcher request.fullpath
        body = [replace_links(request, body[0])]
      end
      Rack::Response.new(body, status, headers).finish
    end
  end
end