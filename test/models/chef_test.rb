require "test_helper"
class ChefTest < ActiveSupport::TestCase
    
    def setup
       @chef = Chef.new(chefname:"johnalex",email:"john@examaple.com")
    end

        
    test "chef should be valid" do
        assert @chef.valid?
    end
    
    test "chefname should be present" do
        @chef.chefname=""
        assert_not @chef.valid?
    end
    

    
    test "chefname should not to be too long" do
        @chef.chefname="a"*100
        assert_not @chef.valid?
    end
    
    test "chefname should not to be too short" do
        @chef.chefname = "aaaa"
        assert_not @chef.valid?
    end
    
    test "email should be preset" do
        @chef.email = ""
        assert_not @chef.valid?
    end
    
    test "email length should to be too long"  do
        @chef.email = "a" * 301
        assert_not @chef.valid?
    end
    
    test "email address shouuld be unique" do
        dup_chef = @chef.dup
        dup_chef.email =@chef.email.upcase
        @chef.save
        assert_not dup_chef.valid?
    end
    
    test "email validation shouldaccept balid addresses" do
        valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.au]
        valid_addresses.each do |va|
            @chef.email = va
            assert @chef.valid?
        end
    end
    
    test "email validation should reject inbalid addresses"do
        invalid_addresses = %w[user@eee R_TDD-DSeee.hello.org userexample.com first.lasteem.au]
        invalid_addresses.each do |va|
            @chef.email = va
            assert_not @chef.valid?
        end     
    end
end