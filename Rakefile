require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  install_oh_my_zsh
  switch_to_zsh
  replace_all = false

  files = Dir['*'] - %w[Rakefile oh-my-zsh]

  files.each do |file|
    system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//
    target = file.sub(/\.erb$/, '')
    target_path = File.join(ENV['HOME'], ".#{target}")

    if File.exist?(target_path)
      if File.identical?(file, target_path)
        puts "identical ~/.#{target}"
      else
        if replace_all
          link_file(file, target_path)
        else
          print "overwrite ~/.#{target}? [ynaq] "
          case $stdin.gets.chomp
          when 'a'
            replace_all = true
            link_file(file, target_path)
          when 'y'
            link_file(file, target_path)
          when 'q'
            exit
          else
            puts "skipping ~/.#{target}"
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

  if file =~ /.erb$/
    puts "generating #{target_path}"
    File.open(target_path, 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "#{target_path}"}
  end
end

def install_oh_my_zsh
  puts File.join(ENV['HOME'], ".oh-my-zsh")
  if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
    puts "found ~/.oh-my-zsh"
  else
    print "install oh-my-zsh? [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "installing oh-my-zsh"
      system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
    when 'q'
      exit
    else
      puts "skipping oh-my-zsh, you will need to change ~/.zshrc"
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
