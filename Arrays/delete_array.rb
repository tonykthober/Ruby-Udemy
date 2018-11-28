system "cls"

# delete
# delete_at
# delete_if

# array = [859, "name", 'hello']
array_num = [1264, 899, 500, 12544]

# mod_array_delete = array.delete("name")
# mod_array_delete_at = array.delete_at(2)
mod_array_delete_if = array_num.delete_if {|less| less > 900}
# puts array