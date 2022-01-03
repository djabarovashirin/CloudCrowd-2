
instance_type = "t2.micro"
ami           = "0ed9277fb7eb570c9"


db_instance_class = "db.r3.2xlarge"
engine            = "mysql"
engine_version    = "5.7.22"
vpc_cidr          = "10.0.0.0/16"

subnet_cidrs = {
  public1  = "10.0.1.0/24"
  public2  = "10.0.0.0/24"
  private1 = "10.0.2.0/24"
  private2 = "10.0.3.0/24"
  private3 = "10.0.4.0/24"
  private4 = "10.0.5.0/24"
  private5 = "10.0.6.0/24"
  private6 = "10.0.7.0/24"
}