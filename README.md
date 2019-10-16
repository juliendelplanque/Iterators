# Iterators
[![Build Status](https://travis-ci.org/juliendelplanque/Iterators.svg?branch=master)](https://travis-ci.org/juliendelplanque/Iterators)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)

Implements Iterators for Pharo's Collections.

- [Install](#install)
- [Add Iterators as a dependency of your project](#add-iterators-as-a-dependency-of-your-project)
- [Documentation](#documentation)

## Install
```Smalltalk
Metacello new
	baseline: 'Iterators';
	repository: 'github://juliendelplanque/Iterators/src';
	load
```

## Add Iterators as a dependency of your project
To depend on Iterators `v1` major version, insert the following code snippet in your baseline:

```Smalltalk
[...]
spec
	baseline: 'Iterators'
	with: [ spec repository: 'github://juliendelplanque/Iterators:v1.x.x/src'].
[...]
```

To depend on a specific minor / patch version, tweak to `v1.x.x` fit your needs (for example `v1.2.0`).

> Note: This project use semantic versioning to define the releases. This means that each stable release of the project will be assigned a version number of the form `vX.Y.Z`. 
> 
> - **X** defines the major version number
> - **Y** defines the minor version number 
> - **Z** defines the patch version number
>
> When a release contains only bug fixes, the patch number increases. When the release contains new features that are backward compatible, the minor version increases. When the release contains breaking changes, the major version increases. 
>
> Thus, it should be safe to depend on a fixed major version and moving minor version of this project.

## Documentation

Checkout the [user documentation](documentation/UserGuide.md) to get started.
