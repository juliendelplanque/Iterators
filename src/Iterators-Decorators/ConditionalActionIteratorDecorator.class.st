"
My subclasses conditionally apply an action defined by my #block depending on the result of #conditionBlock evaluation with #next element and index provided as arguments.
"
Class {
	#name : #ConditionalActionIteratorDecorator,
	#superclass : #IteratorDecorator,
	#traits : 'TIteratorDecoratorWithBlock',
	#classTraits : 'TIteratorDecoratorWithBlock classTrait',
	#instVars : [
		'objectsSeenCount',
		'conditionBlock'
	],
	#category : #'Iterators-Decorators-Decorators'
}

{ #category : #accessing }
ConditionalActionIteratorDecorator >> conditionBlock [
	^ conditionBlock
]

{ #category : #accessing }
ConditionalActionIteratorDecorator >> conditionBlock: anObject [
	conditionBlock := anObject
]

{ #category : #'results-extraction' }
ConditionalActionIteratorDecorator >> extractResultsForIterator: iterator upTo: size [
	"In case of action iterators, usually people discard the result.
	 This method allows one to use an action iterator as results extractor that discard the result.
	
	
	"
	^ (iterator outputTo: self) upToEndDiscardingResult
]

{ #category : #initialization }
ConditionalActionIteratorDecorator >> initialize [
	super initialize.
	objectsSeenCount := 0.
	self conditionBlock: [ true ]
]

{ #category : #testing }
ConditionalActionIteratorDecorator >> shouldApplyActionOnNext [
	^ conditionBlock cull: objectsSeenCount cull: self peek
]
