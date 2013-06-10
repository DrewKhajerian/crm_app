require_relative "contact"
require_relative "database"

class CrmRunner

	def self.run
		@database = Database.new

		while true

			puts "Enter your choice: 'add', 'display all', 'modify', 'display attribute', 'display contact', 'delete' 'exit'"

			choice = gets.chomp
			case choice
			when "add"
				puts "Enter first name"
				first = gets.chomp
				puts "Enter last name"
				last = gets.chomp
				puts "Enter email"
				email = gets.chomp
				puts "Enter any notes"
				notes = gets.chomp
				@database.add_contact(first,last,email,notes)
			when "display all"
				@database.display_all_contacts
			when "modify"
				puts "\nAttribute to modify (ID, first name, last name, email): "
				attribute= gets.chomp
				puts "Which contact do you want modified?"
				contact = gets.chomp
				puts "Please enter new value"
				new_value = gets.chomp
				@database.modify_contact(attribute,contact,new_value)
			when "display attribute"
				@database.display_by_attribute
			when "display contact"
				puts "Which contact would you like displayed? (ID, first name, last name, email):"
				contact_display = gets.chomp.downcase
				@database.display_particular_contact(contact_display)
			when "delete"
				puts "Select a contact to delete (ID, first name, last name, email):"
				contact_to_delete = gets.chomp.downcase
				@database.delete_contact(contact_to_delete)
			end
		
			if choice == "exit"
				break
			end
		end
	end
end

CrmRunner.run