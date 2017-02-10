# AppPrototype

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
In Chrome, you may instead have to visit [`127.0.0.1:4000`](http://127.0.0.1:4000)

You should also run the tests at this time.

Once you're up & running, search the code base for `AppPrototype` and `app_prototype`.  Also remove any demo content, which is easy to determine from the elements on the landing page.

## Requirements
  * phantomjs is required for acceptance testing with Wallaby, i.e. `yarn global add phantomjs`. [`Lean more about wallaby`](https://github.com/keathley/wallaby)

## Recommendations
  * If you use [`asdf`](https://github.com/asdf-vm/asdf), you'll be set up with the correct versions of `node` and `elixir` once they're installed. Otherwise, have a look at `.tool-versions` to see the current versions.

## Notes
  * You will see warnings from several dependencies the first time they're compiled.
    This is because many of them have not yet been upgraded for elixir 1.4, and they can be ignored.

## Learn more about Phoenix

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
