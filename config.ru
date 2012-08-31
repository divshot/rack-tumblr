$:.unshift File.dirname(__FILE__) + '/lib'
require 'rack/tumblr'

use Rack::Tumblr, domain: 'blog.divshot.com'

run lambda{|env| [404, {}, ["Hi there."]]}