# AvoRed e commerce development environment via Docker

## Usage

Execute the below command:

    git clone https://github.com/avored/docker-dev.git
    cd docker-dev
    git clone https://github.com/avored/laravel-ecommerce ./src/frontend
   
Now we need to create a new env file for frontend `./src/frontend/.env`

    VUE_APP_GRAPHQL_API_ENDPOINT=http://localhost:8050/graphql
  
Now we will start the docker container.

    docker-compose up -d
    docker-compose run --rm composer create-project laravel/laravel:8.6 ./
    docker-compose run --rm composer require avored/framework
    docker-compose run --rm composer require avored/dummy-data avored/cash-on-delivery avored/pickup

Now setup `.env` file. Open a avored app .env file which is located at `./src/backend/.env` then setup your database and any other env as per your docker-compose.yml file

    DB_HOST=mysql
    DB_DATABASE=homestead
    DB_USERNAME=homestead
    DB_PASSWORD=secret

Now we just have to install the AvoRed and create an avored admin user account

    docker-compose run --rm artisan avored:install
    docker-compose run --rm artisan vendor:publish --provider="AvoRed\Framework\AvoRedServiceProvider"

Now we need to setup CORS so frontend application can receive api call from backnd.
Open `./src/backend/config/cors.php` then replace the below line

        'paths' => ['/graphql', 'sanctum/csrf-cookie'],
        'allowed_origins' => ['http://localhost:8060'],

That's It. Now you can visit `http://localhost:8060` for frontend and for backend you can visit `http://localhost:8050/admin`
