#Tlux

Luxurious tmux configuration with Ruby.

##About

Specify your tmux environments using an intuitive DSL instead of having to remember tmux commands.

Set up different environemnts that can be shared between projects, have an environment for your Rails projects and specify it once, rather than once per project.

##Usage

Tlux is available as a ruby gem, it has dependencies on tmux.  Once you have tmux installed install the tlux gem:

	gem install tlux

To get usage details just run the tlux command without any args

	tlux

##Config

An example config showing some of the commands available

	window :editor do
		command "vim ."
		
		split :vertical, percentage: 30 do
			split :horizontal, lines: 20
		end
	end
	
	window :console do
		command "tail -f log/development.log"
		
		split :vertical do
			command "rails c"
		end
	end
	
	window :server do
		command "rails s"
	end


		