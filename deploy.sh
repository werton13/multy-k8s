docker build -t werton13/multi-client:latest -t werton13/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t werton13/multi-server:latest -t werton13/multi-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t werton13/multi-worker:latest -t werton13/multi-worker:$GIT_SHA -f ./worker/Dockerfile ./worker
docker push werton13/multi-client:latest
docker push werton13/multi-server:latest
docker push werton13/multi-worker:latest
docker push werton13/multi-client:$GIT_SHA
docker push werton13/multi-server:$GIT_SHA
docker push werton13/multi-worker:$GIT_SHA
kubectl apply -f K8s
kubectl set image  deployments/server-deployment server=werton13/multi-server:$GIT_SHA
kubectl set image  deployments/client-deployment client=werton13/multi-client:$GIT_SHA
kubectl set image  deployments/worker-deployment worker=werton13/multi-worker:$GIR_SHA


