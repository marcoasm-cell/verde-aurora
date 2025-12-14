# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create_with(name: 'Marco', status: true, password: '123456', admin: true).find_or_create_by(email: 'marco.a.s.m@hotmail.com')

Category.create_with(name: 'Velas').find_or_create_by(name: 'Velas')
Category.create_with(name: 'Jesmonite').find_or_create_by(name: 'Jesmonite')

Product.create_with(name: 'Test', category_id: 1, description: 'Test', price: 0).find_or_create_by(name: 'Test')
Product.create_with(name: 'Test1', category_id: 1, description: 'Test', price: 0).find_or_create_by(name: 'Test1')
Product.create_with(name: 'Test2', category_id: 1, description: 'Test', price: 0).find_or_create_by(name: 'Test2')
Product.create_with(name: 'Test3', category_id: 1, description: 'Test', price: 0).find_or_create_by(name: 'Test3')
Product.create_with(name: 'Test4', category_id: 1, description: 'Test', price: 0).find_or_create_by(name: 'Test4')

Color.create_with(name: 'Negro', code: '#000000').find_or_create_by(name: 'Negro')
Fragance.create_with(name: 'Pinho', code: '41fsf').find_or_create_by(name: 'Pinho')

Contact.create_with(name: 'Test', email: 'test@t.com', message: 'Test').find_or_create_by(name: 'Test')

Order.create_with(client_name: 'Test', client_email: 'test@t.com', client_phone: '123456789', client_address: 'Test', price: 0, ports: 0).find_or_create_by(client_name: 'Test')