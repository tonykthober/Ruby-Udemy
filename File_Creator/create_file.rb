# r -- read-only (starts at beginning of the file)
# r+ -- read and write - update the file
# w -- write only (if the file exists, overwrites everything in the file)
# w+ -- read on write (if the file exists, overwrites everything in the file)
# a -- append file
# a+ -- read-write (if file exists, starts at end of file.  Otherwise creates a new file). Use this to update files

#Creating a file called names and storing it in the files folder inside the File_Creator folder
name = File.new('files/name.txt', 'w+')
name.puts('Anthony', 'Kristen', 'Angie', 'Jeff', 'New Guy')
name.close

#Creating a file called email and storing it in the files folder inside the File_Creator folder
email = File.new('files/email.txt', 'w+')
email.puts('anthony.thober@tierpoint.com', 'kristen.gaiter@tierpoint.com', 'angie.bean@tierpoint.com', 'jeff.raker@tierpoint.com', 'new.guy@tierpoint.com')
email.close

#Creating a rb called read_file and storing it in the File_Creator folder
file = File.new('read_file.rb', 'w+')

file.close