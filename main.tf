# Query availability zone
data "ucloud_zones" "default" {}

# Query image
data "ucloud_images" "default" {
  availability_zone = "${data.ucloud_zones.default.zones.0.id}"
  name_regex        = "${var.image_name_regex}"
  image_type        = "${var.image_type}"
}

# Create uhost instance
resource "ucloud_instance" "instances" {
  image_id          = "${var.image_id == "" ? data.ucloud_images.default.images.0.id : var.image_id }"
  availability_zone = "${var.availability_zone == "" ? data.ucloud_zones.default.zones.0.id : var.availability_zone}"
  instance_type     = "${var.instance_type}"
  root_password     = "${var.password}"
  name              = "${var.instance_count < 2 ? var.instance_name : format("%s-%s", var.instance_name, format(var.count_format, count.index+1))}"
  charge_type       = "${var.charge_type}"
  duration          = "${var.duration}"
  tag               = "${var.tag}"
  security_group    = "${var.security_group}"
  vpc_id            = "${var.vpc_id}"
  subnet_id         = "${var.subnet_id}"

  data_disk_size = "${var.local_disk_size}"
  data_disk_type = "${var.local_disk_type}"

  # boot_disk_size = "${var.boot_disk_size}"
  boot_disk_type = "${var.boot_disk_type}"

  count = "${var.instance_count}"
}

# Create eip
resource "ucloud_eip" "eips" {
  bandwidth     = "${var.eip_bandwidth}"
  internet_type = "${var.eip_internet_type}"
  charge_type   = "${var.charge_type}"
  charge_mode   = "${var.eip_charge_mode}"
  duration      = "${var.duration}"
  name          = "${var.eip_count_per_instance < 2 ? var.eip_name : format("%s-%s", var.eip_name, format(var.count_format, count.index+1))}"
  tag           = "${var.tag}"

  count = "${var.eip_count_per_instance * var.instance_count}"
}

# Bind eip to instance
resource "ucloud_eip_association" "default" {
  resource_id = "${ucloud_instance.instances.*.id[count.index%var.instance_count]}"
  eip_id      = "${ucloud_eip.eips.*.id[count.index]}"
  count       = "${(var.instance_count > 0 && var.eip_count_per_instance > 0) ? var.eip_count_per_instance * var.instance_count : 0}"
}

# Create cloud disk
resource "ucloud_disk" "disks" {
  availability_zone = "${var.availability_zone == "" ? data.ucloud_zones.default.zones.0.id : var.availability_zone}"
  name              = "${var.disk_count_per_instance < 2 ? var.disk_name : format("%s-%s", var.disk_name, format(var.count_format, count.index+1))}"
  disk_size         = "${var.disk_size}"
  disk_type         = "${var.disk_type}"
  charge_type       = "${var.charge_type}"
  duration          = "${var.duration}"
  tag               = "${var.tag}"
  count             = "${var.disk_count_per_instance * var.instance_count}"
}

# Attach disk to instance
resource "ucloud_disk_attachment" "default" {
  availability_zone = "${var.availability_zone == "" ? data.ucloud_zones.default.zones.0.id : var.availability_zone}"
  instance_id       = "${ucloud_instance.instances.*.id[count.index%var.instance_count]}"
  disk_id           = "${ucloud_disk.disks.*.id[count.index]}"
  count             = "${(var.disk_count_per_instance > 0 && var.instance_count > 0) ? var.disk_count_per_instance * var.instance_count: 0}"
}
