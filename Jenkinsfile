node{


	stage("Checkout"){
		checkout(scm)
	}

	stage("Unit tests"){
		sh "./mvnw test"
	}

	stage("Build"){
		println "je veux faire du build"
	}


}