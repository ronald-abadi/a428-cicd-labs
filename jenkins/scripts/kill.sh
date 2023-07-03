#!/usr/bin/env sh

echo '------------------------------------------------------------'
echo 'DBS Foundation Coding Camp 2023 with Dicoding'
echo 'Belajar Implementasi CI/CD'
echo 'Deploy Stage, running kill.sh'
echo 'submission-cicd-pipeline-rabadi'
echo 'Run by Ronald Mulyono Abadi'
echo '------------------------------------------------------------'

echo 'The following command terminates the "npm start" process using its PID'
echo '(written to ".pidfile"), all of which were conducted when "deliver.sh"'
echo 'was executed.'
set -x
kill $(cat .pidfile)
