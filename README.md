# elevate

clothing ecommerce

setting up cors

go to google cloud console and select your project

search for terminal or shel and select the first link
insert this
nano cors.json
then press enter
gsutil cors set cors.json gs://elevate-a3dca.appspot.com
press enter

verify success?
gsutil cors get gs://elevate-a3dca.appspot.com
[{"maxAgeSeconds": 3600, "method": ["GET", "HEAD", "DELETE", "POST", "PUT"], "origin": ["*"], "responseHeader": ["Content-Type"]}]
meshacktempleton1@cloudshell:~ (elevate-a3dca)$ 