Class {
	#name : #IteratorsWrapper,
	#superclass : #Iterator,
	#instVars : [
		'wrappedIterators'
	],
	#category : #'Iterators-Wrappers'
}

{ #category : #testing }
IteratorsWrapper >> hasNext [
	^ (self wrappedIterators iterator 
			outputTo: #hasNext selectIt) hasNext
]

{ #category : #accessing }
IteratorsWrapper >> maximalUpToEndSize [
	^ ((self wrappedIterators iterator
			outputTo: #maximalUpToEndSize collectIt)
				outputTo: [ :x :y | x max: y ] reduceIt) next
]

{ #category : #accessing }
IteratorsWrapper >> next [
	^ (self wrappedIterators iterator outputTo: #next collectIt) upToEnd
]

{ #category : #accessing }
IteratorsWrapper >> peek [
	^ (self wrappedIterators iterator outputTo: #peek collectIt) upToEnd
]

{ #category : #accessing }
IteratorsWrapper >> wrappedIterators [
	^ wrappedIterators
]

{ #category : #accessing }
IteratorsWrapper >> wrappedIterators: anObject [
	wrappedIterators := anObject
]
