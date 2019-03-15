Class {
	#name : #IteratorDecoratorWithBlock,
	#superclass : #IteratorDecorator,
	#instVars : [
		'block'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #'instance creation' }
IteratorDecoratorWithBlock class >> block: aBlock [
	^ self new
		block: aBlock;
		yourself
]

{ #category : #accessing }
IteratorDecoratorWithBlock >> block [
	^ block
]

{ #category : #accessing }
IteratorDecoratorWithBlock >> block: anObject [
	block := anObject
]
