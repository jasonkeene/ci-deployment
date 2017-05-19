resource "digitalocean_droplet" "ci" {
    image = "ubuntu-16-10-x64"
    name = "ci"
    region = "nyc2"
    size = "512mb"
    private_networking = false
    ssh_keys = [
        "${var.ssh_fingerprint}"
    ]

    user_data = "${data.template_file.ci_cloud_config.rendered}"
}

resource "digitalocean_floating_ip" "ci_ip" {
    droplet_id = "${digitalocean_droplet.ci.id}"
    region = "${digitalocean_droplet.ci.region}"
}

data "template_file" "ci_cloud_config" {
    template = "${file("cloud-config/ci")}"
    vars {
        authorized_key = "${file(var.pub_key)}"
    }
}
