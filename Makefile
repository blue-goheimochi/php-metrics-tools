.PHONY:
build:
	docker build -t php-metrics-tools .

.PHONY:
check:
	@if [[ -z "$$TARGET_DIR" ]]; then\
	    echo 'TARGET_DIRの環境変数を設定してください';\
	    echo 'ex: export TARGET_DIR=/Path/To/Target/Dir';\
	    exit 1;\
	else\
		echo "TARGET_DIR: $${TARGET_DIR}";\
	fi

.PHONY:
phpcpd: check
	@docker run --rm -v ${TARGET_DIR}:/app:ro -v ${PWD}:/work php-metrics-tools phpcpd --exclude "vendor" --exclude="tests" --exclude="storage" ./

.PHONY:
lizard: check
	@docker run --rm -v ${TARGET_DIR}:/app:ro -v ${PWD}:/work php-metrics-tools lizard -l php -s cyclomatic_complexity -x"*/vendor/*" -x"*/tests/*" -x"*/storage/*" ./

.PHONY:
churn: check
	@docker run --rm -v ${TARGET_DIR}:/app:ro -v ${PWD}:/work php-metrics-tools churn run --configuration=/work/config/churn.yml --ansi ./

.PHONY:
phpmd: check
	@docker run --rm -v ${TARGET_DIR}:/app:ro -v ${PWD}:/work php-metrics-tools phpmd --exclude "*vendor/*,*tests/*,*/storage/*,*/database/*" ./ ansi unusedcode

.PHONY:
phpstan: check
	@docker run --rm -v ${TARGET_DIR}:/app:ro -v ${PWD}:/work php-metrics-tools phpstan --memory-limit=2G analyze -c /work/config/phpstan.neon --ansi ./

.PHONY:
rector: check
	@docker run --rm -v ${TARGET_DIR}:/app:ro -v ${PWD}:/work php-metrics-tools rector process --dry-run --config=/work/config/rector.php --ansi

.PHONY:
phpmetrics: check
	@docker run --rm -v ${TARGET_DIR}:/app:ro -v ${PWD}:/work php-metrics-tools phpmetrics --config=/work/config/phpmetrics.yml ./

.PHONY:
composer-unused: check
	@docker run --rm -v ${TARGET_DIR}:/app:ro -v ${PWD}:/work php-metrics-tools composer-unused --ansi

.PHONY:
phpmnd: check
	@docker run --rm -v ${TARGET_DIR}:/app:ro -v ${PWD}:/work php-metrics-tools phpmnd ./ --exclude=vendor --exclude=tests --exclude=strage --ansi

.PHONY:
phpcs: check
	@docker run --rm -v ${TARGET_DIR}:/app:ro -v ${PWD}:/work php-metrics-tools phpcs --standard=/work/config/phpcs.xml --colors ./

.PHONY:
php-cs-fixer: check
	@docker run --rm -v ${TARGET_DIR}:/app:ro -v ${PWD}:/work php-metrics-tools php-cs-fixer fix ./ --dry-run --diff --ansi --config=/work/config/.php-cs-fixer.dist.php

.PHONY:
phpinsights: check
	@docker run --rm -v ${TARGET_DIR}:/app:ro -v ${PWD}:/work php-metrics-tools phpinsights analyse --config-path=/work/config/phpinsights.php --ansi ./

.PHONY:
test:
	bats tests/
