![Chameleon](https://chameleon-sk.herokuapp.com/chameleon/icon_128.png)

Icon made by [Freepik](www.freepik.com) from (www.flaticon.com)

Chameleon
=========

A quick and simple roll your own Dropbox public folder (on your Dropbox).

## Instalation

  1. Create an app on your https://www.dropbox.com/developers/apps/create, set
     permissions to "Apps folder" only, generate a token
     ![Dropbox New App](https://chameleon-sk.herokuapp.com/chameleon/dropbox_new_app.png "Dropbox New App")
  2. Set your token as env variable DROPBOX_TOKEN
  3. Move all your files to your `~/Dropbox/Apps/dropbox-app-name-earlier` folder
  4. Look at your file at `https://example.com/path/to/file.html`

Or you can deploy to Heroku for free!

  [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/owyongsk/chameleon&env[DROPBOX_TOKEN=never_gonna_give_you_up])

## Caution!
  Might get rate limited by Dropbox at some point, each browser get request is an API call to Dropbox.

## TODO

  * Caching?
  * Tests?
  * Error pages?
  * Dev environment
  
  Pull requests or feedback welcomed!
