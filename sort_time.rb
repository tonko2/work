#sort program by time 

stat = {}
array = [] #sorted by time

while file = ARGV.shift
  stat[file] = File.lstat(file)
end


stat.keys.sort {|a, b|
  [stat[b].ctime, stat[b].ctime.nsec, a] <=> [stat[a].ctime, stat[a].ctime.nsec, b]
}.each do |file|
  array.push(file)
end

