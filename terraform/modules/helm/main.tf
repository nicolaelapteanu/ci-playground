resource "helm_release" "nodejs_app" {
  name             = "${var.environment}-nodejs-app"
  chart            = var.chart_path
  namespace        = var.namespace
  create_namespace = true
  max_history      = var.max_history

  values = [
    file(var.values_file_path)
  ]

  timeout = 1800
}
