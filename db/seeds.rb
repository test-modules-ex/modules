cat1 = Category.create!(
  name: 'Lorem',
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare turpis ex, in scelerisque urna molestie non. Suspendisse et felis ex. Aenean pulvinar posuere dui quis ornare. Fusce mollis lacus mi, ut euismod risus vestibulum sit amet. Ut dictum tempus hendrerit."
)

cat2 = Category.create!(
  name: 'Ipsum',
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare turpis ex, in scelerisque urna molestie non. Suspendisse et felis ex. Aenean pulvinar posuere dui quis ornare. Fusce mollis lacus mi, ut euismod risus vestibulum sit amet. Ut dictum tempus hendrerit."
)

course1 = Course.create!(
  name: 'Consectetur adipiscing',
  description: "Proin iaculis placerat neque, vel rhoncus diam. Morbi vehicula ipsum libero, eu sollicitudin sem mollis in. Etiam gravida, magna in volutpat sagittis, mi nibh tincidunt ex, vitae tempus ipsum mi blandit magna."
)

course2 = Course.create!(
  name: "Quis ornare",
  description: "Morbi vehicula ipsum libero, eu sollicitudin sem mollis in. Etiam gravida, magna in volutpat sagittis, mi nibh tincidunt ex, vitae tempus ipsum mi blandit magna. Fusce ornare placerat velit, sit amet tempus tortor porttitor id."
)

course3 = Course.create!(
  name: 'Consectetur adipiscing',
  description: "Proin iaculis placerat neque, vel rhoncus diam. Morbi vehicula ipsum libero, eu sollicitudin sem mollis in. Etiam gravida, magna in volutpat sagittis, mi nibh tincidunt ex, vitae tempus ipsum mi blandit magna."
)

course4 = Course.create!(
  name: 'Placerat neque',
  description: "Proin iaculis placerat neque, vel rhoncus diam. Morbi vehicula ipsum libero, eu sollicitudin sem mollis in. Etiam gravida, magna in volutpat sagittis, mi nibh tincidunt ex, vitae tempus ipsum mi blandit magna."
)

names = %w[Morbi vehicula ipsum libero rhoncus sollicitudin vehicula mollis sollicitudin]
description = "Sed a lorem nec nunc interdum aliquet non at mauris. Cras commodo gravida lorem. Nam fermentum sem vitae elit lobortis, sit amet vulputate lectus ornare. Nam a malesuada sem, ac sagittis lorem. Cras auctor elementum ante, vel imperdiet eros."
20.times do
  LearningModule.create!(
    name: names.sample,
    description: description,
    difficulty: Random.rand(1..5),
    module_type: LearningModule.module_types.keys.sample
  )
end

course1.learning_modules << LearningModule.all[0..10]
course2.learning_modules << LearningModule.all[10..20]
course3.learning_modules << LearningModule.all[0..10]
course4.learning_modules << LearningModule.all[10..20]

cat1.courses << [course1, course2]
cat2.courses << [course3, course4]