# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

articles = Article.create[{:title => "Pesawat Hilang",:body => "Hilang di ketinggian 6000m dpal"},{:title => "Gayus Tambunan",:body => "Trendsetter Mafia Pajak"},{:title => "PT Walden Global Service",:body => "Perusahaan IT di Bandung berbasis ROR"},{:title =>"Universitas Dian Nuswantoro",:body => "Universitas IT terbesar di Semarang"},{:title =>"Punokawan",:body => "Bagong, Semar, Petruk, Gareng"}]

comments = Comment.create[{:content => "Sempurna"},{:content => "Baik"},{:content => "Cukup"},{:content => "Kurang"},{:content => "Parah"}]

countries = Country.create[{:code => "B",:name =>"Jakarta"},{:code => "D",:name =>"Bandung"},{:code => "Z",:name =>"Sumedang"},{:code => "W",:name =>"Surabaya"},{:code => "H",:name =>"Semarang"}]

users = User.create[{:first_name => "Joko",:last_name => "Wibowo",:email => "joko.wibowo@whatever.com",:username => "jokowibowo",:address => "jl. jokowibowo",:age => 20},{},{},{},{}]

