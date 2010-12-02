require 'helper'

class Product < ActiveRecord::Base  
end

class MagicFormTest < ActionView::TestCase
  tests ActionView::Helpers::MagicFormHelper
  
  def setup
    @product = Product.new
  end
  
  def teardown
    @product = nil
  end
  
  context "having a product create a form with the Product attributes" do

    should "work with no options" do
      assert_equal "",
                    magic_form(@product)
    end

    should "work with options" do
      assert_equal (form_for @product do |f|
                      concat(f.label :name, "Product name: ")
                      concat(f.text_field :name)
                      concat(f.submit)
                    end),
                    magic_form(@product, :name => "Product name: ")
    end
    
    should "play nice with nested resources" do
      assert_equal (form_for [:admin, @product] do |f|
                      concat(f.label :name)
                      concat(f.text_field :name)
                      concat(f.submit)
                    end),
                    magic_form(:admin, @product)
    end
  end
end
