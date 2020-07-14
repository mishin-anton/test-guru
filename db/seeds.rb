# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  # user1 = User.create(name: 'one@gmail.com', email: 'one@gmail.com', password: 'qwerty1', password_confirmation: 'qwerty1')
  # user2 = User.create(name: 'two@gmail.com', email: 'two@gmail.com', password: 'qwerty2', password_confirmation: 'qwerty2')
  user1 = User.find_by(name: 'one@gmail.com')
  user2 = User.find_by(name: 'two@gmail.com')

  cat1 = Category.create(title: 'Programming')
  cat2 = Category.create(title: 'Test category')

  rule1 = Rule.create(title: 'level_complete')
  rule2 = Rule.create(title: 'first_attempt_complete')
  rule3 = Rule.create(title: 'programming_category_complete')

  test1 = Test.create(title: 'Ruby', level: 2, category: cat1, author_id: user1.id)
  test2 = Test.create(title: 'HTML', level: 1, category: cat1, author_id: user2.id)
  test3 = Test.create(title: 'Java', level: 3, category: cat1, author_id: user1.id)
  test4 = Test.create(title: 'R', level: 2, category: cat1, author_id: user1.id)
  test5 = Test.create(title: 'C++', level: 5, category: cat1, author_id: user2.id)

  usertest1 = UserTest.create(user_id: user1.id, test_id: test1.id)
  usertest2 = UserTest.create(user_id: user1.id, test_id: test2.id)
  usertest3 = UserTest.create(user_id: user1.id, test_id: test4.id)
  usertest4 = UserTest.create(user_id: user2.id, test_id: test4.id)

  question1 = Question.create(body: "The best language is", test_id: test1.id)
  question2 = Question.create(body: "How to called function in Ruby", test_id: test1.id)
  question3 = Question.create(body: "Hypertext Markup language", test_id: test2.id)
  question4 = Question.create(body: "Class-based, object-oriented language", test_id: test3.id)
  question5 = Question.create(body: "Language for statistical computing", test_id: test4.id)

  answer1 = Answer.create(body: 'Ruby', question_id: question1.id, correct: true)
  answer2 = Answer.create(body: 'Method', question_id: question2.id, correct: true)
  answer3 = Answer.create(body: 'HTML', question_id: question3.id, correct: true)
  answer4 = Answer.create(body: 'Java', question_id: question4.id, correct: true)
  answer5 = Answer.create(body: 'R', question_id: question5.id, correct: true)
