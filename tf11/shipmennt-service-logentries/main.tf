# -----------------------------------------------------------------------------
# Setup Logentries provider.
# -----------------------------------------------------------------------------
provider "logentries" {
  account_key = "1a50e275-75c6-465f-a6be-62ef02d63994"
}

resource "logentries_logset" "processor" {
  name = "shipment-service-processor"
}

resource "logentries_log" "app_log" {
  logset_id = "${logentries_logset.processor.id}"
  name      = "local"
  source    = "token"
}
