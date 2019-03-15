Class {
	#name : #LinkedListIteratorExtensionsTest,
	#superclass : #TestCase,
	#instVars : [
		'linkedList'
	],
	#category : #'Iterators-CollectionsExtensions-Tests'
}

{ #category : #running }
LinkedListIteratorExtensionsTest >> setUp [
	super setUp.
	linkedList := LinkedList withAll: #(1 2 3).
]

{ #category : #tests }
LinkedListIteratorExtensionsTest >> testIterator [
	self assert: (linkedList iterator upToEndAs: Array) equals: (linkedList collect: #yourself as: Array)
]

{ #category : #tests }
LinkedListIteratorExtensionsTest >> testReversedIterator [
	self assert: (linkedList reversedIterator upToEndAs: Array) equals: (linkedList reversed collect: #yourself as: Array)
]
