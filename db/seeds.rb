# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r1 = Role.create({name: "Regular", description: "regular users can start threads and reply
tposts. They are not allowed to do anything else"})
r2 = Role.create({name: "Manager", description: "manager is able create topics and threads.if there are some bad posts,
 the manager can delete them."})
r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

t1 = Topic.create({name: "Sports" })
t2 = Topic.create({name: "Politics" })
t3 = Topic.create({name: "Ecnomics" })

u1 = User.create({name: "Sally", email: "sally@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: Role.find_by(name: "Admin").id})
u2 = User.create({name: "Sue", email: "sue@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: Role.find_by(name: "Manager").id})
u3 = User.create({name: "Kev", email: "kev@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: Role.find_by(name: "Regular").id})
u4 = User.create({name: "Jack", email: "jack@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa"})


p1 = Post.create({title: "Rayban Sunglasses", content: "Stylish shades", topic_id: Topic.find_by(name: "Sports").id, user_id: User.find_by(name: "Sally" ).id})
p2 = Post.create({title: "Gucci watch", content: "Expensive timepiece", topic_id: Topic.find_by(name: "Politics").id, user_id: User.find_by(name: "Sue" ).id})
p3 = Post.create({title: "Henri Lloyd Pullover", content: "Classy knitwear", topic_id: Topic.find_by(name: "Ecnomics").id, user_id: User.find_by(name: "Jack").id})
p4 = Post.create({title: "Porsche socks", content: "Cosy footwear", topic_id: Topic.find_by(name: "Ecnomics").id, user_id: User.find_by(name: "Sue").id})

r1 = Reply.create({content: "This post is really good!", user_id: User.find_by(name: "Sally" ).id, post_id: Post.find_by(title: "Rayban Sunglasses").id})
r2 = Reply.create({content: "This post is really bad!", user_id: User.find_by(name: "Sue" ).id, post_id: Post.find_by(title: "Porsche socks").id})
r3 = Reply.create({content: "This post is really awesome!", user_id: User.find_by(name: "Sally" ).id, post_id: Post.find_by(title: "Gucci watch").id})
r4 = Reply.create({content: "This post is really beatiful!", user_id: User.find_by(name: "Jack").id, post_id: Post.find_by(title: "Rayban Sunglasses").id})
r5 = Reply.create({content: "This post is really taste!", user_id: User.find_by(name: "Jack").id, post_id: Post.find_by(title: "Gucci watch").id})