require 'yaml'

namespace :data do
  namespace :dump do
    task :create do
      dump_path = File.join(File.dirname(__FILE__), "../../db_#{RAILS_ENV}.dump")
      database, username, password = configs

      File.delete dump_path if File.exists? dump_path
      p "Creating dump at #{dump_path}"
      exec "mysqldump --databases #{database} -u#{username} -p#{password} > #{dump_path}"
    end

    task :load do
      dump_path = File.join(File.dirname(__FILE__), "../../db_#{RAILS_ENV}.dump")
      database, username, password = configs
      p "Importing dump at #{dump_path}"
      exec "mysql -u#{username} -p#{password} < #{dump_path}"
    end

    def configs
      info = YAML::load(IO.read("#{File.dirname(__FILE__)}/../../config/database.yml"))
      return info[RAILS_ENV]["database"], info[RAILS_ENV]["username"], info[RAILS_ENV]["password"]
    end
  end
end