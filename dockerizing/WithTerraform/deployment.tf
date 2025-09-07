resource "kubernetes_deployment" "node_app" {
  metadata {
    name = "node-app-deployment"
    labels = {
      app = "node-app"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "node-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "node-app"
        }
      }

      spec {
        container {
          name  = "node-app"
          image = "<username>/my-node-app:1.0"

          port {
            container_port = 3000
          }

          resources {
            limits = {
              cpu    = "250m"
              memory = "256Mi"
            }
            requests = {
              cpu    = "100m"
              memory = "128Mi"
            }
          }
        }
      }
    }
  }
}
