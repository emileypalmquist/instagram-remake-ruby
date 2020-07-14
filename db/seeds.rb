User.destroy_all
Follow.destroy_all

em = User.create(name: "Emiley", bio: 'hello world', username: 'em', password: 'helloworld')
ca = User.create(name: "Carisa", bio: 'hello world', username: 'ca', password: 'helloworld')
ka = User.create(name: "Kailey", bio: 'hello world', username: 'ka', password: 'helloworld')
ma = User.create(name: "Melana", bio: 'hello world', username: 'ma', password: 'helloworld')
ay = User.create(name: "Ayva", bio: 'hello world', username: 'ay', password: 'helloworld')


follow1 = Follow.create(follower: em, followee: ca)
follow2 = Follow.create(follower: em, followee: ka)
follow3 = Follow.create(follower: em, followee: ma)
follow4 = Follow.create(follower: ca, followee: ay)
follow5 = Follow.create(follower: ca, followee: ma)