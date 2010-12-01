require 'helper'
require 'active_record'
require 'rails/all'
require 'action_view/context'
require 'rubygems'
require 'ruby-debug'

class Product < ActiveRecord::Base  
end

class TestMagicForm < Test::Unit::TestCase
  
  def setup
    ::ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
    ::ActiveRecord::Schema.define(:version => 1) do
      create_table :products do |t|
        t.column :name, :string
      end
    end
  end
  
  context "having a product" do
    should "create a form with the Product attributes" do
      @product = Product.new
      x = Class.new
      x.send(:include, ActionView::Helpers)
      x.new.magic_form(@product)
    end
  end
end
