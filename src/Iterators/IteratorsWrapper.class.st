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
	^ ((self wrappedIterators iterator 
			decoratedBy: #hasNext collectIt)
				decoratedBy: [ :overallHasNext :hasNext | overallHasNext & hasNext ] reduceIt) next
]

{ #category : #accessing }
IteratorsWrapper >> maximalUpToEndSize [
	^ ((self wrappedIterators iterator
			decoratedBy: #maximalUpToEndSize collectIt)
				decoratedBy: [ :x :y | x max: y ] reduceIt) next
]

{ #category : #accessing }
IteratorsWrapper >> next [
	^ (self wrappedIterators iterator decoratedBy: #next collectIt) upToEnd
]

{ #category : #accessing }
IteratorsWrapper >> peek [
	^ (self wrappedIterators iterator decoratedBy: #peek collectIt) upToEnd
]

{ #category : #accessing }
IteratorsWrapper >> wrappedIterators [
	^ wrappedIterators
]

{ #category : #accessing }
IteratorsWrapper >> wrappedIterators: anObject [
	wrappedIterators := anObject
]
