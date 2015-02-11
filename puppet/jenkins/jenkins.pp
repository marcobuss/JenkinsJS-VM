include gcc


class { 'jenkins':
	   config_hash => {
		   'JENKINS_PORT' => { 'value' => '9090' },
		   'HTTP_PORT' => { 'value' => '9090' },
		   'JENKINS_LISTEN_ADDRESS' => { 'value' => '0.0.0.0'},
		   'JENKINS_DEBUG_LEVEL' => { 'value' => 9 }
   }
}

jenkins::plugin { 'nodejs':
	manage_config   => true,
	config_content 	=> template('/vagrant/puppet/jenkins/templates/nodejs.config.xml.erb'),
	config_filename => 'nodejs.xml'
}

class { 'git':
} ->

jenkins::plugin { 'scm-api':
} ->

jenkins::plugin { 'git-client':
} ->

jenkins::plugin { 'git':
    manage_config   => true,
    config_filename => 'hudson.plugins.git.GitSCM.xml',
    config_content  => template('/vagrant/puppet/jenkins/templates/git.config.xml.erb'),
} ->

jenkins::plugin { 'analysis-core':
} ->

jenkins::plugin { 'checkstyle':
} ->

jenkins::plugin { 'cobertura':
} ->

jenkins::plugin { 'ws-cleanup':
} 