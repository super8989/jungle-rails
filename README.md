# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Features

### User:

- can register and log in
- can view all products or by categories
- can view details of products: price and remaining quantities
- can add items to carts and checkout (Stripe implemented)

### Admin

- can log in as an administrator
- has privileges to create/delete categories and products

## Screenshots

!["screenshot of homepage"](https://github.com/super8989/jungle-rails/blob/master/docs/01Home.png?raw=true)

!["screenshot of product"](https://github.com/super8989/jungle-rails/blob/master/docs/02Product.png?raw=true)

!["screenshot of cart"](https://github.com/super8989/jungle-rails/blob/master/docs/03Cart.png?raw=true)

!["screenshot of checkout"](https://github.com/super8989/jungle-rails/blob/master/docs/04Checkout.png?raw=true)

!["screenshot of admin"](https://github.com/super8989/jungle-rails/blob/master/docs/05Admin.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
