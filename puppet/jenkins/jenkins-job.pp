class { 'jenkins':
	config_hash => {
		   'JENKINS_PORT' => { 'value' => '9090' },
		   'HTTP_PORT' => { 'value' => '9090' },
		   'JENKINS_LISTEN_ADDRESS' => { 'value' => '0.0.0.0'},
		   'JENKINS_DEBUG_LEVEL' => { 'value' => 9 }
   }
}

jenkins::job { 'build':
	jobname => 'JenkinsJS',
	enabled => 1,
	config => template('/vagrant/puppet/jenkins/templates/job.config.xml.erb')
}
