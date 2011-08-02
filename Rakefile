task :default => [:link]

task :link do |t|
  files = FileList.new('*') { |fl| fl.exclude('Rakefile') }
  dir = File.dirname(__FILE__)
  home = ENV['HOME']
  if files && dir && home
    puts "Linking files in #{dir} to #{home}"
    files.each do |file|
      source = File.join(dir,file)
      target = File.join(home,".#{file}")
      puts "\t Linking: #{source} to #{target}"
      File.unlink(target) if File.exist?(target)
      File.symlink(source, target)
    end
  end
end
