#Search directry

array = []
student_name = []
dirname = "ICPC"

#tmp = `gentent passwd | grep ^s19`
tmp = `cat sample.txt`
array = tmp.split("\n");

student_name.push("kusakayuuya");
array.each{|index|
  tmp_array = index.split(":")
  student_name.push(tmp_array[0])
}

student_name.each{|index|
  tmp_array = `ls -l ~#{index} | grep #{dirname}`
  TMP = tmp_array.split(" ")
  info = TMP[0]
  puts info
  if info[4] != '-' && info[6] != '-'
    puts "ok"
  end

  system("cd")  #Home Directry
  break;
}


