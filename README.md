# Nginx Proxy for Mixpanel
An example nginx config that serves as a proxy to Mixpanel's Ingestion API and JavaScript library endpoints. To learn more, visit our [docs on Tracking via Proxy](https://docs.mixpanel.com/docs/tracking/how-tos/tracking-via-proxy).

## Installation

There are a few ways you can use this repo to deploy a server that can be use to proxy Mixpanel API requests: one-click deploy to cloud, build a docker image, or copy and paste the nginx settings to your own nginx config file.

### Option 1: One-click Deploy

[![Google Cloud Btn]][Google Cloud Deploy]
[<img src=https://www.deploytodo.com/do-btn-blue.svg width=198px />][Digital Ocean Deploy]
[![Heroku Btn]][Heroku Deploy]
[![Azure Btn]][Azure Deploy]
[![Railway Btn]][Railway Deploy]
[![Vercel Btn]][Vercel Deploy]
[![Netlify Btn]][Netlify Deploy]
[![Render Btn]][Render Deploy]

<!-- URLS -->

[Google Cloud Btn]: https://binbashbanana.github.io/deploy-buttons/buttons/remade/googlecloud.svg
[Google Cloud Deploy]: https://deploy.cloud.run

[Digital Ocean Btn]: https://www.deploytodo.com/do-btn-blue.svg
[Digital Ocean Deploy]: https://cloud.digitalocean.com/apps/new?repo=https://github.com/mixpanel/tracking-proxy/tree/master

[Heroku Btn]: https://binbashbanana.github.io/deploy-buttons/buttons/remade/heroku.svg
[Heroku Deploy]: https://heroku.com/deploy/?template=https://github.com/ak--47/tracking-proxy/tree/one-clicks


<!-- [Azure Btn]: https://binbashbanana.github.io/deploy-buttons/buttons/remade/azure.svg
[Azure Deploy]: https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Fquickstarts%2Fmicrosoft.web%2Fwebapp-linux-node%2Fazuredeploy.json

[Railway Btn]: https://binbashbanana.github.io/deploy-buttons/buttons/remade/railway.svg
[Railway Deploy]: https://railway.app/new/template?template=https://github.com/mixpanel/tracking-proxy

[Vercel Btn]: https://binbashbanana.github.io/deploy-buttons/buttons/remade/vercel.svg
[Vercel Deploy]: https://vercel.com/new/clone?repository-url=https://github.com/mixpanel/tracking-proxy

[Netlify Btn]: https://binbashbanana.github.io/deploy-buttons/buttons/remade/netlify.svg
[Netlify Deploy]: https://app.netlify.com/start/deploy?repository=https://github.com/mixpanel/tracking-proxy

[Render Btn]: https://binbashbanana.github.io/deploy-buttons/buttons/remade/render.svg
[Render Deploy]: https://render.com/deploy?repo=https://github.com/mixpanel/tracking-proxy -->

### Option 2: Docker Image
   Assuming you have Docker installed on your system, you can do the following:
   
   1. Clone the repo
   2. Build the Docker image: `docker build -t mixpanel-proxy .`
   3. Run a container using the image: `docker run --name my-tracking-proxy -d -p 8080:80 mixpanel-proxy`
   4. Visit `http://localhost:8080`
   
   For production, you would deploy this docker image to whatever servers you run your production services on.

### Option 3: Add locations to your existing Nginx config
   If you already have servers running nginx, you can copy and paste the locations from the [nginx.conf](https://github.com/mixpanel/tracking-proxy/blob/master/nginx.conf) file in this repo and adjust the locations to match your preference.


### Testing

Once you have a running container, you can test it with:
```bash
nginx -t -c
```

If you wish to load test your proxy, see **[mp-proxy-load-test](https://github.com/ak--47/mp-proxy-load-test/)**
