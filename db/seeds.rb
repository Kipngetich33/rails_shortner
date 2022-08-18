# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Url.create([
    {
        http_url:"https://www.google.com/search?q=what+is+a+401k&oq=what+is+a+401k&aqs=chrome..69i57j0i512l5j0i10i512j0i512l3.8077j0j7&sourceid=chrome&ie=UTF-8",
        short_code:"xyz2"
    },
    {
        http_url:"https://stackoverflow.com/questions/45474191/an-error-occurred-while-installing-mysql2-0-4-8-and-bundler-cannot-continue",
        short_code:"xyz3"
    },
    {
        http_url:"https://github.com/capistrano/capistrano/issues/1953",
        short_code:"xyz4"  
    },
    {
        http_url:"https://stackoverflow.com/questions/25168791/creating-a-ruby-gem-require-error-cannot-load-such-file-loaderror",
        short_code:"xyz5"  
    },
    {
        http_url:"https://dev.to/mikerogers0/fixing-sqlite3-gem-which-is-not-supported-on-heroku-2mmp",
        short_code:"xyz6"   
    }
])