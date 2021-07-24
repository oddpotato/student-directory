@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the Students"
  puts "2. Show the Students"
  puts "3. Update an Entry"
  puts "4. Save File"
  puts "5. Load A Previous List"
  puts "9. Exit"
end

def process(selection)
    case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "3"
       updating_entry
    when "4"
      puts "Which filename would you like?"
      filename = STDIN.gets.chomp()
      save_students(filename)
    when "5"
      puts "Which file would you like to load?"
      filename = STDIN.gets.chomp()
      load_students(filename)
    when "9"
      exit
    else 
      puts "I don't understand. Please try again."
    end
end

def show_students
  if @students.length > 0
    print_header
    print_student_list
    print_footer
  else puts "Nothing to see here chief. Consider inputting students."
    interactive_menu
  end
end

def print_header
    puts "The students of Villain's Academy".center(40)
    puts "--------------".center(40)
end

def print_footer
    puts "Overall, we have #{@students.count} great students".center(40)
end

def print_student_list
  @students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(40)
  end
end

def updating_entry
puts "Which entry would you like to change?".center(40)
entry = STDIN.gets.chomp()
puts "Would you like to change the name or cohort?".center(40)
key = STDIN.gets.chomp()
puts "Please enter the new value".center(40)
value = STDIN.gets.chomp()
  @students.each.with_index(1) do |sub_hash, index|
  if index == entry.to_i
    sub_hash.each do |k, v|
      if k == key.to_sym
        v.to_s.gsub!(v.to_s,value.to_s)
      end 
    end
  end
  end
end

def input_students
  # @students = []
  # take a student name
  puts "Please enter a student's name".center(40)
  name = STDIN.gets.chomp()
  # take a student cohort
  puts "Please enter the student's cohort".center(40)
  cohort = STDIN.gets.chomp()
  puts "When you are finished, please press 'Enter' until the menu appears".center(40)
  # This is what stops the input
  until name.empty? && cohort.empty? do
  # This is appending the default value is they don't insert name or cohort
    if cohort.empty?
      @students << {name: name, cohort: 'november'}
    elsif name.empty?
      @students << {name: 'Apples', cohort: cohort}
    else @students << {name: name, cohort: cohort}
    end
  # This is printing depending on what's up
    if @students.count == 1  
      puts "Now we have 1 student".center(40)
      else puts "Now we have #{@students.count} students".center(40)
    end
  puts "Please enter another name".center(40)
  name = STDIN.gets.chomp
  puts "Please enter another cohort".center(40)
  cohort = STDIN.gets.chomp
  end
  @students
  end

def save_students(filename = "students.csv")
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name]], [student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "File Successfully Saved"
end

# -----------
# A note about cohorts:
# As the exercise says, cohort here is a 
# string for consistencies sake
# 'What to do if someone made a typo'
# Hasn't been called since E8Q7
# But it was a valid point
# -----------

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name:name, cohort: cohort}
  end
  file.close
end

#def try_load_students
#  filename = ARGV.first
#  return if filename.nil?
#  if File.exists?(filename)
#    load_students(filename)
#    puts "Loaded #{@students.count} from #{filename}"
#  else
#    puts "Sorry, #{filename} doesn't exist"
#    exit
#  end
#end
#
#try_load_students
#load_students

interactive_menu