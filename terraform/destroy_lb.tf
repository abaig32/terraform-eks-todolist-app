resource "null_resource" "pre_destroy_cleanup" {
  provisioner "local-exec" {
    when = destroy
    command = <<EOT
kubectl delete svc todolist-app-service --ignore-not-found=true || true
sleep 180
EOT
  }
}

