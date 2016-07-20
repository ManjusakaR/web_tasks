require 'yaml'

class Student
  @@n=0
  @id=0
  @name=""
  @gender=""
  @age=0

  def initialize
    @@n+=1
    @id=@@n

    chars=("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass=""
    1.upto(3){ |i| newpass << chars[rand(chars.size-1)]}
    @name=newpass

    c=rand(0..1)
    @gender=
      if 0
        "M"
      else
        "F"
      end

    @age=rand(15..20)
  end

  def get_id
    @id
  end

  def get_name
    @name
  end

  def get_gender
    @gender
  end

  def get_age
    @age
  end

  def display
    puts "#{@id} #{@name} #{@gender} #{@age} "
  end

end


@d=Dir.pwd
puts "#{@d}"

@filename=@d+'/student.yml'
puts "#{@filename}"

if File.exists?(@filename)==false
  @file=File.new(@filename,"w")
  @i=1
  @con=Hash.new
  @configuration=Hash.new

  while @i<=100
    s=Student.new
    s_num='st'+@i.to_s
    @con={
      s_num => {
      'id' => s.get_id,
      'name' => s.get_name,
      'gender'  => s.get_gender,
      'age'  =>  s.get_age
      }
    }
    @configuration.update(@con)
    @i+=1
  end

  puts "write stuent,yml success!"
  open(@filename, 'w') { |f| YAML.dump(@configuration, f) }
  #open(@filename) { |f| YAML.load(f) }

else
   #open(@filename) { |f| puts f.read }
   @configuration=YAML.load(File.open(@filename))
   @configuration.each{ |ckey,cvalue|
     puts "#{ckey}"
     puts "-id: #{cvalue['id']}"
     puts "-name: #{cvalue['name']}"
     puts "-gender: #{cvalue['gender']}"
     puts "-age: #{cvalue['age']}"
     puts"---"
   }
end

def add_student
  i=@configuration.size+1
  s=Student.new
  s_num='st'+i.to_s
  @con={
    s_num => {
    'id' => i,
    'name' => s.get_name,
    'gender'  => s.get_gender,
    'age'  =>  s.get_age
    }
  }
  #puts @con
  @configuration.update(@con)
  open(@filename, 'a+') { |f| YAML.dump(@con, f) }
  #open(@filename) { |f| YAML.load(f) }
end

def delete_student
  puts "please input id"
  i=gets
  s='st'+i.to_s
  s_num=s.chomp
  @configuration.delete(s_num)
  open(@filename, 'w') { |f| YAML.dump(@configuration, f) }
  #open(@filename) { |f| puts f.read }
  #open(@filename) { |f| YAML.load(f) }
end

def update_student
  puts "please input id"
  id=gets
  s_id=id.chomp
  puts "please input name"
  name=gets
  s_name=name.chomp
  puts "please input gender"
  gender=gets
  s_gender=gender.chomp
  puts "please input age"
  age=gets
  s_age=age.chomp
  s='st'+s_id.to_s
  s_num=s.chomp
  @con={
    s_num => {
    'id' => s_id,
    'name' => s_name,
    'gender'  => s_gender,
    'age'  =>  s_age
    }
  }
  @configuration.update(@con)
  open(@filename, 'w') { |f| YAML.dump(@configuration, f) }
end

def search_student
  puts "please input id"
  s_id=gets
  s='st'+s_id.to_s
  s_num=s.chomp
  s_data=@configuration.fetch(s_num)
  puts "#{s_data}"
end

def sort_by_id
  i=@configuration.size
  hash_to_array=@configuration.to_a
  puts "#{hash_to_array}"
  @configuration.sort
  @configuration.each{ |ckey,cvalue|
    puts "#{ckey}"
    puts "-id: #{cvalue['id']}"
    puts "-name: #{cvalue['name']}"
    puts "-gender: #{cvalue['gender']}"
    puts "-age: #{cvalue['age']}"
    puts"---"
  }
  puts
end

def sort_by_age
  hash_to_array=@configuration.to_a
  puts "#{hash_to_array}"

end
def sort_by_name

end

puts "please choose operation(1:add data; 2:delete data; 3:update data; 4:search data; 5:sort by id; 6:sort by age; 7:sort by name; 8:exit) "
@val=gets
while @val.to_i!=8
  if @val.to_i==1
    add_student
  elsif @val.to_i==2
    delete_student
  elsif @val.to_i==3
    update_student
  elsif @val.to_i==4
    search_student
  elsif @val.to_i==5
    sort_by_id
  elsif @val.to_i==6
    sort_by_age
  elsif @val.to_i==7
    sort_by_name
  else
    puts "please reinput"
  end
  puts "please choose operation(1:add data; 2:delete data; 3:update data; 4:search data; 5:sort by id; 6:sort by age; 7:sort by name; 8:exit) "
  @val=gets
end

