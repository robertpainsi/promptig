#!/bin/bash
# The MIT License (MIT)
#
# Copyright (c) 2016 Robert Painsi
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
source testcase.sh

GIT_TESTCASE_CONFIG_GIT_REMOTE_REPOSITORY='promptig-remote-git-test-directory-ddf37'
GIT_TESTCASE_CONFIG_GIT_REPOSITORY='promptig-git-test-directory-ddf37'

function setUp() {
  rm -r -f ${GIT_TESTCASE_CONFIG_GIT_REMOTE_REPOSITORY}
  rm -r -f ${GIT_TESTCASE_CONFIG_GIT_REPOSITORY}

  mkdir ${GIT_TESTCASE_CONFIG_GIT_REMOTE_REPOSITORY}
  cd ${GIT_TESTCASE_CONFIG_GIT_REMOTE_REPOSITORY}
  git init --bare --quiet
  cd ..

  mkdir ${GIT_TESTCASE_CONFIG_GIT_REPOSITORY}
  cd ${GIT_TESTCASE_CONFIG_GIT_REPOSITORY}
  git clone ../${GIT_TESTCASE_CONFIG_GIT_REMOTE_REPOSITORY} &>/dev/null
  cd ${GIT_TESTCASE_CONFIG_GIT_REMOTE_REPOSITORY}

  echo '# The MIT License (MIT)\n#\n# Copyright (c) 2016 Robert Painsi' > LICENSE
  git add LICENSE &>/dev/null
  git commit -m 'Initil commit' &>/dev/null

  echo 'Add README' > README.md
  git add README.md &>/dev/null
  git commit -m 'Add Readme commit' &>/dev/null

  git push &>/dev/null
}

function tearDown() {
  cd ../..
  rm -r -f ${GIT_TESTCASE_CONFIG_GIT_REMOTE_REPOSITORY}
  rm -r -f ${GIT_TESTCASE_CONFIG_GIT_REPOSITORY}
}
