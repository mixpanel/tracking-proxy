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
[Digital Ocean Deploy]: https://cloud.digitalocean.com/apps/new?repo=https://github.com/mixpanel/tracking-proxy/tree/master

[Railway Btn]: https://binbashbanana.github.io/deploy-buttons/buttons/remade/railway.svg
[Railway Deploy]: https://railway.app/template/_RaWSW

[Render Btn]: https://binbashbanana.github.io/deploy-buttons/buttons/remade/render.svg
[Render Deploy]: https://render.com/deploy?repo=https://github.com/mixpanel/tracking-proxy


<!-- Maybe later? -->

<!-- Heroku's app.json conflicts with GCP 0_o  -->
[Heroku Btn]: https://binbashbanana.github.io/deploy-buttons/buttons/remade/heroku.svg
[Heroku Deploy]: https://heroku.com/deploy/?template=https://github.com/mixpanel/tracking-proxy

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

You can also verify the nginx config on the command line:

```bash
nginx -t -c /etc/nginx/nginx.conf
```
   
For production, you would deploy this docker image to whatever servers you run your production services on.

### Option 3: Add locations to your existing Nginx config
If you already have servers running nginx, you can copy and paste the locations from the [nginx.conf](https://github.com/mixpanel/tracking-proxy/blob/master/nginx.conf) file in this repo and adjust the locations to match your preference.

### Additional Configuration
In case you see events tracked to your project, but geo-location properties are not being added correctly, there's likely a configuration issue with passing the IP address through the headers. Within the [nginx configuration]([url](https://github.com/mixpanel/tracking-proxy/blob/2c08e999d4b38aa943fad55884bcfe0ef72bb681/nginx.conf#L31)), by default, we leverage `$http_x_forwarded_for` and pass it through the `X-Real-IP` header to forward the IP from the original client; in some providers, this is not available and you will want to review which header/variable provides the IP address from the client. As an example, in Cloudflare, you need to pass `$realip_remote_addr` instead. You'll want to review the option that applies to your cloud provider.

When you're seeing events ingested into Mixpanel, but no geo-location data included as properties (you don't see the mp_country_code property created, for example), one more aspect to check is if the query string param/value `ip=1` is being passed to our ingestion endpoint. Our client-side libraries, by default (unless you've disabled geo-location tracking), will append `ip=1` to the URL of the ingestion endpoint to indicate we should parse geo-location from the IP address of the incoming request. In some setups, this param might not be included in the request from the proxy, so it's also an aspect to check in this situation.

### EU Residency
This proxy server resolves requests to `api.mixpanel.com`, which points to Mixpanel's primary data centers in the United States. If you are using Mixpanel's **[EU Data Residency](https://docs.mixpanel.com/docs/other-bits/privacy-and-security/eu-residency)**, you will need to change the [nginx.config](https://github.com/mixpanel/tracking-proxy/blob/master/nginx.conf#L34) from `api.mixpanel.com` to `api-eu.mixpanel.com`

### Load Testing

If you wish to load test your proxy, see **[mp-proxy-load-test](https://github.com/ak--47/mp-proxy-load-test/)** for a load testing script with artillery.
