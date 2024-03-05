#!/usr/bin/env ruby

def generate_controller(name)
  controller_filename = File.join(File.dirname(__FILE__), "../web/controllers/#{name.downcase}_controller.rb")
  
  # check if a controller already exists; if it does lets not proceed as it can cause code loss
  if File.exist?(controller_filename)
    puts "Controller #{name}Controller already exists!"
    return
  end

  # create the controller :)
  File.open(controller_filename, 'w') do |file|
    file.puts <<~CONTROLLER      
      class #{name.capitalize}Controller < BaseController
        # Hooray! Your controller has been created. To get started, you can:
        #  - Define controller actions to handle different routes and requests.
        #  - Use helper methods provided in the base controller (see web/controller/base_controller.rb).
        #  - Utilize built-in Sinatra helpers, or register your own custom helpers (see Sinatra documentation).
        #
        # Here are some tips:
        #  - Make sure that your controllers are mapped to a route (see web/routes.rb).
        #  - Make sure that you handle errors within controller actions correctly, as the global handler may not catch all errors and or your app may crash/degrade.
        #  - Have fun with this Template/Library whatever you consider it!
        
        # Here is an example action to get you going:
        def index
          json({ message: "Hello World!" })
        end
      end
    CONTROLLER
  end

  puts "Controller #{name.capitalize}Controller created successfully! (## IF YOU DO NOT LIKE THE NAME CAPITALIZATION FOR THE CONTROLLER FEEL FREE TO CHANGE IT ##)"
end

if ARGV.length != 1
  puts "Usage: #{__FILE__} <controller_name>"
  exit(1)
end

generate_controller(ARGV[0])