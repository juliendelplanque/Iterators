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

{ #category : #iterators }
IteratorDecorator >> dataflowOrderIteratorsIterator [
	^ ReverseLinkedListIterator on: self nextLinkBlock: [ :iterator | iterator decoratedIterator ]
]

{ #category : #accessing }
IteratorDecorator >> decorate: anIterator [
	"To make instance-side and class-side polymorphic."
	self decoratedIterator: anIterator
]

{ #category : #accessing }
IteratorDecorator >> decoratedIterator [
	^ decoratedIterator
]

{ #category : #accessing }
IteratorDecorator >> decoratedIterator: anObject [
	decoratedIterator := anObject
]

{ #category : #iterators }
IteratorDecorator >> decoratedIteratorsIterator [
	^ LinkedListIterator on: self nextLinkBlock: [ :iterator | iterator decoratedIterator ]
]

{ #category : #accessing }
IteratorDecorator >> expectedUpToEndSize [
	^ self decoratedIterator expectedUpToEndSize
]

{ #category : #'gt-inspector-extension' }
IteratorDecorator >> gtInspectorItemsIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite fastTable
		title: 'Iterators composition';
		display: [ self dataflowOrderIteratorsIterator upToEnd ];
		beMultiple;
		enableElementIndex;
		wantsAutomaticRefresh: true;
		column: 'Data flow order' evaluated: [ :value :idex | idex asString ] width: 100;
		column: 'Item' evaluated: [ :value | GTObjectPrinter asTruncatedTextFrom: value ]";
		send: [ :result | 
			result isNil
				ifTrue: [ nil ]
				ifFalse: [ result size = 1 
					ifTrue: [result anyOne ]  
					ifFalse: [self species withAll: result]]]"
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
