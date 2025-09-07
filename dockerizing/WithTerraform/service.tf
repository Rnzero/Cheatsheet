resource "kubernetes_service" "node_app_svc" {
  metadata {
    name = "node-app-service"
  }

  spec {
    selector = {
      app = node-app
## Best practice to use: kubernetes_deployment.node_app.metadata[0].labels.app to avoid hardcoding      
      
    }

    port {
      port        = 80
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}
