user = User.create(
	first_name: 'Alex',
	last_name: 'Dovzhanyn',
	email: 'dovzhanyn.alex@gmail.com',
	password: 'password',
	role: :administrator
)

Listing.create(
	title: 'Help me create a partnerships app', 
	description: 'This app will let people find partners for projects they want to work on.',
	user_id: user.id,
	category: 'Software'
)
