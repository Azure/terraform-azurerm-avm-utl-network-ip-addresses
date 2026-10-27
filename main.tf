removed {
  from = modtm_telemetry.telemetry

  lifecycle {
    destroy = false
  }
}

removed {
  from = random_uuid.telemetry

  lifecycle {
    destroy = false
  }
}
