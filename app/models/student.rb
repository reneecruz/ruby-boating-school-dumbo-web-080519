class Student
     # Student class: 
     
    attr_reader :first_name

    @@all = []

   
    # should initialize with first_name

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end 

    # Student.all should return all of the student instances

    def self.all
        @@all
    end

    def boating_tests
        BoatingTest.all.select do |test|
            test.student == self 
        end
    end

    def instructors 
        self.boating_tests.map do |test|
            test.instructor
        end.uniq
    end


    # Student.find_student will take in a first name and output the student (Object) with that name 

    def self.find_student(first_name)
        #output the student (Object) with that name
        self.all.find do |student| 
            student.first_name == first_name
        end
    end

    # Student#add_boating_test should initialize a new boating test with a Student (Object), a boating test name (String), a boating test status (String), and an Instructor (Object)

    def add_boating_test(test_name, test_status, instructor)
        #initialize new boating test
        BoatingTest.new(self,test_name, test_status, instructor)
    end


    # Student#grade_percentage should return the percentage of tests that the student has passed, a Float (so if a student has passed 3 / 9 tests that they've taken, this method should return the Float 33.33)

    def grade_percentage
        #return the percentage of grade as a float
        tests = self.boating_tests.count
        passed_tests = self.boating_tests.select do |test|
            test.test_status == "passed"
        end
        num_tests = tests.to_f 
        num_passed_tests = passed_tests.count.to_f 
        grade_decimal = num_passed_tests / num_tests
        grade_percentage = grade_decimal * 100
    end

end



# Student class:

# should initialize with first_name
# Student.all should return all of the student instances
# Student#add_boating_test should initialize a new boating test with a Student (Object), a boating test name (String), a boating test status (String), and an Instructor (Object)
# Student.find_student will take in a first name and output the student (Object) with that name
# Student#grade_percentage should return the percentage of tests that the student has passed, a Float (so if a student has passed 3 / 9 tests that they've taken, this method should return the Float 33.33)
