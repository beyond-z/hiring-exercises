#!/bin/bash
echo "`date`: Copying environment files in: `pwd`"
cp .env.example .env
cp .env.database.example .env.database
echo "Building and bring the Docker containers up"
docker-compose up -d
echo "Creating and seeding the database"
docker-compose exec career-mgr-hiring rake db:create db:schema:load db:init db:seed
echo "If nothing failed, the My Career Manager site should be available at: http://localhost:3050"
