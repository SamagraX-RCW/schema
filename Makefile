.PHONY: test

test:
	wget https://github.com/SamagraX-RCW/identity/raw/main/vault/vault.json
	wget -qO- https://github.com/SamagraX-RCW/identity/raw/main/build/setup_vault_gha.sh | bash -s -- docker-compose-test.yml vault-test
	docker-compose -f docker-compose-test.yml up -d identity-service-test
	docker-compose -f docker-compose-test.yml up -d credential-schema-test --abort-on-container-exit