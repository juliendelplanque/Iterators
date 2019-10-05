# Iterators
[![Build Status](https://travis-ci.org/juliendelplanque/Iterators.svg?branch=master)](https://travis-ci.org/juliendelplanque/Iterators)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)

Implements Iterators for Pharo's Collections.

- [Install](#install)
- [Documentation](#documentation)
- [Version management](#version-management)

## Install
```Smalltalk
Metacello new
	baseline: 'Iterators';
	repository: 'github://juliendelplanque/Iterators/src';
	load
```

## Documentation

Checkout the [user documentation](documentation/UserGuide.md) to get started.

## Version management 

This project use semantic versioning to define the releases. This means that each stable release of the project will be assigned a version number of the form `vX.Y.Z`. 

- **X** defines the major version number
- **Y** defines the minor version number 
- **Z** defines the patch version number

When a release contains only bug fixes, the patch number increases. When the release contains new features that are backward compatible, the minor version increases. When the release contains breaking changes, the major version increases. 

Thus, it should be safe to depend on a fixed major version and moving minor version of this project.
