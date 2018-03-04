# Porject Jungle on Rails

## Lighthouse Labs (Vancouver - BC)

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Final Product

![Showing products catalog view]()
![Showing product and reviews view]()

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Instrutions for email testing

### MailCatcher

MailCatcher runs a super simple SMTP server which catches any message sent to it to display in a web interface.

#### Bundler

Please don't put mailcatcher into your Gemfile. It will conflict with your applications gems at some point.

Instead, pop a note in your README stating you use mailcatcher. Simply run `gem install mailcatcher` then `mailcatcher` to get started.

More information <https://mailcatcher.me>

#### AND

On a Vagrant Ubuntu VM it works by :

adding a port forwarding in Vagrantfile
=> `config.vm.network :forwarded_port, host: 1080, guest: 1080`
launching mailcatcher
=> `mailcatcher --ip=0.0.0.0` - remark: Do not set only http with command `mailcatcher --http-ip=0.0.0.0`

More information <https://github.com/sj26/mailcatcher/issues/89>