node{


	stage("Checkout"){
		checkout(scm)
	}

	stage("Unit tests"){
		sh "./mvnw test"
	}

	stage("Build Docker Image"){
		sh "sudo docker build -t pipeline-demo ."
	}


}