.PHONY: test

test:
	wget --no-clobber https://github.com/SamagraX-RCW/identity/raw/main/vault/vault.json
	wget --no-clobber https://github.com/SamagraX-RCW/identity/raw/main/build/setup_vault_gha.sh 
	bash setup_vault_gha.sh docker-compose-test.yml vault-test
	docker-compose -f docker-compose-test.yml up -d identity-service-test
	docker-compose -f docker-compose-test.yml up --abort-on-container-exit credential-schema-test