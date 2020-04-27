if Rails.env == 'development'
Tag.create([
  { name: '面白い夢'},
  { name: '幸せな夢'},
  { name: '怖い夢'}
  ])
end

if Rails.env == 'production'
Tag.create([
  { name: '面白い夢'},
  { name: '幸せな夢'},
  { name: '怖い夢'}
  ])
end
