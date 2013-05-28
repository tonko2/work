require 'fssm'

FSSM.monitor('.', '**/*') do
  update do|base, file|
    puts "UPDATE: #{base} #{file}"
  end
  create do|base, file|
    puts "CREATE: #{base} #{file}"
  end
  delete do|base, file|
    puts "DELETE: #{base} #{file}"
  end
end
