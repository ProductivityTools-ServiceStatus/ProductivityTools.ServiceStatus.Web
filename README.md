# ProductivityTools.ServiceStatus.Web

React application for displaying the status of various services.

## 🚀 Deployment

This application is deployed on **Google Cloud Run** in the **PTServiceStatus** project.

- **Primary Custom Domain:** [https://servicestatus.productivitytools.top](https://servicestatus.productivitytools.top)
- **Cloud Run URL:** [https://ptservicestatus-309299231472.us-central1.run.app/](https://ptservicestatus-309299231472.us-central1.run.app/)
- **Firebase Hosting (Fallback/Alternative):** [https://pt-servicestatus.web.app/](https://pt-servicestatus.web.app/)

## 🛠️ Build and Development

### Local Docker Build

To build the Docker image locally:

```bash
sudo docker build -t serverstatus .
```

### Run Locally with Docker

To run the container locally:

```bash
sudo docker run -d -p 3000:80 react-application
```

### Push to Google Cloud Artifact Registry

To build and push the image to Google Cloud Artifact Registry:

```bash
gcloud builds submit -t us-central1-docker.pkg.dev/ptservicestatus/ptservicestatusdockerrepository/ptservicestatus ./
```
