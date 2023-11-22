data "terraform_remote_state" "sg_csv"{
  backend = "remote"
  config = {
    organization = "Golfzon"
    workspaces = {
      name = "scenario_6_sg_csv"
    }
  }
}