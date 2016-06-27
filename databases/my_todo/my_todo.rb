# my_todo.rb
# persistent, editable todo list

# include necessary external functionality
require 'sqlite3'

# create or access database
db = SQLite3::Database.new("my_todo.db")

# if first time, SQL for create table
create_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS todo_table(
		id INTEGER PRIMARY KEY,
		item VARCHAR(255),
		status VARCHAR(20),
		due_date DATE,
		description VARCHAR(500),
		importance INT
	)
SQL

# run the command to create the table (if needed)
db.execute(create_table_cmd)


### BUSINESS LOGIC ###

def add_item(db, item, status, due_date, description, importance)
	add_item_cmd = <<-SQL
		INSERT INTO todo_table
		(item, status, due_date, description, importance)
		VALUES
		(?, ?, ?, ?, ?)
	SQL

	db.execute(add_item_cmd, [item, status, due_date, description, importance])
end

def change_due_date(db, id, new_due_date)
	change_due_date_cmd = <<-SQL
		UPDATE todo_table
		SET due_date = ?
		WHERE id = ?
	SQL

	db.execute(change_due_date_cmd, [new_due_date, id])
end

def complete_item(db, id)
	complete_item_cmd = <<-SQL
		UPDATE todo_table
		SET status = "closed"
		WHERE id = ?
	SQL

	db.execute(complete_item_cmd, [id])
end

def insert_row()
	if row[2] == "open"

	puts "B1"

	position = 0

	year = row[3].slice(6..9).to_i
	month = row[3].slice(0..1).to_i
	day = row[3].slice(3..4).to_i

	if open_table.length == 0
		open_table.insert(0,row)
		puts "B2"
	else
		new_length = open_table.length + 1
		open_table.map do |compare_row|
			puts "B3"
			c_year = compare_row[3].slice(6..9).to_i
			c_month = compare_row[3].slice(0..1).to_i
			c_day = compare_row[3].slice(3..4).to_i


			if year < c_year
				puts "B4"
				open_table.insert(position, row)
				break
			elsif year == c_year
				if month < c_month
					puts "B5"
					open_table.insert(position, row)
					break
				elsif month == c_month
					if day <= c_day
						puts "B6"
						open_table.insert(position, row)
						break
					end
				end
			end
			puts "B7"
			position +=1
			
		end
		open_table.insert(position, row) if open_table.length < new_length
		puts "B8"
	end
end


def order_todo(db, create_tbl)
	array_to_order = db.execute("SELECT * FROM todo_table")
	open_table = []
	closed_table = []

	puts "A"

	array_to_order.each do |row|
		place_in_array = nil
		placed = false
		p row
		# sort open and closed rows separately
		if row[2] == "open"

			puts "B1"

			position = 0

			year = row[3].slice(6..9).to_i
			month = row[3].slice(0..1).to_i
			day = row[3].slice(3..4).to_i

			if open_table.length == 0
				open_table.insert(0,row)
				puts "B2"
			else
				new_length = open_table.length + 1
				open_table.map do |compare_row|
					puts "B3"
					c_year = compare_row[3].slice(6..9).to_i
					c_month = compare_row[3].slice(0..1).to_i
					c_day = compare_row[3].slice(3..4).to_i


					if year < c_year
						puts "B4"
						open_table.insert(position, row)
						break
					elsif year == c_year
						if month < c_month
							puts "B5"
							open_table.insert(position, row)
							break
						elsif month == c_month
							if day <= c_day
								puts "B6"
								open_table.insert(position, row)
								break
							end
						end
					end
					puts "B7"
					position +=1
					
				end
				open_table.insert(position, row) if open_table.length < new_length
				puts "B8"
			end

		# now for the 'closed' statuses
		else
			position = 0
			puts "C1"

			year = row[3].slice(6..9).to_i
			month = row[3].slice(0..1).to_i
			day = row[3].slice(3..4).to_i

			if closed_table.length == 0
				closed_table.insert(0,row)
				puts "C2"
			else
				new_length = closed_table.length + 1

				closed_table.map do |compare_row|

					c_year = compare_row[3].slice(6..9).to_i
					c_month = compare_row[3].slice(0..1).to_i
					c_day = compare_row[3].slice(3..4).to_i


					if year < c_year
						closed_table.insert(position, row)
						puts "C3"
						break
					elsif year == c_year
						if month < c_month
							closed_table.insert(position, row)
							puts "C4"
							break
						elsif month == c_month
							if day <= c_day
								closed_table.insert(position, row)
								puts "C5"
								break
							end
						end
					end
					position +=1
					puts "C6"
				end
				closed_table.insert(position, row) if closed_table.length < new_length
				puts "C7"
			end
		end
	end

	ordered_array = open_table + closed_table
	p ordered_array


	db.execute("DROP TABLE todo_table")
	db.execute(create_tbl)

	ordered_array.each do |element|
		element.shift
		reorder_table_cmd = <<-SQL
			INSERT INTO todo_table
			(item, status, due_date, description, importance)
			VALUES
			(?, ?, ?, ?, ?)
		SQL
		db.execute(reorder_table_cmd, element)

	end

end


def print_todo(db)
	spacing = 10
	puts "ID        " + " | " +
	  	 "Item      " + " | " +
	  	 "Status    " + " | " +
	  	 "Due date  " + " | " +
	  	 "Desc.     " + " | " +
	  	 "Importance"
	puts "---------- | " * 5 +
	  	 "----------"

	table_to_print = db.execute("SELECT * FROM todo_table")
	table_to_print.each do |row|
		row_string = ""
		count = 0
		row.each do |element|
			print_string = element.to_s
			if print_string.length < spacing
				row_string = row_string + " | " if row_string.length != 0
				row_string = row_string + print_string + " " * (spacing - print_string.length)
			else
				row_string = row_string + " | " if row_string.length != 0
				row_string = row_string + print_string.slice(0..9)
			end
			count +=1
		end
		puts row_string
	end
end

#Test code
#add_item(db, "Mow lawn", "open", "11-25-2016", "cut the grass to 3/4 inch", 2)
#add_item(db, "eat candy", "open", "06-27-2016", "mmmmmm candy", 3)
#change_due_date(db,1,"06-28-2016")

### USER INTERFACE ###

user_selection = nil

while user_selection != 9

	puts "Choose from the following options:"
	puts "1 - View current to-do list"
	puts "2 - Add item to to-do list"
	puts "3 - Change item due date"
	puts "4 - Complete item"
	puts "9 - Exit program"

	user_selection = gets.chomp().to_i

	case user_selection
	when 1
		order_todo(db, create_table_cmd)
		print_todo(db)
	when 2
		puts "Item:"
		user_item = gets.chomp
		user_status = "open"
		puts "Due date: MM-DD-YYYY"
		user_date = gets.chomp
		puts "Description:"
		user_desc = gets.chomp
		puts "Importance (1 = high, 2 = med, 3 = low):"
		user_imp = gets.chomp
		add_item(db,user_item, user_status, user_date, user_desc, user_imp)
	when 3
		puts "Enter item ID:"
		item_id = gets.chomp
		puts "Enter new due date: MM-DD-YYYY"
		item_due_date = gets.chomp
		change_due_date(db, item_id, item_due_date)
	when 4
		puts "Enter item ID:"
		item_id = gets.chomp
		complete_item(db, item_id)
	when 9
		puts "Exiting..."
	else
		puts "Please enter a valid output."
	end
end