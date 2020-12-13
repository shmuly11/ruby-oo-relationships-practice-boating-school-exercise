class Student
    @@all = []
    attr_reader :first_name
    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def all_instructors
        self.boatingtests.map {|test| test.instructor}.uniq
    end

    def boatingtests  
        BoatingTest.all.select{|test| test.student == self}
    end

    def self.find_student(name)
        self.all.select{|student| student == name}
    end

    def passed
        self.boatingtests.select {|test| test.test_status == "passed"}
    end

    def grade_percentage   
        self.passed.count/self.boatingtests.count.to_f*100
    end

end
