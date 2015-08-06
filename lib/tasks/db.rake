namespace :db do
  desc 'Drop, create, migrate then seed the development database'
  task yolo: [ 'db:drop', 'db:create', 'db:migrate', 'db:seed' ] do
    puts 'Yolo indeed, sir'
  end
end