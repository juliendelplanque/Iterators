Class {
	#name : #DoubleLinkedListIteratorExtensionsTest,
	#superclass : #TestCase,
	#instVars : [
		'doubleLinkedList'
	],
	#category : #'Iterators-CollectionsExtensions-Tests'
}

{ #category : #running }
DoubleLinkedListIteratorExtensionsTest >> setUp [
	super setUp.
	doubleLinkedList := DoubleLinkedList new
								addAll: #(1 2 3);
								yourself
]

{ #category : #tests }
DoubleLinkedListIteratorExtensionsTest >> testIterator [
	self
		assert: (doubleLinkedList iterator upToEndAs: Array)
		equals: (OrderedCollection new addAll: (doubleLinkedList); asArray) "Hack because DoubleLinkedList does not inherit from sequenceable collection..."
]

{ #category : #tests }
DoubleLinkedListIteratorExtensionsTest >> testReversedIterator [
	self
		assert: (doubleLinkedList reversedIterator upToEndAs: Array)
		equals: (OrderedCollection new addAll: doubleLinkedList; asArray) reversed "Hack because DoubleLinkedList does not inherit from sequenceable collection..."
]
