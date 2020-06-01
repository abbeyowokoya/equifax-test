variable "ami-id" {
  default = "ami-09d95fab7fff3776c"   
}
variable "mykey" {
  description = "Enter the path to the pair Key to login to AWS."
  default = "/home/ec2-user/.ssh/abso.pem"
}