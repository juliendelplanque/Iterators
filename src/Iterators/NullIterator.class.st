"
I implement the null object design pattern for iterators.

- #hasNext always returns false
- #next and #peek always raises IteratorIsAtEnd error.
"
Class {
	#name : #NullIterator,
	#superclass : #Iterator,
	#category : #'Iterators-Core'
}

{ #category : #testing }
NullIterator >> hasNext [
	^ false
]

{ #category : #accessing }
NullIterator >> maximalUpToEndSize [
	^ 0
]

{ #category : #accessing }
NullIterator >> next [
	self signalAtEnd
]

{ #category : #accessing }
NullIterator >> peek [
	self signalAtEnd
]
