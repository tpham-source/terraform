terraform {
  backend "gcs" {
    bucket = "tpham-tfstate"
  }
}
