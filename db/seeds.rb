# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jaeyeon = Student.create(name: "Jaeyeon", sin: "201020323")
jaeyeon_pic = jaeyeon.pictures.new
jaeyeon_pic.remote_image_url = "https://lh5.googleusercontent.com/-vAya3X9Xl0s/AAAAAAAAAAI/AAAAAAAAAAA/prN5wwwdfIk/s96-c/photo.jpg"
jaeyeon_pic.save

sp = Course.create(name: "시스템프로그래밍", timetable: "화D 목C")

sp.students << jaeyeon

