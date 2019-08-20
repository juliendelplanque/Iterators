"
I am the implementation of the null-object design pattern for an object that does nothing when #add: is sent to it.
"
Class {
	#name : #NullAddableObject,
	#superclass : #Object,
	#category : #'Iterators-Core'
}

{ #category : #adding }
NullAddableObject class >> add: anObject [
	"Does nothing. Implements null object design pattern."
]

{ #category : #adding }
NullAddableObject >> add: anObject [
	"Does nothing. Implements null object design pattern."
]
