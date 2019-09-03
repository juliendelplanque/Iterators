Class {
	#name : #IteratorsMerger,
	#superclass : #IteratorsWrapper,
	#traits : 'TIteratorDecoratorWithBlock',
	#classTraits : 'TIteratorDecoratorWithBlock classTrait',
	#category : #'Iterators-Wrappers'
}

{ #category : #accessing }
IteratorsMerger >> next [
	^ self block valueWithArguments: super next
]

{ #category : #accessing }
IteratorsMerger >> peek [
	^ self block valueWithArguments: super peek
]
