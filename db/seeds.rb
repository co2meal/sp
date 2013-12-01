# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
sp = Course.create(name: "시스템프로그래밍", timetable: "화D 목C")

jaeyeon = Student.create!(name: "Jaeyeon", sin: "201020323")
jaeyeon_pic = jaeyeon.pictures.new
jaeyeon_pic.remote_image_url = "https://dl.dropboxusercontent.com/u/70179109/jaeyeon1.jpg"
jaeyeon_pic.save!
jaeyeon_pic = jaeyeon.pictures.new
jaeyeon_pic.remote_image_url = "https://dl.dropboxusercontent.com/u/70179109/jaeyeon2.jpg"
jaeyeon_pic.save!
jaeyeon_pic = jaeyeon.pictures.new
jaeyeon_pic.remote_image_url = "https://dl.dropboxusercontent.com/u/70179109/jaeyeon3.jpg"
jaeyeon_pic.save!

heebeom = Student.create!(name: "Heebeom", sin: "201120845")
heebeom_pic = heebeom.pictures.new
heebeom_pic.remote_image_url = "https://dl.dropboxusercontent.com/u/70179109/201120845.jpg"
heebeom_pic.save!

dahyeong = Student.create!(name: "Dahyeong", sin: "201120866")
dahyeong_pic = dahyeong.pictures.new
dahyeong_pic.remote_image_url = "https://dl.dropboxusercontent.com/u/70179109/201120866.jpg"
dahyeong_pic.save!
dahyeong_pic = dahyeong.pictures.new
dahyeong_pic.remote_image_url = "https://dl.dropboxusercontent.com/u/70179109/dahyeong1.jpg"
dahyeong_pic.save!
dahyeong_pic = dahyeong.pictures.new
dahyeong_pic.remote_image_url = "https://dl.dropboxusercontent.com/u/70179109/dahyeong2.jpg"
dahyeong_pic.save!
dahyeong_pic = dahyeong.pictures.new
dahyeong_pic.remote_image_url = "https://dl.dropboxusercontent.com/u/70179109/dahyeong3.jpg"
dahyeong_pic.save!
dahyeong_pic = dahyeong.pictures.new
dahyeong_pic.remote_image_url = "https://dl.dropboxusercontent.com/u/70179109/dahyeong4.jpg"
dahyeong_pic.save!




sp.students << jaeyeon << heebeom << dahyeong

Course.first.lectures.create!
