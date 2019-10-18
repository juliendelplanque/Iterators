Class {
	#name : #OrderedDictionaryIteratorExtensionsTest,
	#superclass : #TestCase,
	#instVars : [
		'dictionary'
	],
	#category : #'Iterators-CollectionsExtensions-Tests'
}

{ #category : #running }
OrderedDictionaryIteratorExtensionsTest >> setUp [
	super setUp.
	dictionary := { $a -> 1. $b -> 2 . $c -> 3 } asOrderedDictionary.
]

{ #category : #tests }
OrderedDictionaryIteratorExtensionsTest >> testAssociationsIterator [
	self assertCollection: (dictionary associationsIterator upToEndAs: Array) equals: (dictionary associations as: Array)
]

{ #category : #tests }
OrderedDictionaryIteratorExtensionsTest >> testKeysIterator [
	self assertCollection: (dictionary keysIterator upToEndAs: Array) equals: (dictionary keys as: Array)
]

{ #category : #tests }
OrderedDictionaryIteratorExtensionsTest >> testValuesIterator [
	self assertCollection: (dictionary iterator upToEndAs: Array) equals: (dictionary collect: #yourself as: Array)
]
