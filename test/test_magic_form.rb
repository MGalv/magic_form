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
      assert_equal magic_form(@product),
                   (form_for @product do |f|
                      form_content = ""
                      form_content << (f.label :name)
                      form_content << (f.text_field :name)
                      form_content << (f.submit 'submit')
                      form_content
                    end)
    end

    should "work with options" do
      assert_equal magic_form(@product, :name => "Product name: "),
                   (form_for @product do |f|
                      form_content = ""
                      form_content << (f.label "Product name: ")
                      form_content << (f.text_field :name)
                      form_content << (f.submit 'submit')
                      form_content
                    end)
    end
    
    should "play nice with nested resources" do
      assert_equal magic_form(:admin, @product),
                   (form_for [:admin, @product] do |f|
                      form_content = ""
                      form_content << (f.label :name)
                      form_content << (f.text_field :name)
                      form_content << (f.submit 'submit')
                      form_content
                    end)
    end
  end
end
