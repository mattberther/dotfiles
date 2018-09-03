require 'rake'

desc "install the dot files into user's home directory"
task :install do
  install_oh_my_zsh
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

  link_file("pure/async.zsh", File.join(ENV['HOME'], ".zfunctions/async"))
  link_file("pure/pure.zsh", File.join(ENV['HOME'], ".zfunctions/prompt_pure_setup"))
end

def link_file(file, target_path)
  system %Q{rm -rf "#{target_path}"}

  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "#{target_path}"}
end

def install_oh_my_zsh
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
