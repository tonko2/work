#Search directry

array = []
student_name = []
dirname = ARGV[0]
path = []

tmp = `getent passwd | grep ^s119`

array = tmp.split("\n");

array.each{|index|
  tmp_array = index.split(":")
  student_name.push(tmp_array[0])
}

student_name.each{|index|
  begin
    puts index
    permission = Dir::chdir("/home/student/#{index}")
    next if permission == ""
    Dir::chdir("/home/student/#{index}")
    tmp = `ls -l | grep #{dirname}`
    next if tmp == ""
    t = tmp_array.split(" ")
    info = t[0]
    if info[4] != '-' && info[6] != '-'
      Dir::chdir("/home/student/#{index}/#{dirname}")
      path.push(Dir::pwd)
    end
  rescue => ex
    next
  end
}

puts "-------------------------------"
path.each{|index|
  puts index
}


