window "editor", selected: true do
  command "vim ."

  split :horizontal, height: 20

  split :vertical do
    command "vim ."
  end
end

window "console" do
  command "bundle exec rails c"

  split :vertical do
    command "tail -f log/development.log"
  end
end

window "server" do
  command "bundle exec rails s"
end
