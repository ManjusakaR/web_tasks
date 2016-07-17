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
@i=1
while @i<=100 do
s=Student.new()
s.i()
s.n()
s.g()
s.a()
s.d()
@i+=1
end
