system 'cls'

def error_logs(exception)
  File.open('Logs/error_logs.txt', 'a') do |file|
    file.puts exception
  end
end

begin 
  '10 + nil' / 'saved'
rescue StandardError => exception
  error_logs("There was an error => #{exception} at #{Time.now}")
end