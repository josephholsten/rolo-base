provider "google" {
  credentials = "${file("~/.config/gce/media.json")}"
  project     = "media-152200"
  region      = "us-west1-a"
}

module "media" {
  source = "github.com/josephholsten/tf_jh_gce_instance"

  environment = "test"
  dc_region   = "us-west1-a"
  role        = "base"
}
