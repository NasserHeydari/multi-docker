sudo: required
services:
  - docker

before_install:
  - docker build -t nasserheydari/react-test -f ./client/Dockerfile.dev ./client

script:
  - docker run nasserheydari/react-test npm test -- --coverage 

after_success:
  - docker build -t nasserheydari/multi-client ./client
  - docker build -t nasserheydari/multi-nginx ./nginx
  - docker build -t nasserheydari/multi-server ./server
  - docker build -t nasserheydari/multi-worker ./worker
