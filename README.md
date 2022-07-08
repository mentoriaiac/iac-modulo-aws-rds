## Infraestrutura
Imagem da infraestrutura do Módulo


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="aws"></a> [aws](#requirement\aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.0.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.3.2 |

## Modules

Este modulo permite provisionar Postgres RDS e System Manager Parameter Store.

### O que será criado?
- RDS Postgres database
- System Manager Parameter Store.
- Security group de RDS
- Subnet group de RDS


### O que é o Amazon RDS?
O Amazon Relational Database Service (Amazon RDS) é uma coleção de serviços gerenciados que facilita a configuração, operação e escalabilidade de bancos de dados na nuvem. Escolha entre sete opções de mecanismos bastante utilizados: Amazon Aurora compatível com MySQL, Amazon Aurora compatível com PostgreSQL, MySQL, MariaDB, PostgreSQL, Oracle e SQL Server.

### O que é o System Manager Parameter Store?

O Parameter Store, um recurso do AWS Systems Manager, oferece armazenamento hierárquico seguro para gerenciamento de dados de configuração e gerenciamento de segredos. Você pode armazenar dados, como senhas, strings de banco de dados, IDs de Amazon Machine Images (AMIs) e códigos de licença como valores de parâmetro. Você pode armazenar valores como texto sem formatação ou dados criptografados. Você pode referenciar parâmetros do Systems Manager em seus scripts, comandos, documentos do SSM e fluxos de trabalho de configuração e automação usando o nome exclusivo especificado ao criar o parâmetro.

> Para saber mais sobre AWS ECS acesso o link: https://docs.aws.amazon.com/pt_br/systems-manager/latest/userguide/systems-manager-parameter-store.html

## Recursos utilizados nesse projeto:

| Name | Type |
|------|------|
| [aws_db_instance.rapadura](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.rds_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_security_group.sg_rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ssm_parameter.db_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.db_name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.db_passwd](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.db_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [random_password.postgres_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Region of Amazon AWS | `string` | `"us-east-1"` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | n/a | `string` | `"mariaquiteria"` | no |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | Username of the database | `string` | `"mariaquiteriaadmin"` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | n/a | `map(any)` | <pre>{<br>  "Application": "maria-quiteria",<br>  "Environment": "Production",<br>  "Name": "RDS_mariaquiteria",<br>  "Owner": "Mentoria-IAC",<br>  "Team": "Mentoria-IAC",<br>  "Terraform": "Yes"<br>}</pre> | no |
| <a name="input_engine"></a> [engine](#input\_engine) | The database engine | `string` | `"postgres"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The engine version for database | `number` | `"12.7"` | no |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | The name of the RDS instance | `string` | `"database-mariaquiteria"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The RDS instance class | `string` | `"db.t2.micro"` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | Name of the DB parameter group to associate | `string` | `"default.postgres12"` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | n/a | <pre>list(<br>    object({<br>      type        = string,<br>      name        = string,<br>      description = string,<br>      value       = string,<br>    })<br>  )</pre> | `[]` | no |
| <a name="input_port"></a> [port](#input\_port) | The database port | `number` | `"5432"` | no |
| <a name="input_proj_name"></a> [proj\_name](#input\_proj\_name) | n/a | `string` | `"mariaquiteria"` | no |
| <a name="input_snapshot"></a> [snapshot](#input\_snapshot) | skip snapshot | `string` | `"true"` | no |
| <a name="input_storage"></a> [storage](#input\_storage) | The allocated storage | `number` | `20` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | The type of the storage | `string` | `"gp2"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | n/a | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_endpoint"></a> [db\_endpoint](#output\_db\_endpoint) | n/a |
| <a name="output_rds_hostname"></a> [rds\_hostname](#output\_rds\_hostname) | RDS instance hostname |
| <a name="output_rds_port"></a> [rds\_port](#output\_rds\_port) | RDS instance port |
| <a name="output_rds_username"></a> [rds\_username](#output\_rds\_username) | RDS instance root username |


## Como usar esse módulo
[Acesse o passo-a-passo](how-to-use-this-module/README.md)

---
# Utilizando o módulo

### Pré-Requisitos

| Name | Version |
|------|---------|
| [terraform](#requirement\_terraform) | >= 1.0.0 |

### Criar `terrafile.tf`
Crie um arquivo `terraform.tf` com o seguinte conteúdo. E altere os valores das variáveis. 

```hcl
module "rds_mariaquiteria" {
    source = "../"
    subnet_ids = ["subnet-00825b5be94f27bfe", "subnet-066dc161feeef4a79"]
    proj_name = "mariaquiteria"
    vpc_id = "vpc-07f5d91b4aa236675"
    port = 5432
    storage = 20
    storage_type = "gp2"
    engine = "postgres"
    engine_version = "12.7"
    instance_type = "db.t2.micro"
    db_name = "mariaquiteria"
    db_username = "mariaquiteriaadmin"
    identifier = "database-mariaquiteria"
    parameter_group_name = "default.postgres12"
    snapshot = true  
}
```

### Provisionando RDS e SSM
Após preencher os valores requiridos utilize os comandos abaixo para provisonar cluster e suas aplicação.

```shell
terraform init 
terraform fmt
terraform validate
terraform plan
terraform apply
```

### Descrição dos comandos:
Segue uma breve descrição dos comandos listados acima. 
>**terraform init**: Execute o terraform init para baixar todos os plugins necessários.
>**terraform fmt**: O comando é usado para reescrever os arquivos de configuração do Terraform para um formato e estilo canônicos.
>**terraform validate**: Comando valida sintaticamente os arquivos de configuração em um diretório.
>**terraform plan**: Executar um plano de terraform e colocá-lo em um arquivo chamado plano.
>**terraform apply**: Usa plano para aplicar as alterações na AWS.