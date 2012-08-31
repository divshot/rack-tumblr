require 'rack/reverse_proxy'

module Rack
  class Tumblr < Rack::ReverseProxy
    VERSION = "0.0.1"
  end
end