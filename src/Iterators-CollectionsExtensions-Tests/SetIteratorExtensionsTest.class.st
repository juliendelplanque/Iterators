Class {
	#name : #SetIteratorExtensionsTest,
	#superclass : #TestCase,
	#instVars : [
		'set'
	],
	#category : #'Iterators-CollectionsExtensions-Tests'
}

{ #category : #running }
SetIteratorExtensionsTest >> setUp [
	super setUp.
	set := #(1 2 3) asSet.
]

{ #category : #tests }
SetIteratorExtensionsTest >> testIterator [
	self assertCollection: (set iterator upToEndAs: Array) equals: (set collect: #yourself as: Array)
]

{ #category : #tests }
SetIteratorExtensionsTest >> testIteratorEmptySet [
	| emptySet |
	emptySet := Set new.
	self assert: emptySet iterator class equals: NullIterator.
	self assert: (emptySet iterator upToEndAs: Array) isEmpty.
]
