CHDIR=-chdir=./terraform/

.PHONY: all ansible terraform clear

all: ansible

ansible: terraform
	@echo "\033[34mWATING FOR VM....:) \033[0m\n"
	@sleep 30
	ansible-playbook -i ansible/inventory ansible/setup_playbook.yaml

terraform:
	@if [ ! -f ./terraform/vars.tfvars ]; then \
		echo "Error: vars.tfvars not found!"; \
		exit 1; \
	fi
	@if [ ! -f ./terraform/script.sh ]; then \
		echo "Error: script.sh not found!"; \
		exit 1; \
	fi
	terraform $(CHDIR) init
	terraform $(CHDIR) plan -var-file vars.tfvars
	terraform $(CHDIR) apply -var-file vars.tfvars -auto-approve
	bash ./terraform/script.sh

clear:
	terraform $(CHDIR) destroy -var-file vars.tfvars -auto-approve