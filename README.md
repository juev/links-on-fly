# link-on-fly

## Prerequisites

 - a [fly.io](https://fly.io/) account
 - a clone of this repository

All commands should be run in the directory of your local clone of this repository.

## Install flyctl

Follow [the instructions](https://fly.io/docs/getting-started/installing-flyctl/) to install fly's command-line interface `flyctl`.

Then, [log into flyctl](https://fly.io/docs/getting-started/log-in-to-fly/).

```sh
flyctl auth login
```

## Add a persistent volume

Create a [persistent volume](https://fly.io/docs/reference/volumes/). Fly's free tier includes `3GB` of storage across your VMs. Since `linkding` is very light on storage, a `1GB` volume will be more than enough for most use cases. It's possible to change volume size later. A how-to can be found in the _"scale persistent volume"_ section below.

```sh
flyctl volumes create linkding_data --region <your_region> --size <size_in_gb>
```

### Deploy to fly

Deploy the application to fly.

```sh
flyctl deploy
```

If all is well, you can now access linkding by running `flyctl open`. You should see its login page.

### Create a linkding superuser

If you have never used fly's SSH console before, begin by setting up fly's ssh-agent.

```sh
flyctl ssh establish

# use agent if possible, otherwise follow on-screen instructions.
flyctl ssh issue --agent
```

Then, run `flyctl ssh console` to get an interactive shell in your running container. You can now create a superuser by running the `createsuperuser` command and entering a password.

```sh
cd /etc/linkding
python manage.py createsuperuser --username=<your_username> --email=<your_email>
exit
```

That's it! You can now log into your linkding installation and start using it.

If you wish, you can [configure a custom domain for your install](https://fly.io/docs/app-guides/custom-domains-with-fly/).

## Verify the installation

 - you should be able to log into your linkding instance.
 - your user data should survive a restart of the VM.


