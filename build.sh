#!/bin/bash

#https://medium.com/@nuves101/create-your-own-cocoapod-library-46a412b8987f

git commit
git tag 0.1.0
git push origin 0.1.0
pod spec lint UDWrapper.podspec
pod trunk push UDWrapper.podspec --allow-warnings