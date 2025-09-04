node("ci-node"){


	stage("Checkout"){
		checkout(scm)
	}

	stage("Unit tests"){
		sh "./mvnw test"
	}

	stage("Build Docker Image"){
		sh "sudo docker build -t mchekini/pipeline-demo:1.0 ."
	}

	stage("Push Image To Registry"){
		withCredentials([usernamePassword(credentialsId: 'docker-credentials', passwordVariable: 'password', usernameVariable: 'username')]) {
			sh "sudo docker login -u $username -p $password"
			sh "sudo docker push mchekini/pipeline-demo:1.0"
			sh "sudo docker rmi mchekini/pipeline-demo:1.0"
        }
	}

	node("prod"){
		stage("deploy"){
			try{
				sh "sudo docker stop pipeline-demo"
				sh "sudo docker rm pipeline-demo"
				sh "sudo docker run --pull always --name pipeline-demo -p 8080:8080 -d mchekini/pipeline-demo:1.0"
			} catch (Exception e){
				sh "sudo docker run --pull always --name pipeline-demo -p 8080:8080 -d mchekini/pipeline-demo:1.0"
			}
		}
	}


}