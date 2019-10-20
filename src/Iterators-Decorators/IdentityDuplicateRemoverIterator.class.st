"
I do the same as my superclass but I use identity (#==) to test if I already saw an object I encounter.
"
Class {
	#name : #IdentityDuplicateRemoverIterator,
	#superclass : #DuplicateRemoverIterator,
	#category : #'Iterators-Decorators-Decorators'
}

{ #category : #initialization }
IdentityDuplicateRemoverIterator >> initialize [
	super initialize.
	seen := IdentitySet new.
]
