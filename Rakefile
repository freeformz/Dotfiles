task :link do |t|
  files = FileList.new('*') { |fl| fl.exclude('Rakefile') }
  dir = File.dirname(__FILE__)
  home = ENV['HOME']
  if files && dir && home
    files.each do |file|
      source = File.join(dir,file)
      target = File.join(home,".#{file}")
      File.unlink(target) if File.exist?(target)
      File.symlink(source, target)
    end
  end
end
