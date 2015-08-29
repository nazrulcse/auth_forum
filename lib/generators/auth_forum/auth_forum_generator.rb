class AuthForumGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  require 'forem'
  def generate_admin
    puts 'Generate admin model'
    self.app_admin
  end

  def register_model(source_path = '')
    puts "Source: #{source_path}"
    auth_forum_root = AuthForum::Engine.root
    destination = auth_forum_root.join('lib', 'admin')
    Dir.glob(source_path) do |rb_file|
      model = rb_file.chomp('.rb').camelize.split('Models::').last
      new_model = model.gsub('::', '_')
      dest_file = new_model.underscore.to_s + '.rb'
      unless File.exists?(destination + dest_file)
        File.open(File.join(destination, dest_file), 'w') do |f|
          f.puts "ActiveAdmin.register #{model} do end"
        end
      end
      puts "New File Name: #{dest_file}"
    end
  end

  def app_admin
    root_path =  AuthForum::Engine.root
    source_path = root_path.join('app', 'models', 'auth_forum', '*.rb')
    register_model(source_path)
  end

  def forem_admin
    root_path =  Forem::Engine.root
    source_path = root_path.join('app', 'models', 'forem', '*.rb')
    register_model(source_path)
  end

end
