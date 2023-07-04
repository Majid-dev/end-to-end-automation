terraform {
  cloud {
    organization = "poorsam"

    hostname = "app.terraform.io"

    workspaces {
      name = "end-to-end-automation"
    }
  }
}