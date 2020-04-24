"
Special kind of collect iterator that uses #perform:withArguments: to execute the method having #selector with #arguments on incoming objects.
"
Class {
	#name : #PerformCollectIterator,
	#superclass : #IteratorDecorator,
	#instVars : [
		'selector',
		'arguments'
	],
	#category : #'Iterators-Decorators-Decorators'
}

{ #category : #'instance creation' }
PerformCollectIterator class >> selector: selector [
	^ self new
		selector: selector;
		yourself
]

{ #category : #'instance creation' }
PerformCollectIterator class >> selector: selector arguments: arguments [
	^ self new
		selector: selector;
		arguments: arguments;
		yourself
]

{ #category : #accessing }
PerformCollectIterator >> arguments [
	^ arguments
]

{ #category : #accessing }
PerformCollectIterator >> arguments: anObject [
	arguments := anObject
]

{ #category : #initialization }
PerformCollectIterator >> initialize [
	super initialize.
	self arguments: #()
]

{ #category : #accessing }
PerformCollectIterator >> next [
	^ self decoratedIterator next perform: self selector withArguments: self arguments
]

{ #category : #accessing }
PerformCollectIterator >> peek [
	^ self decoratedIterator peek perform: self selector withArguments: self arguments
]

{ #category : #accessing }
PerformCollectIterator >> selector [
	^ selector
]

{ #category : #accessing }
PerformCollectIterator >> selector: anObject [
	selector := anObject
]
