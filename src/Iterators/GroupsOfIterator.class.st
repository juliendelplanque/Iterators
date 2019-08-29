"
I provide a behaviour similar to SequenceableCollection>>#groupsOf:atATimeCollect: method.
"
Class {
	#name : #GroupsOfIterator,
	#superclass : #IteratorDecorator,
	#instVars : [
		'groupClass',
		'groupSize',
		'groupBuffer'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #private }
GroupsOfIterator >> bufferizeNext [
	groupBuffer := self decoratedIterator upTo: self groupSize as: self groupClass
]

{ #category : #accessing }
GroupsOfIterator >> defaultGroupClass [
	^ Array
]

{ #category : #accessing }
GroupsOfIterator >> groupClass [
	^ groupClass ifNil: [ groupClass := self defaultGroupClass ]
]

{ #category : #accessing }
GroupsOfIterator >> groupClass: anObject [
	groupClass := anObject
]

{ #category : #accessing }
GroupsOfIterator >> groupSize [
	^ groupSize
]

{ #category : #accessing }
GroupsOfIterator >> groupSize: anObject [
	groupSize := anObject
]

{ #category : #testing }
GroupsOfIterator >> hasNext [
	groupBuffer ifNil: [ self bufferizeNext ].
	
	^ groupBuffer size = self groupSize
]

{ #category : #accessing }
GroupsOfIterator >> maximalUpToEndSize [
	super maximalUpToEndSize isInfinite
		ifTrue: [ ^ super maximalUpToEndSize ].
	
	^ super maximalUpToEndSize // self groupSize
]

{ #category : #accessing }
GroupsOfIterator >> next [
	self checkHasNext.
	^ [ groupBuffer ]
		ensure: [ groupBuffer := nil ]
]

{ #category : #accessing }
GroupsOfIterator >> peek [
	self hasNext
		ifFalse: [ self signalAtEnd ].
		
	^ groupBuffer
]
