# Nginx Proxy for Mixpanel
An example nginx config that serves as a proxy to Mixpanel's Ingestion API and JavaScript library endpoints. To learn more, visit our [docs on Tracking via Proxy](https://docs.mixpanel.com/docs/tracking/how-tos/tracking-via-proxy).


## Installation

There are a few ways you can use this repo to deploy a server that can be use to proxy Mixpanel API requests: 

1. **one-click deploy** to your cloud provider
2. **build a docker image** and run it on your own servers
3. **copy and paste** the nginx settings to your existing nginx config file

### Option 1: One-Click Deploy
click on a button below to deploy to your favorite cloud provider:

[![Google Cloud Btn]][Google Cloud Deploy]
[<img src=https://www.deploytodo.com/do-btn-blue.svg width=198px />][Digital Ocean Deploy]
[![Railway Btn]][Railway Deploy]
[![Render Btn]][Render Deploy]


<!-- URLS -->
[Google Cloud Btn]: https://binbashbanana.github.io/deploy-buttons/buttons/remade/googlecloud.svg
[Google Cloud Deploy]: https://deploy.cloud.run

[Digital Ocean Btn]: https://www.deploytodo.com/do-btn-blue.svg
[Digital Ocean Deploy]: https://cloud.digitalocean.com/apps/new?repo=https://github.com/ak--47/tracking-proxy/tree/one-clicks

[Railway Btn]: https://binbashbanana.github.io/deploy-buttons/buttons/remade/railway.svg
[Railway Deploy]: https://railway.app/template/_RaWSW

[Render Btn]: https://binbashbanana.github.io/deploy-buttons/buttons/remade/render.svg
[Render Deploy]: https://render.com/deploy?repo=https://github.com/ak--47/tracking-proxy/tree/one-clicks


<!-- TODOs -->

<!-- Heroku's app.json conflicts with GCP 0_o  -->
[Heroku Btn]: https://binbashbanana.github.io/deploy-buttons/buttons/remade/heroku.svg
[Heroku Deploy]: https://heroku.com/deploy/?template=https://github.com/ak--47/tracking-proxy/tree/one-clicks

<!-- Azure is too... complicated -->
[Azure Btn]: https://binbashbanana.github.io/deploy-buttons/buttons/remade/azure.svg
[Azure Deploy]: https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FYOUR_GITHUB_USERNAME%2FYOUR_REPO_NAME%2FYOUR_BRANCH_NAME%2Fpath%2Fto%2Fazuredeploy.json




### Option 2: Docker Image
   Assuming you have Docker installed on your system, you can do the following:
   
   1. Clone the repo 
   `git clone https://github.com/mixpanel/tracking-proxy`
   2. Build the Docker image: 
   `docker build -t mixpanel-proxy .`
   3. Run a container using the image: 
   `docker run --name my-tracking-proxy -d -p 8080:80 mixpanel-proxy`
   4. Visit 
   `http://localhost:8080`

You should see:

```json
{
  "error": "Welcome. Get started with our API by visiting https://developer.mixpanel.com/"
}
```
This is same response you would get from visiting https://api.mixpanel.com/ (which means your proxy is working as expected).
   
For production, you would deploy this docker image to whatever servers you run your production services on.

### Option 3: Add locations to your existing Nginx config
   If you already have servers running nginx, you can copy and paste the locations from the [nginx.conf](https://github.com/mixpanel/tracking-proxy/blob/master/nginx.conf) file in this repo and adjust the locations to match your preference.

### EU Residency
This proxy server resolves requests to `api.mixpanel.com`, which points to Mixpanel's primary data centers in the United States. If you are using Mixpanel's **[EU Data Residency](https://docs.mixpanel.com/docs/other-bits/privacy-and-security/eu-residency)**, you will need to change the [nginx.config](https://github.com/mixpanel/tracking-proxy/blob/master/nginx.conf#L34) from `api.mixpanel.com` to `api-eu.mixpanel.com`

### Testing

Once you have a running container, you can test it with:
```bash
nginx -t -c
```

If you wish to load test your proxy, see **[mp-proxy-load-test](https://github.com/ak--47/mp-proxy-load-test/)** for a load testing script with artillery.
