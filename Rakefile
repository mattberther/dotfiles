require 'rake'

desc "install the dot files into user's home directory"
task :install do
  install_antigen
  switch_to_zsh
  replace_all = false

  files = Dir.glob('**/*').reject { |f| f['pure'] || f['Rakefile'] || !File.file?(f) }

  files.each do |file|
    system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//
    target_path = File.join(ENV['HOME'], ".#{file}")

    if File.exist?(target_path)
      if File.identical?(file, target_path)
        puts "identical ~/.#{file}"
      else
        if replace_all
          link_file(file, target_path)
        else
          print "overwrite ~/.#{file}? [ynaq] "
          case $stdin.gets.chomp
          when 'a'
            replace_all = true
            link_file(file, target_path)
          when 'y'
            link_file(file, target_path)
          when 'q'
            exit
          else
            puts "skipping ~/.#{file}"
          end
        end
      end
    else
      link_file(file, target_path)
    end
  end
end

def link_file(file, target_path)
  system %Q{rm -rf "#{target_path}"}

  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "#{target_path}"}
end

def install_antigen
    if File.exist?(File.join(ENV['HOME'], ".zsh-antigen"))
        puts "found ~/.zsh-antigen"
    else
        print "install antigen? [ynq] "
        case $stdin.gets.chomp
        when 'y'
            puts "installing antigen"
            system %Q{git clone https://github.com/zsh-users/antigen.git "$HOME/.zsh-antigen"}
        when 'q'
            exit
        else
            puts "skipping antigen, you will need to change ~/.zshrc"
        end
    end
end

def switch_to_zsh
  if ENV["SHELL"] =~ /zsh/
    puts "using zsh"
  else
    print "switch to zsh? (recommended) [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "switching to zsh"
      system %Q{chsh -s `which zsh`}
    when 'q'
      exit
    else
      puts "skipping zsh"
    end
  end
end
