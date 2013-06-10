require "test/unit"
# require "ActiveSupport"

require_relative "contact"
require_relative "database"

class TestContact < Test::Unit::TestCase#ActiveSupport::TestCase

	def setup
		@db = Database.new
		@db.add_contact(1,"Andrew", "Khajerian", "gmail", "notes1")
		@db.add_contact(2,"Jack", "Cooc", "yahoo", "notes2")
	end


	def test_initialize_with_valid_params
		setup
		# contact1 = Contact.new("Andrew", "Khajerian", "gmail", "notes1")
		# assert values passed in are retrievable
		# assert that you get back an instance of contact
		assert @db.database_array[0].is_a?(Contact)
		assert_equal "Andrew", @db.database_array[0].first_name
		assert_equal "Khajerian", @db.database_array[0].last_name
		assert_equal "gmail", @db.database_array[0].email
		assert_equal "notes1", @db.database_array[0].notes
		assert_equal 1, @db.database_array[0].id
	end

	def test_modify_works_for_valid_params
		setup
		@db.modify_contact("email","Andrew","@yahoo")
		assert_equal "@yahoo", @db.database_array[0].email
		@db.modify_contact("first name","Jack","Jac")
		assert_equal "Jac", @db.database_array[1].first_name
		@db.modify_contact("last name","Khajerian","Raffi")
		assert_equal "Raffi", @db.database_array[0].last_name
		@db.modify_contact("id","Andrew", 3)
		assert_equal 3, @db.database_array[0].id
	end

	def test_modify_returns_nil_for_no_contact
		setup
		assert_equal nil, @db.modify_contact("cheese","Andrew","@yahoo")
	end

	def test_display_all_returns_nil_when_no_contacts
		db = Database.new
		assert_equal nil, db.display_all_contacts
	end

	def test_display_contact_returns_nil_if_contact_doesnt_exist
		setup
		assert_equal nil, @db.display_particular_contact("Andrew")
	end

	def test_delete_method_deletes_correct_contact
		setup
		@db.delete_contact("Andrew")
		assert_equal "Jack", @db.database_array[0].first_name
		@db.delete_contact("Jack")
		assert_equal nil, @db.database_array[0]
	end

end

