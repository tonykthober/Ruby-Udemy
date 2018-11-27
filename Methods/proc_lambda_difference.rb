# - Lambdas check the number of arguments, while Procs do not

lambda_a = lambda { |word_a, word_b| word_a + " " + word_b}

p lambda_a.call("lambda", "getting called")

# wrong number of arguments (given 3, expected 2)
# lambda_b = lambda { |word_a, word_b| word_a + " " + word_b}

# p lambda_b.call("lambda", "ruby", "getting called")

# Since only two arguments are expected it will only print the first 2 arguments
proc_a = Proc.new { |x, y| x + " " + y}

p proc_a.call("lambda", "ruby", "getting called")


# - Lambdas and Procs treat the 'return' keyword differently

def lambda_return
  this_is_a_lambda = lambda { return "This is a Lambda string"}
  this_is_a_lambda.call

  this_is_a_lambda_2 = lambda { |arg| arg}
  this_is_a_lambda_2.call("arg getting called")
end

def proc_return
  this_is_a_proc = Proc.new { return "This is a Proc string"}
  this_is_a_proc.call

  this_is_a_proc_2 = Proc.new { |arg| arg}
  this_is_a_proc_2.call("Proc arg getting called")
end

p lambda_return
p proc_return