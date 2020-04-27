# Iterators
[![Build Status](https://travis-ci.com/juliendelplanque/Iterators.svg?branch=master)](https://travis-ci.com/juliendelplanque/Iterators)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![pharo version](https://img.shields.io/badge/pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)
[![pharo version](https://img.shields.io/badge/pharo-9.0-%23aac9ff.svg)](https://pharo.org/download)


Implements Iterators for Pharo's Collections.

- [Install](#install)
- [Documentation](#documentation)
- [Add Iterators as a dependency of your project](#add-iterators-as-a-dependency-of-your-project)
- [Load a specific group](#load-a-specific-group)

## Install
```Smalltalk
Metacello new
	baseline: 'Iterators';
	repository: 'github://juliendelplanque/Iterators/src';
	load
```

## Documentation
Checkout the [user documentation](documentation/UserGuide.md) to get started.

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

## Load a specific group
It is possible to load only a sub-part of Iterators project.
The baseline defines the following groups:

- `kernel` : Contains abstract `Iterator` class a basic iterators.
- `trees` : Contains iterators for tree datastructure.
- `decorators` : Contains iterators decorators.
- `core` : `kernel` + `trees` + `decorators`
- `collections` : Contains extension methods on Pharo collections to get an iterator from a collection easily.
- `shell-dsl` : Contains the "shell DSL" for chaining iterators.
- `inspector-extensions` : Contains extensions to the GT inspector to show understandable views on iterator objects.
- `tests` : Contains tests for the library.
