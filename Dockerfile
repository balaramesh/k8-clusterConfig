#mkdir -p $HOME/.kube
#sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
#sudo chown $(id -u):$(id -g) $HOME/.kube/config



# kubeadm join 172.31.38.38:6443 --token jl0ezy.9pbk1wa1cg4n0u0f --discovery-token-ca-cert-hash sha256:a6c1246d3b620452d6495a884dbeba30584c30e815c93bdd7d64291cc1571f5d


# sudo docker build -t checkbox .
# sudo docker run --env-file env.txt -p 80:80 checkbox

FROM ubuntu:16.04
ADD checkboxsetup.yml .
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:ansible/ansible
RUN apt-get update
RUN apt-get install -y ansible git
EXPOSE 3002
EXPOSE 27017
EXPOSE 80
RUN ansible-playbook checkboxsetup.yml
CMD service nginx start && cd /home/ubuntu/checkbox.io/server-side/site/ && forever stopall && forever start server.js && tail -F /var/log/nginx/error.log
