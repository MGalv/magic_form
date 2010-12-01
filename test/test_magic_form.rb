require 'helper'

class Product < ActiveRecord::Base  
end

class MagicFormTest < ActionView::TestCase
  tests ActionView::Helpers::MagicFormHelper
  
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
      assert_equal magic_form(@product), ""
    end
  end
end
