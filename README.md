## gpuvps

## Start Up and Shut Down Remote GPU Virtual Private Server

### Quickstart - Testing Out a CPU Instance Launch

* This quickstart assumes a reasonably updated MacOS or Linux Machine with`docker` as well as `docker compose` installed. Ensure you are using `docker compose` and not the deprecated `docker-compose`.
* Assuming you have a Digital Ocean account with a key...from your local machine, within the `gpuvps` repo. [Digital Ocean API Documentation](https://docs.digitalocean.com/reference/api/create-personal-access-token/)

1. Within `./app/` create a directory `./app/keys/`, which MUST STAY ON THE `.gitignore` file as `keys/`.
2. Add a file `digital_ocean_key` and put your Digital Ocean API key in here. Again DO NOT REMOTE `keys/` from the `.gitignore` file for risk of leaking this online.
3. Add a directory `./app/keys/digital_ocean_user/` and create a file `password` and `username`. Create a strong password and put it directly in the `password` file, and within `username` put: `gpuuser`.
4. Navigate to the root directory in your terminal and do: `./run start` ... which will start up a containerized service.
5. Your terminal will put you within the containerized service at `root@container:/app#`. From here you can see that you have access to directories which were injected into your machine: `# ls ansible  inference  keys  scripts  train`. This is where we can build out our infrastructure tools to run inferences and training.
6. Do `exit`, which will allow you to exit from the container. You can get back into the container with `./run bash`.
7. Having confirmed that, you should have the capability to spin up a very cheap test CPU on Digial Ocean which is about $4/month. You can do this by, having bashed back into the container, navigating to the `ansible/` directory, and doing `./ansible-playbook main.yaml` which will bring up an interface with several options.
8. If you select `test` this will test and ensure your connection to Digital Ocean by listing out all of your, "droplets" which are what Digial Ocean calls their Virtual Private Servers (VPS's). Starting out you should have zero.
9. If you select `create_cpu` this will spin up a CPU droplet for you automatically. After you have run this, a success message showing the CPU droplet metadata will show on the screen, and you will start being charged approixmately $0.001 per hour, presuming you used the basic settings and presuming their pricing model is still $4/month. If you run the `ansible-playbook main.yaml` again and select `test` this will list out the droplet. You can navigate to your Digital Ocean dashboard via the web and see the droplet listed. You can shut down the droplet manually from here.