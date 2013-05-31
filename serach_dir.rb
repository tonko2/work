#Search directry

array = []
student_name = []
#dirname = "ICPC"
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
    permission = Dir::chdir("/home/student/#{index}")
    next if permission == ""
    Dir::chdir("/home/student/#{index}")
    tmp_array = `ls -l | grep #{dirname}`
    next if tmp_array == ""
    TMP = tmp_array.split(" ")
    info = TMP[0]
    if info[4] != '-' && info[6] != '-'
      Dir::chdir("/home/student/#{index}/#{dirname}")
      path.push(Dir::pwd)
    end
  rescue => ex
    puts ex.message
    next
  end
}

path.each{|index|
  puts index
}


