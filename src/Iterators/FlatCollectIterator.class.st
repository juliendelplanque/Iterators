"
I flatten objects coming from the iterator I wrap by iterating on their #iterator and return objects transformed by my #block.
"
Class {
	#name : #FlatCollectIterator,
	#superclass : #FlattenIterator,
	#traits : 'TIteratorDecoratorWithBlock',
	#classTraits : 'TIteratorDecoratorWithBlock classTrait',
	#category : #'Iterators-Decorators'
}

{ #category : #private }
FlatCollectIterator >> retrieveSubIterator [
	^ super retrieveSubIterator
		outputTo: self block collectIt
]
