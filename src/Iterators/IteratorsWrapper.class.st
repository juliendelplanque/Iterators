Class {
	#name : #IteratorsWrapper,
	#superclass : #Iterator,
	#instVars : [
		'wrappedIterators'
	],
	#category : #'Iterators-Wrappers'
}

{ #category : #accessing }
IteratorsWrapper >> expectedUpToEndSize [
	^ (self wrappedIterators iterator
			| #expectedUpToEndSize collectIt
			| [ :x :y | x max: y ] reduceIt) next
]

{ #category : #testing }
IteratorsWrapper >> hasNext [
	^ (self wrappedIterators iterator
		| #hasNext collectIt
		| [ :bool1 :bool2 | bool1 | bool2 ] reduceIt) next
]

{ #category : #accessing }
IteratorsWrapper >> next [
	^ self wrappedIterators iterator
		| #next collectIt
		> Array
]

{ #category : #accessing }
IteratorsWrapper >> peek [
	^ self wrappedIterators iterator
		| #peek collectIt
		> Array
]

{ #category : #accessing }
IteratorsWrapper >> wrappedIterators [
	^ wrappedIterators
]

{ #category : #accessing }
IteratorsWrapper >> wrappedIterators: anObject [
	wrappedIterators := anObject
]
