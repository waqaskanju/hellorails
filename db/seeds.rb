# For Creating Users.

User.create(name: 'Robb Stark', photo: 'https://static.wikia.nocookie.net/gameofthrones/images/5/50/S3E9_Robb_Stark_main.jpg/revision/latest?cb=20160718071203',
    bio: 'We will take revenge..')
User.create(name: 'Jon Snow', photo: 'https://static.wikia.nocookie.net/gameofthrones/images/d/d0/JonSnow8x06.PNG/revision/latest?cb=20190714094440',
    bio: 'I place mushrooms everywhere')
User.create(name: 'Sansa Stark', photo: 'https://static.wikia.nocookie.net/gameofthrones/images/6/63/QueenSansa.PNG/revision/latest?cb=20210215100224',
    bio: 'The north is ours')
User.create(name: 'Arya Stark', photo: 'https://static.wikia.nocookie.net/gameofthrones/images/b/be/AryaShipIronThrone.PNG/revision/latest?cb=20190520174300',
        bio: 'I am No One. I have many faces.')

# For creating posts.

Post.create(author_id: User.find_by(name: 'Robb Stark'), Title: 'Our First Victory', Text: 'We fought with Courage')
Post.create(author_id: User.find_by(name: 'Robb Stark'), Title: 'The Red Wedding', Text: 'My Cousing Weeding')
Post.create(author_id: User.find_by(name: 'Jon Snow'), Title: 'The Wall', Text: 'This is a danger place')
Post.create(author_id: User.find_by(name: 'Jon Snow'), Title: 'The King in the North', Text: 'We donot like outsiders')
Post.create(author_id: User.find_by(name: 'Sans Stark'), Title: 'Marring Joffery', Text: 'Harsh Life')
Post.create(author_id: User.find_by(name: 'Aray Star'), Title: 'The house of Undying', Text: 'Magic Every where')

# For Creating Comments

Comment.create(post: Post.find_by(Text: 'Harsh Life'), author_id: User.find_by(name: 'Sans Stark'), 
       text: 'Ashe comment')

Comment.create(post: Post.find_by(Text: 'Magic Every where'), author_id: User.find_by(name: 'Aray Star'),
       text: 'Teemo comment')

Comment.create(post: Post.find_by(Text: 'This is a danger place'), author_id: User.find_by(name: 'Jon Snow'),
       text: 'Teemo comment')

Comment.create(post: Post.find_by(Text: 'Robb Stark'), author_id: User.find_by(name: 'My Cousing Weeding'), 
        text: 'Jinx comment')
