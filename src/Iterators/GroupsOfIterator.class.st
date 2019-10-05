"
I provide a behaviour similar to SequenceableCollection>>#groupsOf:atATimeCollect: method.
"
Class {
	#name : #GroupsOfIterator,
	#superclass : #BufferizedIterator,
	#instVars : [
		'groupClass',
		'groupSize'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #private }
GroupsOfIterator >> bufferizeNext [
	buffer := self decoratedIterator upTo: self groupSize as: self groupClass
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
	buffer ifNil: [ self bufferizeNext ].
	
	^ buffer size = self groupSize
]

{ #category : #accessing }
GroupsOfIterator >> maximalUpToEndSize [
	^ super maximalUpToEndSize // self groupSize
]
