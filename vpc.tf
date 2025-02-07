resource "ibm_is_vpc" "testacc_vpc" {
  name = "testvpc1"
  default_security_group_name = "anshuk6469"
}

resource "ibm_is_vpc_routing_table" "example" {
  name = "example-routing-table"
  vpc  =  ibm_is_vpc.testacc_vpc.id
}

resource "ibm_is_subnet" "example" {
  name            = "example-subnet"
  vpc             = ibm_is_vpc.testacc_vpc.id
  zone            = "us-south-1"
  ipv4_cidr_block = "10.240.0.0/24"
  routing_table   = ibm_is_vpc_routing_table.example.routing_table

  //User can configure timeouts
  timeouts {
    create = "90m"
    delete = "30m"
  }
}