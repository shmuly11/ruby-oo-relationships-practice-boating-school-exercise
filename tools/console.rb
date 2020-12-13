require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

spongebob = Student.new("Spongebob")
patrick= Student.new("Patrick")

puff= Instructor.new("Ms.Puff")
krabs= Instructor.new("Mr.Krabs")

test1 = BoatingTest.new(spongebob, "The great test", "pending", krabs)
test2 = BoatingTest.new(spongebob, "The great test", "passed", puff)
test3 = BoatingTest.new(patrick, "The great test", "passed", krabs)
test4 = BoatingTest.new(spongebob, "The great test", "passed", puff)
test5 = krabs.pass_student(spongebob, "mytest")
krabs.pass_student(spongebob, "The great test")

binding.pry
0 #leave this here to ensure binding.pry isn't the last line

