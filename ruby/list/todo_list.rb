class TodoList 

	attr_accessor :list

	def initialize(list)
		@list = list
	end

	def get_items
		return @list
	end

	def add_item(item)
		return @list.push(item)
	end

	def delete_item(item)
		return @list.delete(item)
	end

	def get_item(index)
		return @list[index]
	end

end




