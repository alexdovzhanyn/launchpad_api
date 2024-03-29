user = User.create(
	first_name: 'Alex',
	last_name: 'Dovzhanyn',
	email: 'dovzhanyn.alex@gmail.com',
	password: 'password',
	role: :administrator
)

user2 = User.create(
	first_name: 'Moritz',
	last_name: 'Bischof',
	email: 'moritz.bischof1@gmail.com',
	password: 'password',
	role: :administrator
)

listing = Listing.create(
	title: 'Help me create a partnerships app',
	description: 'This app will let people find partners for projects they want to work on.',
	user_id: user.id,
	category: 'Software'
)

Comment.create(
	content: "Awesome idea, I'll help!!",
	listing_id: listing.id,
	user_id: user2.id
)
