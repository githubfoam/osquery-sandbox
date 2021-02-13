IMAGE := alpine/fio
APP:="app/deploy-openesb.sh"

deploy-jenkins:
	bash app/deploy-jenkins.sh

deploy-kong:
	bash app/deploy-kong.sh

deploy-chaosmesh:
	bash app/deploy-chaosmesh.sh

deploy-elk:
	bash app/deploy-elk.sh

deploy-efk:
	bash app/deploy-efk.sh

provision-helm:
	bash app/provision-helm.sh

provision-kubectl:
	bash app/provision-kubectl.sh

provision-minikube:
	bash app/provision-minikube.sh

deploy-boxes:
	bash scripts/deploy-boxes.sh

deploy-libvirt:
	bash scripts/deploy-libvirt.sh

deploy-vagrant:
	bash scripts/deploy-vagrant.sh
	
deploy-minikube-gardener:
	bash app/deploy-minikube_gardener.sh

deploy-cilium:
	bash app/deploy-cilium.sh

deploy-vegeta:
	bash app/deploy-vegeta.sh

deploy-locust:
	bash app/deploy-locust.sh

deploy-ebf:
	bash app/deploy-ebf.sh

deploy-weavescope:
	bash app/deploy-weavescope.sh

deploy-gluster:
	bash app/deploy-gluster.sh

deploy-minikube-latest:
	bash app/deploy-minikube_latest.sh

deploy-minikube:
	bash app/deploy-minikube.sh

deploy-kubeflow:
	bash app/deploy-kubeflow.sh

deploy-openesb:
	bash app/deploy-openesb.sh

deploy-dashboard:
	bash app/deploy-dashboard.sh

push-image:
	docker push $(IMAGE)
.PHONY: deploy-openesb deploy-dashboard push-image
