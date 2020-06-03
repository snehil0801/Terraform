locals {
  instance-userdata = <<EOF
#!/bin/bash
export PATH=$PATH:/usr/local/bin
which httpd >/dev/null
if [ $? -ne 0 ];
then
  echo 'HTTPD NOT PRESENT'
  if [ -n "$(which yum)" ]; 
  then
    yum install -y httpd
  else 
    apt-get -y update && apt-get -y install httpd
  fi
else 
  echo 'HTTPD ALREADY PRESENT'
fi
echo "<html><h1>Hello from Snehil</h1></html>" > /var/www/html/hello.html    
service httpd start
EOF
}
resource "aws_instance" "snehil-instance" {
  ami              = var.instance_ami
  instance_type    = var.instance_type
  subnet_id        = var.instance_subnet
  key_name         = var.instance_key
  security_groups  = var.instance_security_group
  user_data_base64 = "${base64encode(local.instance-userdata)}"
  tags = {
    Name = var.instance_name
  }
  /*  provisioner "file" {
    source      = var.bootstrap_script
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh",
    ]
  }
  */
}
