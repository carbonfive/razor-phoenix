## Phoenix Prototype app
A convenience skeleton project for Phoenix.

* Phoenix
* PostgreSQL
* Slim
* Sass
* Bootstrap
* Wallaby
* Yarn
* additional `acceptance` environment
* CI testing via CircleCI
* ready for deployment to Heroku Pipelines in `acceptance` and `prod` environments

## Getting started
After you've cloned the app, perform global replacements for these with your app name:
  * `AppPrototype`
  * `app_prototype`
  * `app-prototype`
  * `App Prototype`

Also rename the following directories & files:
  * `/lib/app_prototype`
  * `/web/static/css/_app_prototype.scss`
  * `/web/static/js/app_prototype.js`

Verify that things are working:
  * `brunch build`
  * `mix test`

Now you're ready to remove demo content, which is easy to spot from the landing page.

## Running the server
  Each environment is responsible for setting the `SECRET_KEY_BASE`.  With the exception of the `test` environment, this value is derived from a system environment variable.

  To set environment variables locally for the `dev` environment, you can create a `.env` file & run the server with a tool that reads `.env`.  I recommend `heroku local` to mirror production more closely, or foreman.

#### Sample `.env` file
```
MIX_ENV="dev"
SECRET_KEY_BASE="xxxxxx"
```
`SECRET_KEY_BASE` can be generated with the task `mix phoenix.gen.secret`.

As a convenience, a weak `SECRET_KEY_BASE` is hard-coded in the `test` environment. You can easily change this to read an env var a la the other environments instead.

## Requirements
  * phantomjs is required for acceptance testing with Wallaby, i.e. `yarn global add phantomjs`.
[Lean more about wallaby](https://github.com/keathley/wallaby)

## Recommendations
  * If you use [asdf](https://github.com/asdf-vm/asdf), you'll be set up with the correct versions of `node` and `elixir` once they're installed. Otherwise, have a look at `.tool-versions` to see the current versions.

## Deployment
  This app is pre-configured for easy deployment to Heroku w/ pipelines using CircleCI.  CI is only used to run tests; your pipelines should be configured to auto-deploy branches after passing CI tests.

  Convention is to auto-deploy `master` branch to `acceptance`, and `production` branch to `prod`.

  * Create Heroku apps for `acceptance` and `production`
  * Provision Heroku Postgres DB resources
  * Add buildpacks to Heroku apps
    * `heroku buildpacks:add "https://github.com/HashNuke/heroku-buildpack-elixir.git"`
    * `heroku buildpacks:add https://github.com/gjaldon/heroku-buildpack-phoenix-static.git`
  * Add environment variables to Heroku
    * `SECRET_KEY_BASE`, which can be generated with the task `mix phoenix.gen.secret`
    * `MIX_ENV` should be `acceptance` and `prod` respectively
    * `POOL_SIZE` should be set 2 units below the max db connections allowed by the Heroku instance. This allows mix tasks to be run with 2 connections.
    * `DATABASE_URL` should have been filled automatically by provisioning heroku postgres.

## Notes
  * You will see warnings from several dependencies the first time they're compiled.
    This is because many of them have not yet been upgraded for elixir 1.4; these can be safely ignored.

## Learn more about Phoenix

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
