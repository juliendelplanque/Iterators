Class {
	#name : #SequenceableCollectionIteratorExtensionsTest,
	#superclass : #TestCase,
	#instVars : [
		'sequenceableCollection'
	],
	#category : #'Iterators-CollectionsExtensions-Tests'
}

{ #category : #running }
SequenceableCollectionIteratorExtensionsTest >> setUp [
	super setUp.
	sequenceableCollection := OrderedCollection withAll: #(1 2 3)
]

{ #category : #tests }
SequenceableCollectionIteratorExtensionsTest >> testIterator [
	self assertCollection: (sequenceableCollection iterator upToEndAs: Array) equals: (sequenceableCollection collect: #yourself as: Array)
]

{ #category : #tests }
SequenceableCollectionIteratorExtensionsTest >> testReversedIterator [
	self assert: (sequenceableCollection reversedIterator upToEndAs: Array) equals: (sequenceableCollection reversed collect: #yourself as: Array)
]
