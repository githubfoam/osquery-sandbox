
deploy-debian-bento-centos:
	bash scripts/deploy-debian-bento-centos.sh

deploy-debian-bento-fedora:
	bash scripts/deploy-debian-bento-fedora.sh

deploy-freebsd:
	bash scripts/deploy-freebsd.sh

deploy-debian-bento-ubuntu:
	bash scripts/deploy-debian-bento-ubuntu.sh

deploy-debian-bento-ppc64:
	bash scripts/deploy-debian-bento-ppc64.sh

deploy-debian-jessie:
	bash scripts/deploy-debian-jessie.sh

deploy-debian-bento-stretch:
	bash scripts/deploy-debian-bento-stretch.sh

deploy-debian-stretch:
	bash scripts/deploy-debian-stretch.sh

deploy-debian-bento-buster:
	bash scripts/deploy-debian-bento-buster.sh

deploy-debian-buster:
	bash scripts/deploy-debian-buster.sh

deploy-libvirt:
	bash scripts/deploy-libvirt.sh

deploy-vagrant:
	bash scripts/deploy-vagrant.sh

push-image:
	docker push $(IMAGE)

.PHONY: deploy-vagrant deploy-libvirt 