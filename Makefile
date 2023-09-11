
.SILENT: deploy
PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

DIR := ${CURDIR}

.PHONY: tf_init
tf_init: #- Terrafom init
	cd terraform && terraform init 

.PHONY: tf_validate
tf_validate: #- Terraform Validate
	cd terraform && terraform validate

.PHONY: tf_destroy
tf_destroy: #- Terraform Destroy infrastructure
	cd terraform && terraform destroy

.PHONY: tf_apply
tf_apply: #- Terraform Apply infrastructure changes
	cd terraform && terraform apply -auto-approve

.PHONY: tf_output
tf_output: #- Terraform Show sensitive user data
	cd terraform && terraform output user


.PHONY: create
create: tf_init tf_validate tf_apply tf_output  ## Create on AWS a ReadOnly User
	echo "Finish User creation"

.PHONY: more
more: ## Show extra avaiable Make command 
	@awk 'BEGIN {FS = ":.*?#- "} /^[a-zA-Z_-]+:.*?#- / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

	
