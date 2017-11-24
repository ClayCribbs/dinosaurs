puts
puts '*' * 122
puts '*' * 122
puts 'PumpRocket!!!!'
puts '*' * 122
puts '*' * 122
puts
puts 'Input project name:'
project_name = gets.chomp

puts 'Input github username:'
github_username = gets.chomp

until github_username.match (/^[a-z\d](?:[a-z\d]|-(?=[a-z\d])){0,38}$/i)
  puts
  puts '*' * 122
  puts "#{github_username} is not a valid Github username."
  puts '>> Github username may only contain alphanumeric characters or hyphens.'
  puts '>> Github username cannot have multiple consecutive hyphens.'
  puts '>> Github username cannot begin or end with a hyphen.'
  puts '>> Maximum is 39 characters.'
  puts
  puts 'if you do not have a Github account, you may create one at:'
  puts 'https://github.com/'
  puts
  puts '*' * 122
  puts
  puts 'Please enter a valid Github username:'
  github_username = gets.chomp
end

puts 'Is this a PolarNotion app? (y/n)'
polar_notion_app_input = gets.chomp.to_s[0].downcase
is_polar_notion_app    = polar_notion_app_input == 'y' ? true : false

github_git_init                    = %Q<  git init  >
github_create_repo                 = %Q<  curl -u '#{github_username}' https://api.github.com/user/repos -d '{ "name" : "#{project_name}" }'  >
github_remove_origin               = %Q<  git remote remove origin  >
github_create_origin               = %Q<  git remote add origin git@github.com:#{github_username}/#{project_name}.git  >
github_push                        = %Q<  git push -u origin master  >
dev_create_database                = %Q<  rake db:create db:migrate  >
heroku_create_staging              = %Q<  heroku create #{project_name}-staging    --remote staging                 #{'--org polarnotion' if is_polar_notion_app}  >
heroku_create_production           = %Q<  heroku create #{project_name}-production --remote production              #{'--org polarnotion' if is_polar_notion_app}  >
heroku_create_pipeline             = %Q<  heroku pipelines:create -a #{project_name}-staging    --stage staging     #{'--org polarnotion' if is_polar_notion_app}  >
heroku_join_production_to_pipeline = %Q<  heroku pipelines:add #{project_name} -a #{project_name}-production --stage production  >
staging_push                       = %Q<  git push staging  >
staging_migrate_database           = %Q<  heroku run rake db:migrate --remote staging  >
production_push                    = %Q<  git push production  >
production_migrate_database        = %Q<  heroku run rake db:migrate --remote production  >

def execute_with_starz(command, description)
  puts
  puts '*' * 122
  puts "Running command: #{description}"
  puts command
  puts '*' * 122

  system( command )
end

[ #command
  [ github_create_repo,                 'github_create_repo'                 ],
  [ github_remove_origin,               'github_remove_origin'               ],
  [ github_create_origin,               'github_create_origin'               ],
  [ github_push,                        'github_push'                        ],
  [ dev_create_database,                'dev_create_database'                ],
  [ heroku_create_staging,              'heroku_create_staging'              ],
  [ heroku_create_production,           'heroku_create_production'           ],
  [ heroku_create_pipeline,             'heroku_create_pipeline'             ],
  [ heroku_join_production_to_pipeline, 'heroku_join_production_to_pipeline' ],
  [ staging_push,                       'staging_push'                       ],
  [ staging_migrate_database,           'staging_migrate_database'           ],
  [ production_push,                    'production_push'                    ],
  [ production_migrate_database,        'production_migrate_database'        ],
].each do |command_with_description|
  execute_with_starz(command_with_description.first, command_with_description.last)
end
