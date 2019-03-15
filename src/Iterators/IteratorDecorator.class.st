"
I am an iterator decorating another iterator.

I am implemented using the decorator design pattern.

My subclasses can define additional behaviour to be done before or after delegating the action to the decorated iterator.

If I am used as is, I just delegate calls to #next, #peek and #hasNext to my #decoratedIterator.
"
Class {
	#name : #IteratorDecorator,
	#superclass : #Iterator,
	#instVars : [
		'decoratedIterator'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #'instance creation' }
IteratorDecorator class >> decorate: anIterator [
	^ self new
		decoratedIterator: anIterator;
		yourself
]

{ #category : #accessing }
IteratorDecorator >> decoratedIterator [
	^ decoratedIterator
]

{ #category : #accessing }
IteratorDecorator >> decoratedIterator: anObject [
	decoratedIterator := anObject
]

{ #category : #testing }
IteratorDecorator >> hasNext [
	^ self decoratedIterator hasNext
]

{ #category : #accessing }
IteratorDecorator >> next [
	^ self decoratedIterator next
]

{ #category : #accessing }
IteratorDecorator >> peek [
	^ self decoratedIterator peek
]
