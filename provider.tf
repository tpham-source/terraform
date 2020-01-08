provider "google" {
  credentials = file("./creds/serviceaccount.json")
  project     = "poc-sed-wss-testenv"
  region      = "us-west1"
}
