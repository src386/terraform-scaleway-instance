output "public_ip" {
  description = "List of Public IPs"
  value       = scaleway_instance_ip.ip.*.address
}