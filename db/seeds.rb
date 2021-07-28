# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

nick = User.create(name: 'Nick', age: 30)

#Categories

history = Category.create(title: 'History')
games = Category.create(title: 'Games')

#Tests

ancient_rome = Test.create(title: 'Ancien Rome', level: 1, category_id: history.id, author_id: nick.id)
ww2 = Test.create(title: 'WWII', level: 2, category_id: history.id, author_id: nick.id)

wow = Test.create(title: 'World of Warcraft', level: 1, category_id: games.id, author_id: nick.id)
starcraft2 = Test.create(title: 'StarCraft2', level: 2, category_id: games.id, author_id: nick.id)

#Questions

questions_for_ancient_rome_test = Question.create([
  { body: 'What year was rome founded?', test_id: ancient_rome.id },
  { body: 'Who founded Rome?', test_id: ancient_rome.id },
  { body: 'What was the name of the Roman infantryman?', test_id: ancient_rome.id }
  ])

questions_for_ww2_test = Question.create([
  { body: 'In what year did World War II begin?', test_id: ww2.id },
  { body: 'In what year did the Allied landings begin in Normandy?', test_id: ww2.id },
  { body: 'In what year did the second and last war end?', test_id: ww2.id }
  ])

questions_for_wow_test = Question.create([
  { body: 'Who was Arthas Menethil?', test_id: wow.id },
  { body: "Who was Kel'Thuzad?", test_id: wow.id },
  { body: 'What is Naxxramas?', test_id: wow.id }
  ])

questions_for_starcraft2_test = Question.create([
  { body: 'Who was James Raynor?', test_id: starcraft2.id },
  { body: 'Who was Sarah Kerrigan?', test_id: starcraft2.id },
  { body: 'Who was Arcturus Mengsk?', test_id: starcraft2.id }
  ])

#Answers

answers_for_first_question_of_ancient_rome_test = Answer.create([
  { body: '753 BC', correct: true, question_id: questions_for_ancient_rome_test[0].id },
  { body: '811 BC', question_id: questions_for_ancient_rome_test[0].id },
  { body: '678 BC', question_id: questions_for_ancient_rome_test[0].id }
  ])

answers_for_second_question_of_ancient_rome_test = Answer.create([
  { body: 'Lenin and Stalin', question_id: questions_for_ancient_rome_test[1].id },
  { body: 'Putin and Gorbachov', question_id: questions_for_ancient_rome_test[1].id },
  { body: 'Romulus and Remus', correct: true, question_id: questions_for_ancient_rome_test[1].id }
  ])

answers_for_third_question_of_ancient_rome_test = Answer.create([
  { body: 'Samurai', question_id: questions_for_ancient_rome_test[2].id },
  { body: 'Legoinary', correct: true, question_id: questions_for_ancient_rome_test[2].id },
  { body: 'Hoplit', question_id: questions_for_ancient_rome_test[2].id }
  ])

answers_for_first_question_of_ww2_test = Answer.create([
  { body: '1936', question_id: questions_for_ww2_test[0].id },
  { body: '1939', correct: true, question_id: questions_for_ww2_test[0].id },
  { body: '1941', question_id: questions_for_ww2_test[0].id }
  ])

answers_for_second_question_of_ww2_test = Answer.create([
  { body: '1942', question_id: questions_for_ww2_test[1].id },
  { body: '1943', question_id: questions_for_ww2_test[1].id },
  { body: '1944', correct: true, question_id: questions_for_ww2_test[1].id }
  ])

answers_for_third_question_of_ww2_test = Answer.create([
  { body: '1945', correct: true, question_id: questions_for_ww2_test[2].id },
  { body: '1947', question_id: questions_for_ww2_test[2].id },
  { body: '1946', question_id: questions_for_ww2_test[2].id }
  ])

answers_for_first_question_of_wow_test = Answer.create([
  { body: 'The traitor Prince', correct: true, question_id: questions_for_wow_test[0].id },
  { body: 'Soldier', question_id: questions_for_wow_test[0].id },
  { body: 'General', question_id: questions_for_wow_test[0].id }
  ])

answers_for_second_question_of_wow_test = Answer.create([
  { body: 'The traitor Prince', question_id: questions_for_wow_test[1].id },
  { body: 'Lich King', correct: true, question_id: questions_for_wow_test[1].id },
  { body: 'General', question_id: questions_for_wow_test[1].id }
  ])

answers_for_third_question_of_wow_test = Answer.create([
  { body: 'Alliance City', question_id: questions_for_wow_test[2].id },
  { body: 'Raid Zone', correct: true, question_id: questions_for_wow_test[2].id },
  { body: 'Area in Azeroth', question_id: questions_for_wow_test[2].id }
  ])

answers_for_first_question_of_starcraft2_test = Answer.create([
  { body: 'Rebel Leader', correct: true, question_id: questions_for_starcraft2_test[0].id },
  { body: 'Pilot', question_id: questions_for_starcraft2_test[0].id },
  { body: 'Sniper', question_id: questions_for_starcraft2_test[0].id }
  ])

answers_for_second_question_of_starcraft2_test = Answer.create([
  { body: 'Pilot', question_id: questions_for_starcraft2_test[1].id },
  { body: 'Queen of Blades', correct: true, question_id: questions_for_starcraft2_test[1].id },
  { body: 'Sniper', question_id: questions_for_starcraft2_test[1].id }
  ])

answers_for_second_question_of_starcraft2_test = Answer.create([
  { body: 'Rebel Leader', question_id: questions_for_starcraft2_test[2].id },
  { body: 'Dominion Emperor', correct: true, question_id: questions_for_starcraft2_test[2].id },
  { body: 'King of Blades', question_id: questions_for_starcraft2_test[2].id }
  ])
