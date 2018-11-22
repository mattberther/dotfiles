require 'rake'

desc "install the dot files into user's home directory"
task :install do
  install_antibody
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

def install_antibody
    if system %Q{which antibody}
        puts "found antibody"  
        system %Q{antibody -v}
    end

    print "install/update antibody? [ynq] "
    case $stdin.gets.chomp
    when 'y'
        puts "installing antibody"
        system %Q{curl -sL git.io/antibody | sh -s}
    when 'q'
        exit
    else
        puts "skipping antibody, you will need to change ~/.zshrc"
    end

    puts "running antibody bundle"
    system %Q{antibody bundle < zsh_plugins.txt > zsh_plugins.sh}
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
