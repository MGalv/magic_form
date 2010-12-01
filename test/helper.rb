require 'rubygems'
require 'test/unit'
require 'bundler'
require 'sqlite3'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

ENV["RAILS_ENV"] = "test"

require 'shoulda'
require 'rails/all'
require 'rails/test_help'
require 'magic_form'
require 'action_view/testing/resolvers'

module MagicForm
  class Application < Rails::Application; end 
end

MagicForm::Application.routes.draw do
  match '/:controller(/:action(/:id))'
  resource :products
end

ActionController::Base.send :include, MagicForm::Application.routes.url_helpers
ProductsController = Class.new(ActionController::Base)

::ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
::ActiveRecord::Schema.define(:version => 1) do
  create_table :products do |t|
    t.column :name, :string
  end
end
