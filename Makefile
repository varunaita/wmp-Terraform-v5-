apply:
	git pull
	terraform init
	terraform apply -auto-approve

destroy:
	terraform init
	terraform destroy -auto-approve