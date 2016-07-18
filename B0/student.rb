require 'yaml'
class Student
  @@n=0
  @id=0
  @name=""
  @gender=""
  @age=""

  def i
    @@n+=1
    @id=@@n
  end

  def n
    chars=("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass=""
    1.upto(3){ |i| newpass << chars[rand(chars.size-1)]}
    @name=newpass
  end

  def g
    c=rand(0..1)
    if c==0
    @gender="M"
  else
    @gender="F"
  end
  end

  def a
    @age=rand(15..20)
  end

  def d
    puts "#@id #@name #@gender #@age"
  end

end


@d=Dir.pwd
puts @d
@filename=@d+'/student.yml'
puts @filename
if File.exists?(@filename)==false then
  @file=File.new(@filename,"w")
@i=1
@con=Hash.new
@configuration=Hash.new
while @i<=100 do
  s=Student.new()
  ss='st'+@i.to_s
  @con={ ss => {
    'id' => s.i(),
    'name' => s.n().to_s,
    'gender'  => s.g().to_s,
    'age'  =>  s.a()
  }
  }
   @configuration.update(@con)
 #puts @configuration
#str=+' '++' '++' '+
#@file.puts "#{str}"
#aFile.syswrite("ABCDEF")
#s.d()
@i+=1
end
puts "#@configuration"
open(@filename, 'a+') { |f| YAML.dump(@configuration, f) }
#open(@filename) { |f| puts f.read }
open(@filename) { |f| YAML.load(f) }
else
   #open(@filename) { |f| puts f.read }
   @configuration=YAML.load(File.open(@filename))
   puts "#@configuration"

  #puts "problem id is s#{problem["program"]["id"]}"
end

def ad
  @ii=@i.to_i
  @i=@i.to_i+1
  s=Student.new()
  ss='st'+@ii.to_s
  puts "#{ss}"
  @con={ ss => {
    'id' => s.i(),
    'name' => s.n().to_s,
    'gender'  => s.g().to_s,
    'age'  =>  s.a()
  }
  }
  puts @con
   @configuration.update(@con)
  open(@filename, 'a+') { |f| YAML.dump(@configuration, f) }
  #open(@filename) { |f| puts f.read }
  open(@filename) { |f| YAML.load(f) }
end

def del
  puts "please input id"
  i=gets
  ss='st'+i.to_s
  @configuration.delete_if(ss)
  open(@filename, 'w') { |f| YAML.dump(@configuration, f) }
  #open(@filename) { |f| puts f.read }
  open(@filename) { |f| YAML.load(f) }
end

def upd

end

def sea
  puts "please input id"
  i=gets
  ss='st'+i.to_s
  puts @configuration.(ss)

end

def sortid
@configuration.sort
puts @configuration
end

def sortage

end
def sortname

end

def exi

end

puts "please choose operation(1:add data; 2:delete data; 3:update data; 4:search data; 5:sort by id; 6:sort by age; 7:sort by name; 8:exit) "
@val=gets
while @val.to_i!=8 do
  if @val.to_i==1
    ad
  elsif @val.to_i==2
    del
  elsif @val.to_i==3
    upd
  elsif @val.to_i==4
    sea
  elsif @val.to_i==5
    sortid
  elsif @val.to_i==6
    sortage
  elsif @val.to_i==7
    sortname
  elsif @val.to_i==8
    exi
  else
    puts "please reinput"
  end
  puts "please choose operation(1:add data; 2:delete data; 3:update data; 4:search data; 5:sort by id; 6:sort by age; 7:sort by name; 8:exit) "
  @val=gets
end

