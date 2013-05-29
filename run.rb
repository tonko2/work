require 'fssm'

def run_system(base, file)
  file_names = file.split(".")
  input_file_name = "in"

  #execution file creates
  if system("g++ #{file} -o #{file_names[0]}")
    if File.exist?("#{input_file_name}")
      IO.popen("./#{file_names[0]}", 'r+') do |io|
        File.open("./#{input_file_name}", "r") do |f|
          while line = f.gets do
            io.puts line
          end
        end
        io.close_write
        while result = io.gets
          puts result
        end
      end
      #copy to clipboard 
      if system("cat #{file} | pbcopy")
    else
      system("./#{file_names[0]}")
    end
  end
end

#first argument is dir, second argument is file
FSSM.monitor('.','*.cpp') do 
  update do|base, file|
    run_system(base, file)
  end
  create do|base, file|
    run_system(base, file)
  end
end
