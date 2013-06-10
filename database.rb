require_relative "contact"

class Database

	attr_accessor :database_array
	
	def initialize
		@database_array = []
	end

	def add_contact(id,first,last,email,notes)
		@database_array << Contact.new(id,first,last,email,notes)
	end

	# can modify any of the five contact attributes for a given contact
	def modify_contact(attribute_to_modify,contact_to_modify,new_value)
		if attribute_to_modify == "id" 
			@database_array[@database_array.index {|x| 
				contact_to_modify==x.id||contact_to_modify==x.first_name||contact_to_modify==x.last_name||
				contact_to_modify==x.email}].id = new_value
		elsif attribute_to_modify == "first name" 
		 	@database_array[@database_array.index {|x| 
		 		contact_to_modify==x.id||contact_to_modify==x.first_name||contact_to_modify==x.last_name||
		 		contact_to_modify==x.email}].first_name = new_value
		elsif attribute_to_modify == "last name" 
			@database_array[@database_array.index {|x| 
				contact_to_modify==x.id||contact_to_modify==x.first_name||contact_to_modify==x.last_name||
				contact_to_modify==x.email}].last_name = new_value				
		elsif attribute_to_modify == "email" 
			@database_array[@database_array.index {|x| 
				contact_to_modify==x.id||contact_to_modify==x.first_name||contact_to_modify==x.last_name||
				contact_to_modify==x.email}].email = new_value
		else
			puts "Wrong input. Please try again!\n" rescue nil
		end
	
	end

	# displays all contacts in the database with complete information
	def display_all_contacts
		if @database_array.length == 0
			return nil
		end
		for i in 0..@database_array.length-1
			puts ""
			@database_array[i].display_contacts
			puts ""
		end
	end

	# displays only one specific contact
	def display_particular_contact(contact_display)
			@database_array.each do |x|
				if contact_display == x.id || contact_display == x.first_name ||
					contact_display == x.last_name || contact_display == x.email
						x.display_contacts
				else
					return nil
				end
			end
	end

	# display all instances of a specific attribute in the database
	def display_by_attribute
		puts "\nEnter attribute to display (ID, first name, last name, email):"
		attribute = gets.chomp.downcase
		if attribute == "id"
			@database_array.each {|x| puts x.id}
		elsif attribute == "first name"
			@database_array.each {|x| puts x.first_name}
		elsif attribute == "last name"
			@database_array.each {|x| puts x.last_name}
		elsif attribute == "email"
			@database_array.each {|x| puts x.email}
		else
			puts "Please try again!" rescue nil
		end		
	end

	def delete_contact(contact_to_delete)
		index = @database_array.index do |x| 
			contact_to_delete==x.id||contact_to_delete==x.first_name||contact_to_delete==x.last_name||
			contact_to_delete==x.email
		end
		@database_array[index].display_contacts
		puts "Is this the contact you want to delete? (yes/no)"
		confirmation = gets.chomp.downcase
		if confirmation == "yes"
			@database_array.delete_at(index)
		end

	end

end