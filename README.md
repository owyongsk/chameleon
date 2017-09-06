![Chameleon](https://chameleon-sk.herokuapp.com/chameleon/icon_128.png)

Icon made by [Freepik](www.freepik.com) from (www.flaticon.com)

Chameleon
=========

A quick and simple roll your own Dropbox public folder (on your Dropbox).

## Usage on free heroku dyno

  1. Create an app on your https://www.dropbox.com/developers/apps/create, choose "Dropbox API", set
     permissions to "Apps folder", generate a token
     ![Dropbox New App](https://chameleon-sk.herokuapp.com/chameleon/dropbox_new_app.png "Dropbox New App")
  2. [Deploy](https://heroku.com/deploy?template=https://github.com/owyongsk/chameleon&env[DROPBOX_TOKEN=never_gonna_give_you_up]) this app to heroku.
  3. Set your token as env variable DROPBOX_TOKEN
  4. Move all your files to your `~/Dropbox/Apps/'dropbox-app-name-earlier'` folder
  5. Look at your file at `https://example.herokuapp.com/path/to/file.html` if
     you have a file `~/Dropbox/Apps/'dropbox-app-name-earlier'/path/to/file.html`

  [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/owyongsk/chameleon&env[DROPBOX_TOKEN=never_gonna_give_you_up])

## Installation on your own server

  1. Install Erlang, Elixir, with instructions from [here](https://elixir-lang.org/install.html). Make sure it is Elixir v1.0.5, Erlang v18.1
  2. Clone this repo
  3. Run `mix deps.get` in the app folder
  4. Run `mix run --no-halt`

## Caution!
  * Might get rate limited by Dropbox at some point, each browser get request is an API call to Dropbox.
  * Heroku's free tier might put your app to sleep, use uptimerobot.com to ping your site if you want it up all the time

## TODO

  * Caching?
  * Tests?
  * Error pages?
  * Dev environment

  Pull requests or feedback welcomed!
