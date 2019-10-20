"
I provide a behaviour similar to Collection>>#groupedBy: method.
"
Class {
	#name : #GroupedByIterator,
	#superclass : #IteratorDecorator,
	#traits : 'TIteratorDecoratorWithBlock',
	#classTraits : 'TIteratorDecoratorWithBlock classTrait',
	#instVars : [
		'groupedObjectsIterator'
	],
	#category : #'Iterators-Decorators-Decorators'
}

{ #category : #testing }
GroupedByIterator >> hasNext [
	groupedObjectsIterator
		ifNil: [ 	groupedObjectsIterator := ((self decoratedIterator upToEndAs: Array) groupedBy: self block) basicAssociationsIterator ].
		
	^ groupedObjectsIterator hasNext
]

{ #category : #accessing }
GroupedByIterator >> next [
	self checkHasNext.
	^ groupedObjectsIterator next
]

{ #category : #accessing }
GroupedByIterator >> peek [
	self checkHasNext.
	^ groupedObjectsIterator peek
]
