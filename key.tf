resource "aws_key_pair" "myKEYPAIR" {
  key_name = "mykeypair"
  public_key = "${file("${var.EC2_PUBLIC_KEY}")}"
}
