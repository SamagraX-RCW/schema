.PHONY: test

test:
	wget -qO- https://github.com/SamagraX-RCW/identity/raw/main/build/setup_vault_gha.sh | bash -s -- docker-compose-test.yml vault-test
	docker-compose up -d identity-service-test
	docker-compose up -d credential-schema-test --abort-on-container-exit