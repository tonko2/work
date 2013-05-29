
while tmp = ARGV.shift
  file_obj = File.lstat(tmp)
  puts file_obj.mtime
end

stat.keys.sort {|a, b|
  [stat[b].ctime, stat[b].ctime.nsec, a] <=> [stat[a].ctime, stat[a].ctime.nsec, b]
}.each do |k|
  pr(k, stat[k])
end
