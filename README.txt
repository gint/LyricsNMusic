
************************* [START UP] *************************
1. Install Ruby installer (RubyGems are automatically installed)
2. Install Rails using [gem install rails]
3. Install MySql by running [gem install mysql2]
4. Copy "libmysql.dll" from your MySql "bin" folder to RubyXXX/bin
5. Edit "database.yml" in your "config" folder [projectnamexxx/config]

	development:
	  adapter: mysql2
	  encoding: utf8
	  database: dbname
	  host: localhost
	  pool: 5
	  username: root
	  password: xxxxx
	  socket: /tmp/mysql.sock

6. [rake db:create]
7. [rails server] to run server @ localhost:3000
