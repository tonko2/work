File.open(ARGV[0], 'r') do |io|
  while true
    if( line = io.gets )
      puts line
    else
      sleep 1
    end
  end
end
