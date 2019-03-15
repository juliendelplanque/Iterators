Class {
	#name : #DictionaryIteratorExtensionsTest,
	#superclass : #TestCase,
	#instVars : [
		'dictionary'
	],
	#category : #'Iterators-CollectionsExtensions-Tests'
}

{ #category : #running }
DictionaryIteratorExtensionsTest >> setUp [
	super setUp.
	dictionary := { $a -> 1. $b -> 2 . $c -> 3 } asDictionary.
]

{ #category : #tests }
DictionaryIteratorExtensionsTest >> testAssociationsIterator [
	self assertCollection: (dictionary associationsIterator upToEndAs: Array) equals: (dictionary associations as: Array)
]

{ #category : #tests }
DictionaryIteratorExtensionsTest >> testKeysIterator [
	self assertCollection: (dictionary keysIterator upToEndAs: Array) equals: (dictionary keys as: Array)
]

{ #category : #tests }
DictionaryIteratorExtensionsTest >> testValuesIterator [
	self assertCollection: (dictionary iterator upToEndAs: Array) equals: (dictionary collect: #yourself as: Array)
]
