"
I am an iterator that perform an action on incoming objects (execute my #block with the object provided as argument), discard the result of the action and return that incoming object.
"
Class {
	#name : #ActionIterator,
	#superclass : #IteratorDecorator,
	#traits : 'TIteratorDecoratorWithBlock',
	#classTraits : 'TIteratorDecoratorWithBlock classTrait',
	#category : #'Iterators-Decorators-Decorators'
}

{ #category : #accessing }
ActionIterator >> next [
	^ super next in: [ :next |
		self block value: next.
		next ]
]
