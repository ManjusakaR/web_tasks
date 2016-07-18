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
   std=YAML.load(File.open(@filename))
   puts "#{std}"

  #puts "problem id is s#{problem["program"]["id"]}"
end



#puts "sort by id?(y/n)"
#if gets==y||gets==Y
#
#puts "sort by age?(y/n)"
#puts "sort by name?(y/n)"
