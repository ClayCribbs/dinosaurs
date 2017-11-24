unless Rails.env.production?
  [ #seed_file_name
    'users',
    'activities',
  ].each do |seed|
    seed_file = "#{Rails.root}/db/seeds/#{seed}.rb"
    if File.exists?(seed_file)
      puts "*** Loading seed data for #{seed.titleize}"
      require seed_file
    end
  end
end
