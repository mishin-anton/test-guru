# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  user1 = User.create(name: 'Vasya')
  user2 = User.create(name: 'Petya')

  cat1 = Category.create(title: 'Programming')

  test1 = Test.create(title: 'Ruby', level: 2, category: cat1, users: [user1])
  test2 = Test.create(title: 'HTML', level: 1, category: cat1, users: [user1])
  test3 = Test.create(title: 'Java', level: 3, category: cat1, users: [user1])
  test4 = Test.create(title: 'R', level: 2, category: cat1, users: [user2])

  usertest1 = UserTest.create(user_id: user1.id, test_id: test1.id)
  usertest2 = UserTest.create(user_id: user1.id, test_id: test2.id)
  usertest3 = UserTest.create(user_id: user1.id, test_id: test4.id)
  usertest4 = UserTest.create(user_id: user2.id, test_id: test4.id)

  question1 = Question.create(body: "The best language is", tests_id: test1.id)
  question2 = Question.create(body: "How to called function in Ruby", tests_id: test1.id)
  question3 = Question.create(body: "Hypertext Markup language", tests_id: test2.id)
  question4 = Question.create(body: "Class-based, object-oriented language", tests_id: test3.id)
  question5 = Question.create(body: "Language for statistical computing", tests_id: test4.id)

  answer1 = Answer.create(body: 'Ruby', questions_id: question1.id, correct: true)
  answer2 = Answer.create(body: 'Method', questions_id: question2.id, correct: true)
  answer3 = Answer.create(body: 'HTML', questions_id: question3.id, correct: true)
  answer4 = Answer.create(body: 'Java', questions_id: question4.id, correct: true)
  answer5 = Answer.create(body: 'R', questions_id: question5.id, correct: true)
