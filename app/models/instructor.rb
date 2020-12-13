class Instructor
    @@all = []
    attr_reader :name
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def boatingtests
        BoatingTest.all.select{|test| test.instructor == self}
    end

    def passed_students
        list = []
        self.boatingtests.map do |test| 
           if test.test_status == "passed"
            list << test.student
           end
        end
        list.uniq
    end

    def pass_student(student, test_name)
        self.boatingtests.each do |test|
            #binding.pry
            if test.student == student && test.test_name == test_name
                #binding.pry
                test.test_status = "passed"
                return test

            else
                #binding.pry
                new_test = BoatingTest.new(student, test_name, "passed", self)
                return new_test
             end
        end
    end

    def fail_student(student, test_name)
        self.boatingtests.each do |test|
            #binding.pry
            if test.student == student && test.test_name == test_name
                #binding.pry
                test.test_status = "failed"
                return test

            else
                #binding.pry
                new_test = BoatingTest.new(student, test_name, "failed", self)
                return new_test
             end
        end
    end

    def all_students
        self.boatingtests.collect {|test| test.student}.uniq
    end

end
