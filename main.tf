terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "sagya"

    workspaces {
      name = "TestDB"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "TESTDB" {
  name    = "TESTDB"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_schema" "demo_schema" {
  database = snowflake_database.TESTDB.name
  name     = "DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"
}



