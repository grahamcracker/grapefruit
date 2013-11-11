# Grapefruit
### an open source learning portal

* Grapefruit is an RCOS (http://rcos.rpi.edu) project *

### Installation
1. Go to config and rename database-example.yml to database.yml.

2. Change anything in the config as needed, such as MySQL database names, passwords,
etc. Create the database in question and apply all permissions to the user that will 
be accessing it.

3. bundle install

4. rake db:migrate