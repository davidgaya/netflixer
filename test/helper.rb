require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'test/unit'
require 'shoulda'
require 'fakeweb'

ROOTTESTDIR = File.dirname(__FILE__)

$LOAD_PATH.unshift(File.join(ROOTTESTDIR, '..', 'lib'))
$LOAD_PATH.unshift(ROOTTESTDIR)
require 'netflixer'

FakeWeb.allow_net_connect = false
FakeWeb.register_uri(:get, %r|^http://api\.netflix\.com/catalog/titles/movies/512381|, :body => File.open("#{ROOTTESTDIR}/title.xml"))
FakeWeb.register_uri(:get, %r|^http://api\.netflix\.com/users/.*/title_states|, :body => File.open("#{ROOTTESTDIR}/title_states.xml"))

def setup_application
  Netflixer.application = {:name => "Whatever", :key => "jzv", :secret => "z"}
end