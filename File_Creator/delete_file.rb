file = File.new('delete_me.rb', 'w')
file.close

File.delete('delete_me.rb')