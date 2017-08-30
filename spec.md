Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - Built with Sinatra. Sinatra gem and others required in Gemfile.
- [x] Use ActiveRecord for storing information in a database - Models require ActiveRecord::Base and Migration tables require ActiveRecord::Migration[5.1].
      Uses gem 'activerecord', :require => 'active_record' and gem 'sinatra-activerecord', :require => 'sinatra/activerecord' and gem 'sqlite3'
      Persists to development.sqlite
- [x] Include more than one model class (User, CoffeeHouse, CoffeeHouseUser)
- [x] Include at least one has_many relationship (users and cofee_houses have a many to many relationship)
- [x] Include user accounts - Accounts are created through '/signup' route and form in signup.erb view
- [x] Ensure that users can't modify content created by other users - In CoffeeHousesController the '/coffee_houses/:slug/edit' route checks the join table to make sure the coffee_houses_id and user_id are a match before showing the edit page. Also the edit link and delete button only show up on a users review page by checking if the current_user is a match for the users page by checking each slug
- [x] Include user input validations - checks that users have a username and password before signing up or logging in.
      Checks that a Coffee House has a name, location, and review (none blank) before creating or editing Coffee House.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
