# Nginx Proxy for Mixpanel
An example nginx config that serves as a proxy to Mixpanel's Ingestion API and JavaScript library endpoints. To learn more, visit our [docs on Tracking via Proxy](https://docs.mixpanel.com/docs/tracking/how-tos/tracking-via-proxy).

## Installation

There are a few ways you can use this repo to deploy a server that can be use to proxy Mixpanel API requests: one-click deploy to cloud, build a docker image, or copy and paste the nginx settings to your own nginx config file.

### Option 1: One-click Deploy
   - [Run on Google Cloud](https://deploy.cloud.run)
   - [Deploy to DigitalOcean](https://cloud.digitalocean.com/apps/new?repo=https://github.com/mixpanel/tracking-proxy/tree/master)
   
### Option 2: Docker Image
   Assuming you have Docker installed on your system, you can do the following:
   
   1. Clone the repo
   2. Build the Docker image: `docker build -t mixpanel-proxy .`
   3. Run a container using the image: `docker run --name my-tracking-proxy -d -p 8080:80 mixpanel-proxy`
   4. Visit `http://localhost:8080`
   
   For production, you would deploy this docker image to whatever servers you run your production services on.

### Option 3: Add locations to your existing Nginx config
   If you already have servers running nginx, you can copy and paste the locations from the [nginx.conf](https://github.com/mixpanel/tracking-proxy/blob/master/nginx.conf) file in this repo and adjust the locations to match your preference.
