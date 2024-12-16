test:
	curl -X POST \
		 -H "Content-Type: application/json" \
		 -d '{"url": "http://localhost:8000/hello-world"}' \
		 http://localhost:8000/proxy

name:
	curl -X GET http://localhost:8000/info

integ:
	curl -X POST \
		 -H "Content-Type: application/json" \
		 -d '{"url": "http://helm-echo-app-staging-echoapp.helm-echo-app-staging:80/info"}' \
		 http://devapp.ganba.local/proxy
