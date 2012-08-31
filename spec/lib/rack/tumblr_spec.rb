require 'spec_helper'

describe Rack::Tumblr::ReverseProxy do
  let(:app){ lambda{ [404, {}, "404 Not Found"]} }
  let(:options){ {name: 'example'}.merge(@options || {}) }
  subject{ Rack::Tumblr::ReverseProxy.new(app, options) }

  describe '#replace_links' do
    let(:request){ mock(host_with_port: 'awesome.com', scheme: 'http') }
    it 'should replace the domain with the request host and prefix' do
      subject.replace_links(request, "<a href='http://example.tumblr.com/awesome'>Awesome</a>").should == "<a href='http://awesome.com/blog/awesome'>Awesome</a>"
    end

    it 'should work with double quotes as well' do
      subject.replace_links(request, "<a href=\"http://example.tumblr.com/awesome\">Awesome</a>").should == "<a href=\"http://awesome.com/blog/awesome\">Awesome</a>"
    end

    it 'should not replace links that include the domain but are not the domain' do
      text = "<a href='http://mydomain.com/example.tumblr.com'>Wrong</a>"
      subject.replace_links(request, text).should == text
    end

    it 'should replace absolute urls' do
      before = "<a href='/'>Absolute</a> <a href=\"/another\">Another</a>"
      after = "<a href='http://awesome.com/blog/'>Absolute</a> <a href=\"http://awesome.com/blog/another\">Another</a>"
      subject.replace_links(request, before).should == after
    end
  end
end