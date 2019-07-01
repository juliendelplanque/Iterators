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

{ #category : #accessing }
NullIterator >> expectedUpToEndSize [
	^ 0
]

{ #category : #testing }
NullIterator >> hasNext [
	^ false
]

{ #category : #accessing }
NullIterator >> next [
	self signalAtEnd
]

{ #category : #accessing }
NullIterator >> peek [
	self signalAtEnd
]
