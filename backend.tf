terraform {
  backend "gcs" {
    bucket = "tpham-tfstate"
    credentials = "./creds/serviceaccount.json"
  }
}
